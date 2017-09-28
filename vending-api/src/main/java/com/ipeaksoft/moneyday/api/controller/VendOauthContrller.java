package com.ipeaksoft.moneyday.api.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.api.service.WechatWeiXinService;
import com.ipeaksoft.moneyday.api.wxpay.WxPayUtil;
import com.ipeaksoft.moneyday.core.entity.CommMemCash;
import com.ipeaksoft.moneyday.core.sdk.duiba.Constant;
import com.ipeaksoft.moneyday.core.service.CommMemCashService;

/**
 * @author sxy 2015年4月20日 下午5:00:03
 * 
 */
@Controller
@RequestMapping(value = "/oauth")
public class VendOauthContrller extends BaseController {

	@Autowired
	WechatWeiXinService wechatWeiXinService;
	@Autowired
	CommMemCashService commMemCashService;

	/**
	 * 获取code_url
	 * 
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
			url = wechatWeiXinService.getRequestCodeUrl(redirectUrl,
					"snsapi_base", goodId);
		} catch (UnsupportedEncodingException e) {
		}
		return url;
	}

	/**
	 * 授权跳转接口，然后调整交易界面
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "code")
	public Object code() {
		JSONObject result = new JSONObject();
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		String openId = wechatWeiXinService.getOpenid(code);
		// 跳转页面，带参数
		return result;
	}

	/**
	 * 统一下单 保存订单
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "pay")
	public Object pay() {
		JSONObject result = new JSONObject();
		// 生成订单 没考虑失败的情况
		int balance = Integer.parseInt(request.getParameter("balance"));// 金额
		String openId = request.getParameter("openId");

		String out_biz_no = UUID.randomUUID().toString().replace("-", "");
		CommMemCash userCash = new CommMemCash();
		userCash.setOrderid(out_biz_no); // 订单号
		userCash.setDescription("微信提现：" + balance + "元"); // 插入当前订单的详细描述
		userCash.setOpenid(openId);
		userCash.setAmount(balance); // 插入当前订单的提现金额
		userCash.setOperator(Constant.SYSTEM); // 插入处理人，系统处理
		userCash.setStatus(Byte.valueOf(Constant.ALIPAY_SUCCESS)); // 插入订单状态:成功
		userCash.setType((byte) 1);// 微信支付
		userCash.setCreateTime(new Date()); // 插入当前日期
		commMemCashService.insertSelective(userCash);

		// 获取订单信息
		String orderId = "";
		String notifyUrl = "";
		String price = "";// 单价乘以数量 从json获取

		String ip = WxPayUtil.getIpAddr(request);
		Map<String, String> resultMap = (Map<String, String>) wechatWeiXinService
				.unifiedorder(orderId, price, ip, notifyUrl, openId);
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