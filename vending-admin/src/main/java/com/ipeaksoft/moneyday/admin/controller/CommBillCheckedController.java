package com.ipeaksoft.moneyday.admin.controller;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import java.util.Map.Entry;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.math.NumberUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.ipeaksoft.moneyday.admin.util.BillUtil;
import com.ipeaksoft.moneyday.admin.util.CommonUtil;
import com.ipeaksoft.moneyday.admin.util.DateUtil;
import com.ipeaksoft.moneyday.admin.wxpay.WxPayConfig;
import com.ipeaksoft.moneyday.admin.wxpay.WxPayUtil;
import com.ipeaksoft.moneyday.admin.wxpay.XMLUtil;
import com.ipeaksoft.moneyday.core.entity.CommMemCash;
import com.ipeaksoft.moneyday.core.entity.CommMemCashApprove;
import com.ipeaksoft.moneyday.core.entity.CommStatWxCash;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.entity.CommUserQdjl;
import com.ipeaksoft.moneyday.core.entity.UserCashOrder;
import com.ipeaksoft.moneyday.core.sdk.duiba.Constant;
import com.ipeaksoft.moneyday.core.service.CommMemCashApproveService;
import com.ipeaksoft.moneyday.core.service.CommMemCashService;
import com.ipeaksoft.moneyday.core.service.CommStatWxCashService;
import com.ipeaksoft.moneyday.core.service.CommUserDayService;
import com.ipeaksoft.moneyday.core.service.CommUserQdjlService;
import com.ipeaksoft.moneyday.core.service.CommUserService;

@Controller
@RequestMapping(value = "/bill/checked")
public class CommBillCheckedController extends BaseController {

	@Autowired
	CommStatWxCashService commStatWxCashService;
	@Autowired
	CommMemCashService commMemCashService;
	@Autowired
	CommUserService commUserService;
	@Autowired
	CommUserDayService commUserDayService;
	@Autowired
	CommMemCashApproveService commMemCashApproveService;
	@Autowired
	CommUserQdjlService commUserQdjlService;

	BillUtil billUtil = new BillUtil();
	Pattern p = Pattern.compile("^((13[0-9])|(15[^4,\\D])|(18[0,5-9]))\\d{8}$");
	private Lock lock = new ReentrantLock();

	@RequestMapping(value = "/list")
	public String Checked(HttpServletRequest request) {
		Integer totalmoney = commStatWxCashService.getAllMoney();
		totalmoney = (null == totalmoney) ? 0 : totalmoney;
		request.setAttribute("totalmoney", totalmoney);
		return "/bill/checked";
	}

	@RequestMapping(value = "/daylist")
	public String daylist(HttpServletRequest request) {
		String date = request.getParameter("day");
		request.getSession().setAttribute("day", date);
		return "/bill/daychecked";
	}

	@RequestMapping(value = "/checking")
	public String checking(HttpServletRequest request) {
		request.setAttribute("token", request.getParameter("token"));
		return "/bill/checking";
	}

	@ResponseBody
	@RequestMapping(value = "/data_load")
	public String load_data(HttpServletRequest request) {
		String draw = request.getParameter("draw");// 搜索内容
		Map<String, Object> paramMap = billUtil.getWhereMap(request);
		int total = commStatWxCashService.countAllByWhere(paramMap);
		Date date = null;
		if (0 == total) {
		} else {
			// 数据库有昨天以前的所有数据，则读取昨天和当天的数据，保存昨天的数据并合并三者来显示
			Calendar calendar = Calendar.getInstance();
			calendar.setTime(new Date());
			calendar.add(Calendar.DAY_OF_YEAR, -15);
			date = calendar.getTime();
		}

		// 统计用户的兑换信息,并封装到Map中
		List<UserCashOrder> list = commMemCashService.selectOrderByDay(date);
		Map<Date, CommStatWxCash> map = new HashMap<Date, CommStatWxCash>();
		for (UserCashOrder userCashOrder : list) {
			Date day = userCashOrder.getDay();
			CommStatWxCash statWxCash = null;
			if (map.containsKey(day)) {
				statWxCash = map.get(day);
				map.remove(day);
			} else {
				statWxCash = new CommStatWxCash();
			}

			statWxCash.setAmount(userCashOrder.getAmount());
			statWxCash.setTimes(userCashOrder.getTimes());
			map.put(day, statWxCash);
		}

		for (Entry<Date, CommStatWxCash> entry : map.entrySet()) {
			Date day = entry.getKey();
			CommStatWxCash cash = entry.getValue();
			int wrong = commMemCashService.selectCountByStatus(day);
			cash.setDay(day);
			cash.setPendingCount(wrong);
			CommStatWxCash commStatWxCash = commStatWxCashService
					.selectByPrimaryKey(day);
			if (null == commStatWxCash) {
				commStatWxCashService.addNew(cash); // 插入今天、昨天的数据到数据库
				if (0 == CommonUtil.compareDay(day, new Date())) {
					total += 1; // 如果是今天的数据插入成功，则总数加1
				}
			} else { // 如果已存在记录，则更新记录
				int update = commStatWxCashService.updateUser(cash);
				if (1 != update) {
					update = commStatWxCashService.updateUser(cash);
				}
			}
		}
		List<CommStatWxCash> statcashs = commStatWxCashService
				.getPageByDay(paramMap);
		JSONArray jsonArray = new JSONArray();
		for (CommStatWxCash _statWxCash : statcashs) {
			JSONObject jsonObject = new JSONObject();
			String day = DateUtil.date2Str("yyyy-MM-dd", _statWxCash.getDay());
			jsonObject.put("day", day);
			jsonObject.put("amount", _statWxCash.getAmount());
			jsonObject.put("times", _statWxCash.getTimes());
			jsonObject.put("pendingCount", _statWxCash.getPendingCount());
			jsonArray.add(jsonObject);
		}
		int size = statcashs.size();
		JSONObject result = billUtil.formatResult(draw, total, jsonArray, size);
		logger.info(result.toString());
		return result.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/data_load_day")
	public String load_data_day(HttpServletRequest request) {
		int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
		int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
		String draw = request.getParameter("draw");// 搜索内容
		String searchContent = request.getParameter("search[value]");// 昵称或者手机号
		String num = request.getParameter("amount");
		int am = NumberUtils.toInt(num);
		String mobile = null;
		String nickname = null;
		if (StringUtils.isNotBlank(searchContent)) {
			Matcher m = p.matcher(searchContent);
			if (m.matches()) {
				mobile = searchContent;
			} else {
				nickname = searchContent;
			}
		}
		String startDate = request.getParameter("day");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = null;
		try {
			date = format.parse(startDate);
		} catch (ParseException e1) {
			date = new Date();
		}
		Calendar calendar = new GregorianCalendar();
		calendar.setTime(date);
		calendar.add(Calendar.DATE, 1);
		date = calendar.getTime();
		String endDate = format.format(date);

		List<Map<Object, Object>> list = commMemCashService.getPageByday(
				startDate, endDate, mobile, nickname, am, start, pageSize);
		int total = commMemCashService.countPageByDay(startDate, endDate,
				mobile, nickname, am);
		JSONArray jsonArray = new JSONArray();
		Set<String> tokens = new HashSet<>();
		for (Map<Object, Object> map : list) {
			JSONObject jsonObject = new JSONObject();
			String token = (String) map.get("token");
			Integer uwcid = (Integer) map.get("id");
			tokens.add(token);
			String day = DateUtil.date2Str("HH:mm:ss",
					(Date) map.get("create_time"));
			jsonObject.put("uwcid", uwcid);
			jsonObject.put("day", day);
			jsonObject.put("id", token);
			jsonObject.put("orderid", map.get("orderid"));
			jsonObject.put("mobile",
					map.containsKey("userphone") ? map.get("userphone") : "");
			jsonObject.put("nickname", map.get("nickname"));
			double amount = (int) map.get("amount");
			jsonObject.put("amount", amount);
			int istatus = (int) map.get("status");
			String status = (2 == istatus) ? "待审核" : (1 == istatus) ? "已审核"
					: "审核异常";
			jsonObject.put("status", status);
			jsonArray.add(jsonObject);

		}
		Map<String, Long> cashCntMap = new HashMap<String, Long>();
		if (tokens.size() > 0) {
			// 提现次数
			cashCntMap = commMemCashService.countByTokens(tokens);
		}
		JSONArray _jsonArray = new JSONArray();
		for (int i = 0; i < jsonArray.size(); i++) {
			JSONObject j = jsonArray.getJSONObject(i);
			String token = j.getString("id");
			if (StringUtils.isNotBlank(token)) {
				Long cashCnt = cashCntMap.get(token);
				if (cashCnt != null) {
					j.put("cashs", cashCnt);
				} else {
					j.put("cashs", 0);
				}
			}
			_jsonArray.add(j);
		}
		request.setAttribute("day", date);
		int size = list.size();
		JSONObject result = billUtil
				.formatResult(draw, total, _jsonArray, size);
		return result.toString();
	}

	@ResponseBody
	@RequestMapping(value = "/data_load_checking")
	public String data_load_checking(HttpServletRequest request) {
		String draw = request.getParameter("draw");
		String token = request.getParameter("token");
		Map<String, Object> paramMap = billUtil.getWhereMap(request);
		paramMap.put("token", token);
		int total = commMemCashService.countPageByUser(paramMap);
		List<Map<Object, Object>> list = commMemCashService
				.getPageByUser(paramMap);
		int size = list.size();
		JSONObject result = billUtil.formatResult(draw, total, list, size);
		return result.toString();
	}

	/**
	 * 支付宝提现 这个应该放到admin里
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "alipayDrawal", method = RequestMethod.POST)
	public Object alipayDrawal(HttpServletRequest request,
			HttpServletResponse response) {
		lock.lock();
		try {
			String token = request.getParameter("token");// 用户
			String payer_show_name = "天津掌通无线科技有限公司";// 付款姓名
			String remark = "欢迎使用西瓜妹社区，感谢您一直以来的支持";// 备注
			Integer orderId = Integer.parseInt(request.getParameter("id"));
			String status = request.getParameter("status");// 1 通过 2拒绝 3
															// 推迟（不考虑推迟）
			int stat = Integer.valueOf(status);

			CommMemCash model = commMemCashService.selectByPrimaryKey(orderId);
			if (model == null)
				return "无此订单，支付失败";
			CommUser commUser = commUserService.selectByIndicate(token);
			if (null == commUser) {
				return "用户不存在，支付失败";
			}

			// 需要幂等处理 打印日志 异常处理

			if (Byte.toString(model.getStatus()).equals(Constant.ALIPAY_DO)
					|| Byte.toString(model.getStatus()).equals(
							Constant.ALIPAY_DELAY)) {

				if (1 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setOrdernum("支付宝提现");
					userCashApprove.setApproveTime(new Date());
					userCashApprove.setOperator(Constant.SYSTEM);
					AlipayClient alipayClient = new DefaultAlipayClient(
							ali_url, app_id, privatKey, "json", charset,
							alipublicKey, "RSA2");
					AlipayFundTransToaccountTransferRequest AlipayRequest = new AlipayFundTransToaccountTransferRequest();
					AlipayRequest.setBizContent("{" +
				                "    \"out_biz_no\":\""+model.getOrderid()+"\"," +
				                "    \"payee_type\":\"ALIPAY_LOGONID\"," +
				                "    \"payee_account\":\""+model.getAlipayAccount()+"\"," +
				                "    \"amount\":\""+(model.getAmount()-0.5)+"\"," +                      
				                "    \"payer_show_name\":\""+payer_show_name+"\"," +    
				                "    \"payee_real_name\":\""+model.getRealName()+"\","+             //名字隐藏了
				                "    \"remark\":\""+remark+"\"" +
				                "  }");
					AlipayFundTransToaccountTransferResponse AlipayResponse = alipayClient
							.execute(AlipayRequest);
					if (AlipayResponse.isSuccess()) {
						logger.info("success ordernum of alipay: "
								+ model.getOrderid());
						// 保存当前订单的状态
						userCashApprove.setResult(Constant.ALIPAY_SUCCESS);
						userCashApprove.setDescription(Constant.SUCCESSINFO);
						userCashApprove.setOrdernum(AlipayResponse.getOrderId());
						commMemCashApproveService
								.insertSelective(userCashApprove);

						// 兑换成功，更改用户的交易状态
						model.setStatus(Byte.valueOf(Constant.ALIPAY_SUCCESS));
						model.setOperateTime(new Date());
						model.setOperateResult(Constant.SUCCESSINFO+": 支付宝订单号:"+AlipayResponse.getOrderId());
						commMemCashService.updateByPrimaryKeySelective(model);
						return "success";
					} else {
						logger.info("fail ordernum of alipay: "
								+ model.getOrderid());
						// 转账失败
						userCashApprove.setOrdernum("支付宝提现");
						userCashApprove.setResult(Constant.ALIPAY_FAIL);
						userCashApprove.setDescription(AlipayResponse
								.getSubMsg());
						commMemCashApproveService
								.insertSelective(userCashApprove);

						int credits = model.getAmount();
						BigDecimal bCredits = new BigDecimal(credits);
						BigDecimal totalaward = new BigDecimal(
								commUser.getAward());
						logger.info("fail credits: " + credits);
						Double award = bCredits.add(totalaward).doubleValue();
						logger.info("user award: " + totalaward.doubleValue()
								+ ", credits: " + credits);
						logger.info("返还后的金额: " + award + ", token: " + token);
						// 兑换失败，更改用户的交易状态
						logger.info("fail ordernum of alipay: "
								+ model.getOrderid());
						logger.info("fail errorCode: "
								+ AlipayResponse.getSubCode());
						logger.info("fail errorMessage: "
								+ AlipayResponse.getSubMsg());
						model.setStatus(Byte.valueOf(Constant.ALIPAY_FAIL));
						model.setOperateResult("转账失败，错误代码："
								+ AlipayResponse.getSubCode() + "，错误信息："
								+ AlipayResponse.getSubMsg());
						model.setOperateTime(new Date());
						commMemCashService.updateByPrimaryKeySelective(model);
						CommUser cu = new CommUser();
						cu.setId(commUser.getId());
						cu.setAward(award);
						commUserService.updateByPrimaryKeySelective(cu);
						return "转账失败，用户金额已返还";
					}
				} else if (2 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setOperator(Constant.SYSTEM);
					userCashApprove.setApproveTime(new Date());

					// 转账失败
					userCashApprove.setOrdernum("支付宝提现");
					userCashApprove.setResult(Constant.ALIPAY_FAIL);
					userCashApprove.setDescription("审核异常");
					commMemCashApproveService.insertSelective(userCashApprove);

					int credits = model.getAmount();
					BigDecimal bCredits = new BigDecimal(credits);
					BigDecimal totalaward = new BigDecimal(commUser.getAward());
					logger.info("fail credits: " + credits);
					Double award = bCredits.add(totalaward).doubleValue();
					logger.info("user award: " + totalaward.doubleValue()
							+ ", credits: " + credits);
					logger.info("返还后的金额: " + award + ", token: " + token);
					// 兑换失败，更改用户的交易状态
					logger.info("fail ordernum of alipay: "
							+ model.getOrderid());
					model.setStatus(Byte.valueOf(Constant.ALIPAY_FAIL));
					model.setOperateResult("审核异常");
					model.setOperateTime(new Date());
					commMemCashService.updateByPrimaryKeySelective(model);
					CommUser cu = new CommUser();
					cu.setId(commUser.getId());
					cu.setAward(award);
					commUserService.updateByPrimaryKeySelective(cu);
					return "审核异常，用户金额已返还";
				}
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return "fail";
		} finally {
			lock.unlock();
		}
		return "success";
	}

	/**
	 * 微信订单审核
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "wxDrawal", method = RequestMethod.POST)
	public Object wxDrawal(HttpServletRequest request,
			HttpServletResponse response) {
		lock.lock();
		try {
			String token = request.getParameter("token");// 用户
			Integer orderId = Integer.parseInt(request.getParameter("id"));
			String status = request.getParameter("status");// 1 通过 2拒绝 3
															// 推迟（不考虑推迟）
			int stat = Integer.valueOf(status);

			CommMemCash model = commMemCashService.selectByPrimaryKey(orderId);
			if (model == null)
				return "无此订单，支付失败";
			CommUser commUser = commUserService.selectByIndicate(token);
			if (null == commUser) {
				return "用户不存在，支付失败";
			}
			CommUserQdjl cuq = commUserQdjlService.findByUnionid(commUser
					.getUnionid());
			if (null == cuq || !cuq.getEnable()) {
				return "用户未关联公众号，支付失败";
			}

			// 需要幂等处理 打印日志 异常处理
			if (Byte.toString(model.getStatus()).equals(Constant.ALIPAY_DO)
					|| Byte.toString(model.getStatus()).equals(
							Constant.ALIPAY_DELAY)) {

				if (1 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setApproveTime(new Date());
					userCashApprove.setOperator(Constant.SYSTEM);

					TreeMap<String, String> params = new TreeMap<>();
					params.put("mch_appid", WxPayConfig.APPID_XIGUAMEI);// 企业公众号appid
					params.put("mchid", WxPayConfig.MCHID);// 微信支付分配的商户号
					params.put("nonce_str", WxPayUtil.getNonceStr());// 随机字符串，不长于32位
					params.put("partner_trade_no", model.getOrderid());// 商户订单号，需保持唯一性
					params.put("amount", (model.getAmount()*100)+""); // 企业付款金额，单位为分
					params.put("desc", "西瓜妹游戏平台-提现款额");// 企业付款描述信息
					params.put("spbill_create_ip", WxPayUtil.getIpAddr(request));// 调用接口的机器Ip地址,
																					// 测试用"101.41.44.203"
					params.put("openid", cuq.getOpenid());// 用户openid
					if (StringUtils.isEmpty(model.getRealName())) {
						params.put("check_name", "NO_CHECK"); // NO_CHECK：不校验真实姓名
																// FORCE_CHECK：强校验真实姓名,OPTION_CHECK：针对已实名认证的用户才校验真实姓名
					} else {
						params.put("check_name", "OPTION_CHECK"); // NO_CHECK：不校验真实姓名
																	// FORCE_CHECK：强校验真实姓名,OPTION_CHECK：针对已实名认证的用户才校验真实姓名
						params.put("re_user_name", model.getRealName());
					}
					params.put("sign", WxPayUtil.buildRequestMysign(params));// 签名

					String resultXML = WxPayUtil.httpClientResult(params);// 转账

					// 交易结果处理
					Map<String, String> resultMap = XMLUtil
							.doXMLParse(resultXML);
					String returnCode = resultMap.get("return_code");
					String resultCode = resultMap.get("result_code");
					if (returnCode.equalsIgnoreCase("SUCCESS")
							&& resultCode.equalsIgnoreCase("SUCCESS")) {
						logger.info("success ordernum of wxpay: "
								+ model.getOrderid());
						// 保存当前订单的状态
						userCashApprove
								.setOrdernum(resultMap.get("payment_no"));
						userCashApprove.setResult(Constant.ALIPAY_SUCCESS);
						userCashApprove.setDescription(Constant.SUCCESSINFO);
						commMemCashApproveService
								.insertSelective(userCashApprove);

						// 兑换成功，更改用户的交易状态
						model.setStatus(Byte.valueOf(Constant.ALIPAY_SUCCESS));
						model.setOperateTime(new Date());
						model.setOperateResult(Constant.SUCCESSINFO+": 微信订单号:"+resultMap.get("payment_no"));
						commMemCashService.updateByPrimaryKeySelective(model);

						return "success";
					} else {
						logger.info("fail ordernum of wxpay: "
								+ model.getOrderid());
						// 转账失败
						userCashApprove.setOrdernum("微信付款");
						userCashApprove.setResult(Constant.ALIPAY_FAIL);
						userCashApprove.setDescription(resultMap
								.get("err_code_des"));
						commMemCashApproveService
								.insertSelective(userCashApprove);

						int credits = model.getAmount();
						BigDecimal bCredits = new BigDecimal(credits);
						BigDecimal totalaward = new BigDecimal(
								commUser.getAward());
						logger.info("fail credits: " + credits);
						Double award = bCredits.add(totalaward).doubleValue();
						logger.info("user award: " + totalaward.doubleValue()
								+ ", credits: " + credits);
						logger.info("返还后的金额: " + award + ", token: " + token);
						// 兑换失败，更改用户的交易状态
						logger.info("fail ordernum of wxpay: "
								+ model.getOrderid());
						logger.info("fail errorCode: "
								+ resultMap.get("err_code"));
						logger.info("fail errorMessage: "
								+ resultMap.get("err_code_des"));
						model.setStatus(Byte.valueOf(Constant.ALIPAY_FAIL));
						model.setOperateResult("转账失败，错误代码："
								+ resultMap.get("err_code") + "，错误信息："
								+ resultMap.get("err_code_des"));
						model.setOperateTime(new Date());
						commMemCashService.updateByPrimaryKeySelective(model);
						CommUser cu = new CommUser();
						cu.setId(commUser.getId());
						cu.setAward(award);
						commUserService.updateByPrimaryKeySelective(cu);
						return "转账失败，用户金额已返还";
					}
				} else if (2 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setOperator(Constant.SYSTEM);
					userCashApprove.setApproveTime(new Date());

					// 转账失败
					userCashApprove.setOrdernum("微信付款");
					userCashApprove.setResult(Constant.ALIPAY_FAIL);
					userCashApprove.setDescription("审核异常");
					commMemCashApproveService.insertSelective(userCashApprove);

					int credits = model.getAmount();
					BigDecimal bCredits = new BigDecimal(credits);
					BigDecimal totalaward = new BigDecimal(commUser.getAward());
					logger.info("fail credits: " + credits);
					Double award = bCredits.add(totalaward).doubleValue();
					logger.info("user award: " + totalaward.doubleValue()
							+ ", credits: " + credits);
					logger.info("返还后的金额: " + award + ", token: " + token);
					// 兑换失败，更改用户的交易状态
					logger.info("fail ordernum of wxpay: " + model.getOrderid());
					model.setStatus(Byte.valueOf(Constant.ALIPAY_FAIL));
					model.setOperateResult("审核异常");
					model.setOperateTime(new Date());
					commMemCashService.updateByPrimaryKeySelective(model);
					CommUser cu = new CommUser();
					cu.setId(commUser.getId());
					cu.setAward(award);
					commUserService.updateByPrimaryKeySelective(cu);
					return "审核异常，用户积分已返还";
				}
			} else {
				return "fail";
			}
		} catch (Exception e) {
			return "fail";
		} finally {
			lock.unlock();
		}
		return "success";
	}

}
