package com.ipeaksoft.moneyday.api.controller;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;
import java.util.concurrent.locks.Lock;
import java.util.concurrent.locks.ReentrantLock;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.druid.util.StringUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayFundTransToaccountTransferRequest;
import com.alipay.api.response.AlipayFundTransToaccountTransferResponse;
import com.ipeaksoft.moneyday.api.wxpay.WxPayConfig;
import com.ipeaksoft.moneyday.api.wxpay.WxPayUtil;
import com.ipeaksoft.moneyday.api.wxpay.XMLUtil;
import com.ipeaksoft.moneyday.core.entity.CommMemCash;
import com.ipeaksoft.moneyday.core.entity.CommMemCashApprove;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.entity.CommUserDay;
import com.ipeaksoft.moneyday.core.entity.CommUserQdjl;
import com.ipeaksoft.moneyday.core.sdk.duiba.Constant;
import com.ipeaksoft.moneyday.core.service.CommMemCashApproveService;
import com.ipeaksoft.moneyday.core.service.CommMemCashService;
import com.ipeaksoft.moneyday.core.service.CommUserDayService;
import com.ipeaksoft.moneyday.core.service.CommUserQdjlService;
import com.ipeaksoft.moneyday.core.service.CommUserService;

@Controller
@RequestMapping(value = "/drawal")
public class CommAlipayDrawalController extends BaseController {

	@Autowired
	CommUserService commUserService;
	@Autowired
	CommUserDayService commUserDayService;
	@Autowired
	CommMemCashService commMemCashService;
	@Autowired
	CommMemCashApproveService commMemCashApproveService;
	@Autowired
	CommUserQdjlService commUserQdjlService;
	
	private Lock lock = new ReentrantLock();

	// Alpha
	public static final String app_id = "";// 付宝分配给开发者的应用ID
	public static final String method = "alipay.fund.trans.toaccount.transfe";
	public static final String charset = "UTF-8";
	public static final String privatKey = "";
	public static final String publicKey = "";

	/**
	 * 生成订单
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "alipayOrder", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public Object alipayDrawalOrder(HttpServletRequest request,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		String token = request.getParameter("token");// 用户
		int balance = Integer.parseInt(request.getParameter("balance"));// 提现金额
		String payee_account = request.getParameter("account");// 支付宝账户
		String realName = request.getParameter("name");

		CommUser commUser = commUserService.selectByIndicate(token);
		CommUserDay commUserDay = commUserDayService.selectCurrentInfo(token);

		int todayWithdrawCount = 0;
		if (commUserDay != null) {
			todayWithdrawCount = commUserDay.getTodaywithdrawalscount();
		} else {
			commUserDay = new CommUserDay();
			commUserDay.setUserid(token);
			commUserDay.setTime(new Date());
			commUserDay.setTodaywithdrawalscount(todayWithdrawCount + 1);
		}

		if (null == commUser) {
			result.put("result", 5);
			result.put("msg", "用户不存在");
			return result;
		}
		if (balance != 10 && balance != 50 && balance != 100 && balance != 300) {
			result.put("result", 3);
			result.put("msg", "无效的提现金额");
			return result;
		}
		if (todayWithdrawCount >= withdrawalNumber) {
			result.put("result", 4);
			result.put("msg", "亲，今日提现次数已用完，请明日再提！");
			return result;
		}
		commMemCashService.realseLock("ali"+token);
		boolean lockFlag = commMemCashService.aquireLock("ali"+token);
		logger.info("lockFlag:{}", lockFlag);
		if (lockFlag) {
			Double award = commUser.getAward();
			BigDecimal totalAward = new BigDecimal(award);
			BigDecimal bAward = new BigDecimal(balance);
			Double shAward = totalAward.subtract(bAward).doubleValue();
			if (commUser.getAward() < balance) {
				result.put("result", 6);
				result.put("msg", "余额不足");
				return result;
			}

			// 需要幂等处理 打印日志 异常处理
			try {

				String out_biz_no = UUID.randomUUID().toString().replace("-", "");
				// 保存数据
				CommMemCash userCash = new CommMemCash();
				userCash.setOrderid(out_biz_no); // 插入掌通订单号
				userCash.setDescription("支付宝提现：" + balance + "元"); // 插入当前订单的详细描述
				userCash.setOpenid("");
				userCash.setAmount(balance); // 插入当前订单的提现金额
				userCash.setTotalcredits(commUser.getAward()); // 插入当前用户余额
				userCash.setOperator(Constant.SYSTEM); // 插入处理人，系统处理
				userCash.setStatus(Byte.valueOf(Constant.ALIPAY_DO)); // 插入订单状态:成功
				userCash.setType((byte) 0);// 支付宝
				userCash.setCreateTime(new Date()); // 插入当前日期
				userCash.setRealName(realName);
				userCash.setAlipayAccount(payee_account);
				userCash.setToken(token);

				// 保存订单状态
				CommMemCashApprove userCashApprove = new CommMemCashApprove();
				userCashApprove.setOrderid(out_biz_no);
				userCashApprove.setOrdernum("支付宝提现");
				userCashApprove.setResult(Constant.ALIPAY_DO);
				userCashApprove.setApproveTime(new Date());
				userCashApprove.setOperator(Constant.SYSTEM);
				userCashApprove.setDescription(Constant.APPLYINFO);
				int cashId = commMemCashService.insertSelective(userCash);
				int insertApprove = commMemCashApproveService
						.insertSelective(userCashApprove);
				if (cashId == 1 && insertApprove == 1) {
					logger.info("剩余积分: " + shAward + ", token: " + token);
					// 修改积分
					CommUser model = new CommUser();
					model.setId(commUser.getId());
					model.setAward(shAward);
					commUserService.updateByPrimaryKeySelective(model);

					// 修改提现次数
					commUserDayService.insertUpdateWithdrawCount(commUserDay);

					result.put("result", 1);
					result.put("msg", "订单申请已成功，等待审批中");
					return result;
				} else {
					result.put("result", 7);
					result.put("msg", "订单保存失败，积分无扣除");
					return result;
				}
			} catch (Exception e) {
				result.put("result", 6);
				result.put("msg", "未知异常");
				return result;
			} finally {
				commMemCashService.realseLock("ali"+token);
			}
		} else {
			// 并发提交提现请求
			result.put("result", 8);
			result.put("msg", "不要连续多次提交");
			return result;
		}
	}


	// 处理兑换请求
	@ResponseBody
	@RequestMapping(value = "/wxOrder", method = RequestMethod.POST, produces = {"application/json;charset=UTF-8"})
	public Object withdrawWxOrder(
                /* @RequestParam("token") String token,
                @RequestParam("balance") int balance,
                @RequestParam(value = "name", required = false) String realName, */
				HttpServletRequest request) {

		String token = request.getParameter("token");
		int balance = Integer.parseInt(request.getParameter("balance"));
		String realName = request.getParameter("name");
		if (StringUtils.isEmpty(realName)) realName = null;

		JSONObject result = new JSONObject();
		if (balance != 10 && balance != 50 && balance != 100 && balance != 300) {
			result.put("result", 4);
			result.put("msg", "无效的提现金额10/50/100/500");
			return result.toString();
		}

		CommUser model = commUserService.selectByIndicate(token);
		CommUserDay commUserDay = commUserDayService.selectCurrentInfo(token);

		int todayWithdrawCount = 0;
		if (commUserDay != null) {
			todayWithdrawCount = commUserDay.getTodaywithdrawalscount();
		} else {
			commUserDay = new CommUserDay();
			commUserDay.setUserid(token);
			commUserDay.setTime(new Date());
			commUserDay.setTodaywithdrawalscount(todayWithdrawCount + 1);
		}

		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}

		try {
			CommUserQdjl cuq = commUserQdjlService.findByUnionid(model.getUnionid());
			if(null == cuq || !cuq.getEnable()){
				result.put("result", 3);
				result.put("msg", "请先关注微信公众号");
				return result.toString();
			}
			// 注册24小时内不得提现
			if ((new Date()).getTime() - model.getCreateTime().getTime() < 1000 * 60 * 60 * 24) {
				result.put("result", 5);
				result.put("msg", "注册24小时内不能提现");
				return result.toString();
			}

			if (todayWithdrawCount >= withdrawalNumber) {
				result.put("result", 6);
				result.put("msg", "亲，今日提现次数已用完，请明日再提！");
				return result;
			}
			commMemCashService.realseLock("wx"+token);
			boolean lockFlag = commMemCashService.aquireLock("wx"+token);
			if (lockFlag) {
				Double award = model.getAward();
				if (model.getAward() < balance) {
					result.put("result", 7);
					result.put("msg", "余额不足");
					return result;
				}

				BigDecimal totalAward = new BigDecimal(award);
				BigDecimal bAward = new BigDecimal(balance);
				Double shAward = totalAward.subtract(bAward).doubleValue();

				Date now = new Date();

				// 需要幂等处理 打印日志 异常处理
				try {
					String out_biz_no = UUID.randomUUID().toString().replace("-", "");
					// 保存数据
					CommMemCash userCash = new CommMemCash();
					userCash.setOrderid(out_biz_no); // 插入掌通订单号
					userCash.setDescription("微信提现：" + balance + "元"); // 插入当前订单的详细描述
					userCash.setOpenid(cuq.getOpenid());
					userCash.setAmount(balance); // 插入当前订单的提现金额
					userCash.setTotalcredits(model.getAward()); // 插入当前用户余额
					userCash.setOperator(Constant.SYSTEM); // 插入处理人，系统处理
					userCash.setStatus(Byte.valueOf(Constant.ALIPAY_DO)); // 插入订单状态:成功
					userCash.setType((byte)1);// 微信支付
					userCash.setCreateTime(now); // 插入当前日期
					userCash.setRealName(realName);
					userCash.setAlipayAccount("");
					userCash.setToken(token);

					// 保存订单状态
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(out_biz_no);
					userCashApprove.setOrdernum("微信付款");
					userCashApprove.setResult(Constant.ALIPAY_DO);
					userCashApprove.setApproveTime(now);
					userCashApprove.setOperator(Constant.SYSTEM);
					userCashApprove.setDescription(Constant.APPLYINFO);
					int cashId = commMemCashService.insertSelective(userCash);
					int insertApprove = commMemCashApproveService.insertSelective(userCashApprove);
					if (cashId == 1 && 1 == insertApprove) {
						logger.info("剩余积分: " + shAward + ", token: " + token);

						// 修改积分
						CommUser model1 = new CommUser();
						model1.setId(model.getId());
						model1.setAward(shAward);
						commUserService.updateByPrimaryKeySelective(model1);

						// 修改提现次数
						commUserDayService.insertUpdateWithdrawCount(commUserDay);

						result.put("result", 1);
						result.put("msg", "订单申请已成功，等待审批中");
						return result;
					} else {
						result.put("result", 8);
						result.put("msg", "订单保存失败，积分无扣除");
						return result;
					}
				} catch (Exception e) {
					result.put("result", 10);
					result.put("msg", "未知异常");
					return result;
				} finally {
					commMemCashService.realseLock("wx"+token);
				}
			} else {
				// 并发提交提现请求
				result.put("result", 20);
				result.put("msg", "不要连续多次提交");
				return result;
			}

		} catch (Exception e) {
			logger.error("ERROR: ", e);
			result.put("result", 1006);
			result.put("msg", "兑换出错");
		}
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
	@RequestMapping(value = "alipayDrawal", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public Object alipayDrawal(HttpServletRequest request,
			HttpServletResponse response) {
		lock.lock();
		try {
			String token = request.getParameter("token");// 用户
			//int balance = Integer.parseInt(request.getParameter("balance"));// 提现金额
			//String payee_account = request.getParameter("account");// 支付宝账户
			String payer_show_name = "";// 付款姓名
			//String realName = request.getParameter("name");
			String remark = "";// 备注
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
					||Byte.toString(model.getStatus()).equals(Constant.ALIPAY_DELAY)) {

				if (1 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setOrdernum("支付宝提现");
					userCashApprove.setApproveTime(new Date());
					userCashApprove.setOperator(Constant.SYSTEM);

					AlipayClient alipayClient = new DefaultAlipayClient(
							"https://openapi.alipay.com/gateway.do", app_id,
							privatKey, "json", charset, publicKey, "RSA2");
					AlipayFundTransToaccountTransferRequest AlipayRequest = new AlipayFundTransToaccountTransferRequest();
					AlipayRequest.setBizContent("{" + "\"out_biz_no\":\""
							+ model.getOrderid() + "\","
							+ "\"payee_type\":\"ALIPAY_LOGONID\","
							+ "\"payee_account\":\"" + model.getAlipayAccount() + "\","
							+ "\"amount\":\"" + model.getAmount() + "\","
							+ "\"payer_show_name\":\"" + payer_show_name
							+ "\"," + "\"payee_real_name\":\"" + model.getRealName()
							+ "\"," + "\"remark\":\"" + remark + "\"" + "  }");
					AlipayFundTransToaccountTransferResponse AlipayResponse = alipayClient
							.execute(AlipayRequest);
					if (AlipayResponse.isSuccess()) {
						logger.info("success ordernum of alipay: "
								+ model.getOrderid());
						// 保存当前订单的状态
						userCashApprove.setResult(Constant.ALIPAY_SUCCESS);
						userCashApprove.setDescription(Constant.SUCCESSINFO);
						commMemCashApproveService
								.insertSelective(userCashApprove);

						// 兑换成功，更改用户的交易状态
						model.setStatus(Byte.valueOf(Constant.ALIPAY_SUCCESS));
						model.setOperateTime(new Date());
						model.setOperateResult("支付宝体现："
								+ Constant.ALIPAY_SUCCESS);
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
						return "转账失败，用户积分已返还";
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
					logger.info("fail ordernum of alipay: " + model.getOrderid());
					model.setStatus(Byte.valueOf(Constant.ALIPAY_FAIL));
					model.setOperateResult("审核异常");
					model.setOperateTime(new Date());
					commMemCashService.updateByPrimaryKeySelective(model);
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
	
	
	
	/**
	 * 微信订单审核
	 * @param request
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "wxDrawal", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public Object wxDrawal(HttpServletRequest request,
			HttpServletResponse response) {
		lock.lock();
		try {
			String token = request.getParameter("token");// 用户
			//int balance = Integer.parseInt(request.getParameter("balance"));// 提现金额
			//String realName = request.getParameter("name");
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
			CommUserQdjl cuq = commUserQdjlService.findByUnionid(commUser.getUnionid());
			if(null == cuq || !cuq.getEnable()){
				return "用户未关联公众号，支付失败";
			}
			
			// 需要幂等处理 打印日志 异常处理
			if (Byte.toString(model.getStatus()).equals(Constant.ALIPAY_DO)
					|| Byte.toString(model.getStatus()).equals(Constant.ALIPAY_DELAY)) {

				if (1 == stat) {
					CommMemCashApprove userCashApprove = new CommMemCashApprove();
					userCashApprove.setOrderid(model.getOrderid());
					userCashApprove.setApproveTime(new Date());
					userCashApprove.setOperator(Constant.SYSTEM);

					 TreeMap<String, String> params = new TreeMap<>(); 
 	                params.put("mch_appid", WxPayConfig.APPID_XIGUAMEI);//企业公众号appid
 	                params.put("mchid", WxPayConfig.MCHID);//微信支付分配的商户号
 	                params.put("nonce_str", WxPayUtil.getNonceStr());//随机字符串，不长于32位
 	                params.put("partner_trade_no", model.getOrderid());//商户订单号，需保持唯一性
 	                params.put("amount", model.getAmount().toString()); //企业付款金额，单位为分
 	                params.put("desc", "西瓜妹游戏平台-提现款额");//企业付款描述信息
 	                params.put("spbill_create_ip", WxPayUtil.getIpAddr(request));//调用接口的机器Ip地址, 测试用"101.41.44.203"
 	                params.put("openid", cuq.getOpenid());//用户openid
 	                if (StringUtils.isEmpty(model.getRealName())) {
 	                    params.put("check_name", "NO_CHECK"); //NO_CHECK：不校验真实姓名 FORCE_CHECK：强校验真实姓名,OPTION_CHECK：针对已实名认证的用户才校验真实姓名
 	                } else {
 	                    params.put("check_name", "OPTION_CHECK"); //NO_CHECK：不校验真实姓名 FORCE_CHECK：强校验真实姓名,OPTION_CHECK：针对已实名认证的用户才校验真实姓名
 	                    params.put("re_user_name", model.getRealName());
 	                }
 	                params.put("sign", WxPayUtil.buildRequestMysign(params));//签名
 	
 	                String resultXML = WxPayUtil.httpClientResult(params);//转账
					
 	               //交易结果处理
	                Map<String, String> resultMap =  XMLUtil.doXMLParse(resultXML);
	                String returnCode = resultMap.get("return_code");
	                String resultCode = resultMap.get("result_code");
	                if (returnCode.equalsIgnoreCase("SUCCESS") && resultCode.equalsIgnoreCase("SUCCESS")) {
						logger.info("success ordernum of wxpay: "
								+ model.getOrderid());
						// 保存当前订单的状态
						userCashApprove.setOrdernum(resultMap.get("payment_no"));
						userCashApprove.setResult(Constant.ALIPAY_SUCCESS);
						userCashApprove.setDescription(Constant.SUCCESSINFO);
						commMemCashApproveService
								.insertSelective(userCashApprove);

						// 兑换成功，更改用户的交易状态
						model.setStatus(Byte.valueOf(Constant.ALIPAY_SUCCESS));
						model.setOperateTime(new Date());
						model.setOperateResult("支付宝体现："
								+ Constant.ALIPAY_SUCCESS);
						commMemCashService.updateByPrimaryKeySelective(model);

						return "success";
					} else {
						logger.info("fail ordernum of wxpay: "
								+ model.getOrderid());
						// 转账失败
						userCashApprove.setOrdernum("微信付款");
						userCashApprove.setResult(Constant.ALIPAY_FAIL);
						userCashApprove.setDescription(resultMap.get("err_code_des"));
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
						return "转账失败，用户积分已返还";
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


	/**
	 * 获取提现记录
	 * 
	 * @param request
	 * @param token
	 * @param pos
	 * @param pageSize
	 * @param time
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getDrawlList")
	public Object getDrawlList(HttpServletRequest request, String token,
			Integer pos, Integer pageSize,HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 2);
			result.put("msg", "该推广员不存在");
		}
		List<Map<Object, Object>> lists = commMemCashService.selectByToken(token, pos
				* pageSize, pageSize);
		result.put("result", 1);
		result.put("userList", lists);
		result.put("msg", "获取提现记录成功");
		return result;
	}
}
