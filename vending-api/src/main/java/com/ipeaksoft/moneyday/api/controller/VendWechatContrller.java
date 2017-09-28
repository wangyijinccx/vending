package com.ipeaksoft.moneyday.api.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.StringReader;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Unmarshaller;

import org.apache.commons.codec.digest.DigestUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.api.model.Message;
import com.ipeaksoft.moneyday.api.service.MessageHanlerService;
import com.ipeaksoft.moneyday.api.service.WechatWeiXinService;
import com.ipeaksoft.moneyday.core.entity.VendCompany;
import com.ipeaksoft.moneyday.core.service.HttpService;
import com.ipeaksoft.moneyday.core.service.VendCompanyService;

/**
 * @author sxy 2015年4月20日 下午5:00:03
 * 
 */
@Controller
public class VendWechatContrller extends BaseController {
	private static final String AUTH_TOKEN = "xiguamei";

	@Autowired
	MessageHanlerService handler;
	@Autowired
	WechatWeiXinService wechatWeiXinService;
	@Autowired
	HttpService httpService;
	@Autowired
	VendCompanyService vendCompanyService;

	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping(value = "wechat")
	public Object index() {
		String signature = request.getParameter("signature");
		String timestamp = request.getParameter("timestamp");
		String nonce = request.getParameter("nonce");
		List<String> list = new ArrayList<String>();
		list.add(AUTH_TOKEN);
		list.add(timestamp);
		list.add(nonce);
		logger.info(list.toString());
		Collections.sort(list);// 参数排序
		String str = "";
		for (String s : list) {
			str = str + s;
		}
		String mySign = DigestUtils.shaHex(str);
		if (!signature.equals(mySign)) {
			// 签名错误
			logger.error("Signature error:signature:{}; mySign:{}", signature,
					mySign);
			return null;
		}

		// 当echostr不为空时，验证接口配置信息，直接返回echostr表示接口有效。
		String echostr = request.getParameter("echostr");
		if (StringUtils.isNotEmpty(echostr)) {
			return echostr;
		}

		String xml = getRequestXmlData(request);
		logger.info("receive data: " + xml);

		try {
			JAXBContext jc = JAXBContext.newInstance(Message.class);
			Unmarshaller unmar = jc.createUnmarshaller();
			Message message = (Message) unmar.unmarshal(new StringReader(xml));
			return handler.handler(message);
		} catch (JAXBException e) {
			logger.error("ERROR:", e);
		}

		return "";
	}

	/**
	 * 下载二维码图片到本地
	 * 
	 * @param companyId
	 * @return
	 * @throws Exception
	 */
	@ResponseBody
	@RequestMapping(value = "downcode")
	public Object downCode(Integer companyId) throws Exception {
		JSONObject result = new JSONObject();
		File file = new File(PATH);
		if (!file.exists()) {
			file.mkdir();
		}
		JSONObject callback = (JSONObject) wechatWeiXinService.downCode(
				companyId, PATH);
		if (null == callback || !"200".equals(callback.getString("result"))) {
			result.put("result", callback.getString("result"));
			result.put("msg", callback.getString("msg"));
			return result;
		}
		result.put("result", 200);
		result.put("msg", "获取二维码成功");
		return result;
	}

	/**
	 * 保存二维URL到数据库
	 * 
	 * @param companyId
	 * @param path
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "readcode")
	public Object readCode(Integer companyId) {
		JSONObject result = new JSONObject();
		// 判断是否有二维码
		VendCompany model = vendCompanyService.selectByPrimaryKey(companyId);
		if (null != model && null != model.getCode()
				&& !"".equals(model.getCode())) {
			result.put("result", 200);
			result.put("msg", "获取二维码成功");
			result.put("code", model.getCode());
			return result;
		}
		// 获取access_token
		String token = wechatWeiXinService.getTokenGlobal();
		// 永久字符串型二维码
		String codeInfo = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": "
				+ companyId + "}}}";
		String url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="
				+ token;
		String callback = httpService.postJson(url, codeInfo);
		JSONObject json = JSONObject.parseObject(callback);
		if (null == json) {
			result.put("result", 301);
			result.put("msg", "获取二维码失败");
			return result;
		}
		String ticket = json.getString("ticket");
		String codeUrl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="
				+ ticket;
		// 保存二维码
		VendCompany vc = new VendCompany();
		vc.setId(companyId);
		vc.setCode(codeUrl);
		vc.setUpdateTime(new Date());
		vendCompanyService.updateByPrimaryKeySelective(vc);
		result.put("result", 200);
		result.put("msg", "获取二维码成功");
		result.put("code", codeUrl);
		return result;
	}

	private String getRequestXmlData(HttpServletRequest request) {
		InputStream is = null;
		String requestXmlData = null;
		try {
			is = request.getInputStream();
			// 取HTTP请求流长度
			int size = request.getContentLength();
			// 用于缓存每次读取的数据
			byte[] buffer = new byte[size];
			// 用于存放结果的数组
			byte[] xmldataByte = new byte[size];
			int count = 0;
			int rbyte = 0;
			// 循环读取
			while (count < size) {
				// 每次实际读取长度存于rbyte中
				rbyte = is.read(buffer);
				for (int i = 0; i < rbyte; i++) {
					xmldataByte[count + i] = buffer[i];
				}
				count += rbyte;
			}
			requestXmlData = new String(xmldataByte, "UTF-8");
		} catch (IOException e) {
			logger.error("ERROR:", e);
		} finally {
			if (is != null) {
				try {
					is.close();
				} catch (IOException e) {
					logger.error("ERROR:", e);
				}
			}
		}
		return requestXmlData;
	}

}
