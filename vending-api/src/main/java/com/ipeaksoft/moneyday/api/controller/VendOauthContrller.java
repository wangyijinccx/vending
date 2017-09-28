package com.ipeaksoft.moneyday.api.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.api.service.WechatWeiXinService;
import com.ipeaksoft.moneyday.api.wxpay.WxPayUtil;

/**
 * @author sxy 2015年4月20日 下午5:00:03
 * 
 */
@Controller
@RequestMapping(value = "/oauth")
public class VendOauthContrller extends BaseController {
	
	@Autowired
	WechatWeiXinService wechatWeiXinService;

	/**
	 * 获取code_url
	 * @param goodId
	 * @param companyId
	 * @param price
	 * @param num
	 */
	@ResponseBody
	@RequestMapping(value = "oauth")
	public String oauth(String goodId) {
		// 价格可以从数据库取 也可以页面传，先考虑页面传
		String url = "";
		try {
			String redirectUrl = "/oauth/code";
			redirectUrl = URLEncoder.encode(redirectUrl, "UTF-8");
			url = wechatWeiXinService.getRequestCodeUrl(redirectUrl, "snsapi_base",
					goodId);
		} catch (UnsupportedEncodingException e) {
		}
		return url;
	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "code")
	public Object code() {
		JSONObject result = new JSONObject();
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		JSONObject json = JSONObject.parseObject(state);
		String openId = wechatWeiXinService.getOpenid(code);
		//生成订单
		
		
		//获取订单信息
		String orderId = "";
		String notifyUrl="";
		String price = "";//单价乘以数量 从json获取
		
		String ip =WxPayUtil.getIpAddr(request);
		Map<String, String> resultMap = (Map<String, String>) wechatWeiXinService.unifiedorder(orderId, price, ip, notifyUrl, openId);
		String returnCode = resultMap.get("return_code");
		String resultCode = resultMap.get("result_code");
		if (returnCode.equalsIgnoreCase("SUCCESS")
				&& resultCode.equalsIgnoreCase("SUCCESS")) {
			// 下单成功
		} else {
			// 下单失败

		}
		
		return result;
	}

}
