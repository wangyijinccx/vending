package com.ipeaksoft.moneyday.api.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ipeaksoft.moneyday.core.entity.CommUserQdjl;
import com.ipeaksoft.moneyday.core.entity.CommUserWxalipy;
import com.ipeaksoft.moneyday.core.service.*;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.api.service.ComConfirmService;
import com.ipeaksoft.moneyday.api.service.WeChatService;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.enums.SMSType;
import com.ipeaksoft.moneyday.core.util.RSAutil;
import com.ipeaksoft.moneyday.core.util.strUtil;

@Controller
public class CommUserController extends BaseController {

	@Autowired
	ComConfirmService confirmService;
	@Autowired
	CommUserService commUserService;
	@Autowired
	private HttpService httpService;
	@Autowired
	WeChatService weChatService;
	@Autowired
	CommUserDayService commUserDayService;
	@Autowired
	CommMembersService commMembersService;
	@Autowired
	CommMemCashService commMemCashService;
	@Autowired
	CommUserWxalipyService commUserWxalipyService;
	@Autowired
	CommUserQdjlService commUserQdjlService;

	@ResponseBody
	@RequestMapping("testMobile")
	public Object test() {
		JSONObject result = new JSONObject();
		String token = "ae4bc254ea0b4ee4b2ea4118edd7a5d9";
		CommUser model = commUserService.selectByIndicate(token);
		String url = "http://e.vhall.com/api/vhallapi/v2/user/update";
		Map<String, String> params = new HashMap<String, String>();
		params.put("third_user_id", model.getMobile());
		params.put("name", model.getNickname());
		params.put("head", model.getHeadimgurl());
		params.put("auth_type", auth_type);
		params.put("account", account);
		params.put("password", password);
		String callback = httpService.postForWH(url, params);
		JSONObject json_wh = JSONObject.parseObject(callback);
		if (null == json_wh || !"200".equals(json_wh.getString("code"))) {
			result.put("result", 3);
			result.put("msg", "微吼用户更新失败");
			return result;
		}
		System.out.println(callback);
		result.put("result", 1);
		return result;
	}

	/**
	 * 验证码
	 * 
	 * @param phoneNumber
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "mobile")
	public Object mobile(String phoneNumber) {
		JSONObject result = new JSONObject();
		if (StringUtils.isNotEmpty(phoneNumber)) {
			boolean sms_result = confirmService.sendCaptcha(phoneNumber,
					SMSType.CONFIRM_AUTHENTICATE_MOBILE);
			if (sms_result) {
				result.put("result", 1);
				result.put("msg", "发送成功");
			} else {
				result.put("result", 2);
				result.put("msg", "发送失败");
			}
		} else {
			result.put("result", 2);
			result.put("msg", "发送失败");
		}
		logger.info("request url:{}, result:{}", request.getRequestURI(),
				result);
		return result;
	}

	/**
	 * 注册 验证验证码
	 * 
	 * @param phoneNumber
	 *            手机号
	 * @param code
	 *            验证码
	 * @param invitationCode
	 *            邀请码
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("registered")
	public Object registered(String phoneNumber, String code,
			String invitationCode, HttpServletResponse response) {
		// 1 验证验证码是否正确 2 保存注册信息
		JSONObject result = new JSONObject();
		String mob = confirmService.checkMobile(code,
				SMSType.CONFIRM_AUTHENTICATE_MOBILE);
		if (!StringUtils.isEmpty(mob) && mob.equals(phoneNumber)) {
			// 要的延迟加载
			boolean lockFlag = commMemCashService.aquireLock(phoneNumber);
			if (lockFlag) {
				try {
					// 是否注册
					CommUser model = commUserService
							.selectBymobile(phoneNumber);
					JSONObject userInfo = new JSONObject();
					if (model != null) {
						result.put("result", 5);
						result.put("msg", "账号已存在");
						return result;
					}

					// 验证邀请码
					CommUser pCommUser = commUserService
							.selectBymobile(invitationCode);
					if (pCommUser == null) {
						result.put("result", 3);
						result.put("msg", "邀请码不存在");
						return result;
					}
					String pass = strUtil.getPassWord(phoneNumber);
					// 注册微吼 密码为手机号的后六位
					// 验证手机号是否注册过微吼账号 注册过就不用注册了
					String validationUrl = "http://e.vhall.com/api/vhallapi/v2/user/get-user-id";
					Map<String, String> postParams = new HashMap<String, String>();
					postParams.put("third_user_id", phoneNumber);
					postParams.put("auth_type", auth_type);
					postParams.put("account", account);
					postParams.put("password", password);
					String validationCallback = httpService.post(validationUrl,
							postParams);
					JSONObject validationJson = JSONObject
							.parseObject(validationCallback);
					if (null == validationJson) {
						result.put("result", 3);
						result.put("msg", "请求微吼服务器异常");
						return result;
					}
					if (!"200".equals(validationJson.getString("code"))) {
						// 没有注册过
						String url = "http://e.vhall.com/api/vhallapi/v2/user/register";
						Map<String, String> params = new HashMap<String, String>();
						params.put("third_user_id", phoneNumber);
						params.put("pass", pass);
						params.put("auth_type", auth_type);
						params.put("account", account);
						params.put("password", password);
						String callback = httpService.post(url, params);
						JSONObject json = JSONObject.parseObject(callback);
						if (null == json
								|| !"200".equals(json.getString("code"))) {
							result.put("result", 3);
							result.put("msg", "微吼注册失败");
							return result;
						}
					}

					// 注册小妹公会服务器
					String xgName = "xg_" + phoneNumber;
					String encStr = "";
					try {
						String signstr = RSAutil.sign(xgName + pass);
						encStr = URLEncoder.encode(signstr);
					} catch (Exception e) {
						result.put("result", 3);
						result.put("msg", "注册公会服务器签名失败");
						return result;
					}
					String xgurl = "http://101.201.253.175/index.php/Register/remote";
					Map<String, String> postParamsXg = new HashMap<String, String>();
					postParamsXg.put("name", xgName);
					postParamsXg.put("pwd", pass);
					postParamsXg.put("sign", encStr);
					String callback = httpService.post(xgurl, postParamsXg);
					JSONObject xgjson = JSONObject.parseObject(callback);
					if (null == xgjson
							|| !"1".equals(xgjson.getString("status"))) {
						result.put("result", 3);
						result.put("msg", "注册公会服务器失败");
						return result;
					}

					// 生成token 注册西瓜妹社区
					// 验证是否注册过西瓜妹社区
					String token = UUID.randomUUID().toString()
							.replace("-", "");
					Integer pid = pCommUser.getId();
					CommUser commUser = new CommUser();
					commUser.setMobile(phoneNumber);
					commUser.setPid(pid);
					commUser.setIndicate(token);
					commUser.setCreateTime(new Date());
					commUser.setUpdateTime(new Date());
					commUser.setStatus("1");
					commUser.setAward((double) 0);
					commUser.setTdaward((double) 0);
					commUser.setTotalaward((double) 0);
					if (commUserService.insertSelective(commUser) < 1) {
						result.put("result", 3);
						result.put("msg", "西瓜妹注册失败");
						return result;
					}
					userInfo = commUserService.userInfo(token);

					result.put("result", 4);
					result.put("liveUrl", "");
					result.put("userInfo", userInfo);
					result.put("msg", "注册成功");
				} catch (Exception e) {

				} finally {
					commMemCashService.realseLock(phoneNumber);
				}
			} else {
				// 并发提交
				result.put("result", 5);
				result.put("msg", "不要连续多次提交");
				return result;
			}
		} else {
			result.put("result", 2);
			result.put("msg", "验证码错误");
		}
		logger.info("request url:{}, result:{}", request.getRequestURI(),
				result);
		return result;
	}

	/**
	 * 手机号登录
	 * 
	 * @param phoneNumber
	 * @param checkCode
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("mobilelogin")
	public Object mobileLogin(String phoneNumber, String checkCode,
			HttpServletResponse response) {
		// 1 验证验证码是否正确 2 保存注册信息
		JSONObject result = new JSONObject();
		String mob = confirmService.checkMobile(checkCode,
				SMSType.CONFIRM_AUTHENTICATE_MOBILE);
		if (!StringUtils.isEmpty(mob) && mob.equals(phoneNumber)) {
			CommUser model = commUserService.selectBymobile(phoneNumber);
			if (model == null) {
				result.put("result", 3);
				result.put("msg", "用户不存在");
				return result;
			} else {
				// 共用接口
				JSONObject userInfo = commUserService.userInfo(model
						.getIndicate());
				result.put("result", 4);
				// result.put("token", model.getIndicate());
				result.put("userInfo", userInfo);
				result.put("msg", "登陆成功");
				return result;
			}
		} else {
			result.put("result", 2);
			result.put("msg", "验证码错误");
		}
		logger.info("request url:{}, result:{}", request.getRequestURI(),
				result);
		return result;
	}

	/**
	 * 用户绑定支付宝微信账号
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "binding", method = RequestMethod.POST, produces = { "application/json;charset=UTF-8" })
	public Object binding(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		String token = request.getParameter("token");// 用户
		String realName = request.getParameter("name");
		String alipay = request.getParameter("account");
		String type = request.getParameter("type");//1 支付宝 0 微信
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 3);
			result.put("msg", "用户不存在");
		}
		CommUserWxalipy model = commUserWxalipyService.selectToken(token);
		CommUserWxalipy commUserWxalipy = new CommUserWxalipy();
		commUserWxalipy.setToken(token);
		if("1".equals(type)){
			commUserWxalipy.setAliname(realName);
			commUserWxalipy.setAlipay(alipay);
		}else{
			commUserWxalipy.setWxname(realName);
			commUserWxalipy.setWeixin(commUser.getUnionid());
		}
		
		if (null == model) {
			if (commUserWxalipyService.insertSelective(commUserWxalipy) < 1) {
				result.put("result", 2);
				result.put("msg", "绑定账号失败");
			}
		} else {
			commUserWxalipy.setId(model.getId());
			if (commUserWxalipyService
					.updateByPrimaryKeySelective(commUserWxalipy) < 1) {
				result.put("result", 2);
				result.put("msg", "绑定账号失败");
			}
		}

		result.put("result", 1);
		result.put("msg", "绑定账号成功");
		return result;
	}

	/**
	 * 获取用户的账号信息
	 *
	 * @param request
	 * @param response
	 * @return
	 * @throws UnsupportedEncodingException
	 */
	@ResponseBody
	@RequestMapping(value = "getAlipayInfo")
	public Object getAlipayInfo(HttpServletRequest request,
			HttpServletResponse response) throws UnsupportedEncodingException {
		JSONObject result = new JSONObject();
		String token = request.getParameter("token");// 用户
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 3);
			result.put("msg", "用户不存在");
		}
		CommUserWxalipy model = commUserWxalipyService.selectToken(token);
		result.put("result", 1);
		result.put("info", null == model ? "" : model);
		result.put("msg", "获取支付宝账号信息成功");
		return result;
	}

	/**
	 * 绑定微信
	 * 
	 * @param code
	 * @param token
	 *            推广员令牌
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("bindingWeiXin")
	public Object bindingWeiXin(String code, String token,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		// 判断用户是是否存在
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		JSONObject json = weChatService.getUserInfo(code);
		if (null == json) {
			result.put("result", 2);
			result.put("msg", "绑定失败");
			return result;
		}
		CommUser commUser = commUserService.toUser(null, json);
		// 一个账号对应一个微信号
		CommUser commUser_openid = commUserService.selectByOpenid(commUser
				.getOpenid());
		if (null != commUser_openid) {
			result.put("result", 2);
			result.put("msg", "该微信号已被使用");
			return result;
		}

		commUser.setId(model.getId());
		if (commUserService.updateByPrimaryKeySelective(commUser) < 1) {
			result.put("result", 2);
			result.put("msg", "保存信息失败");
			return result;
		}

		String url = "http://e.vhall.com/api/vhallapi/v2/user/update";
		Map<String, String> params = new HashMap<String, String>();
		params.put("third_user_id", model.getMobile());
		params.put("name", commUser.getNickname());
		params.put("head", commUser.getHeadimgurl());
		params.put("auth_type", auth_type);
		params.put("account", account);
		params.put("password", password);
		String callback = httpService.postForWH(url, params);
		JSONObject json_wh = JSONObject.parseObject(callback);
		if (null == json_wh || !"200".equals(json_wh.getString("code"))) {
			result.put("result", 3);
			result.put("msg", "微吼用户更新失败");
			return result;
		}

		JSONObject userInfo = commUserService.userInfo(token);
		result.put("result", 1);
		result.put("userInfo", userInfo);
		result.put("msg", "绑定成功");
		return result;
	}

	/**
	 * 微信登录
	 * 
	 * @param code
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("weiXinLogin")
	public Object weiXinLogin(String code, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		JSONObject json = weChatService.getUserInfo(code);
		if (null == json) {
			result.put("result", 2);
			result.put("msg", "登陆失败");
			return result;
		}
		String openid = json.getString("openid");
		CommUser commUser = commUserService.selectByOpenid(openid);
		if (commUser == null) {
			result.put("result", 2);
			result.put("msg", "登陆失败");
		} else {
			JSONObject userInfo = commUserService.userInfo(commUser
					.getIndicate());
			result.put("result", 1);
			// result.put("token", commUser.getIndicate());
			result.put("userInfo", userInfo);
			result.put("msg", "登陆成功");
		}
		return result;
	}

	/**
	 * 用户信息 --公共接口
	 * 
	 * @param token
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("userinfo")
	public Object userInfo(String token, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		result = commUserService.userInfo(token);
		result.put("result", 1);
		return result;
	}

	/**
	 * 收益详情
	 * 
	 * @param token
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("incominglist")
	public Object incomingList(String token, Integer pos, Integer pageSize,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		List<Map<String, Object>> lists = commUserDayService
				.selectIncomingList(token, pos * pageSize, pageSize);
		result.put("result", 1);
		result.put("incomingInfoList", lists);
		result.put("msg", "获取收益详情成功");
		return result;
	}

	/**
	 * 推广业绩
	 * 
	 * @param token
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("promotionlist")
	public Object promotionList(String token, Integer pos, Integer pageSize,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		List<Map<String, Object>> lists = commUserDayService
				.selectPromotionList(token, pos * pageSize, pageSize);
		result.put("result", 1);
		result.put("PromotionList", lists);
		result.put("msg", "获取推广业绩成功");
		return result;
	}

	/**
	 * 推广详情
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
	@RequestMapping("getPromoteDetails")
	public Object getPromoteDetails(HttpServletRequest request, String token,
			Integer pos, Integer pageSize, String time,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 2);
			result.put("msg", "该推广员不存在");
		}
		//当日注册的和之前注册但充值的
		List<Map<String, Object>> mems = commMembersService
				.selectPromoteDetails(commUser.getId(), time, pos * pageSize,
						pageSize);
		result.put("result", 1);
		result.put("userList", mems);
		result.put("msg", "获取推广详情成功");
		return result;
	}

	/**
	 * 徒弟列表
	 * 
	 * @param token
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getdisciples")
	public Object getDisciples(String token, Integer pos, Integer pageSize,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		List<Map<String, Object>> discipleList = new ArrayList<Map<String, Object>>();
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		List<CommUser> disciples = commUserService.selectByPid(model.getId(),
				pos * pageSize, pageSize);
		for (CommUser disciple : disciples) {
			Map<String, Object> discipleMap = new HashMap<String, Object>();
			Double disciple_total = disciple.getTotalaward();
			Double disciple_td = disciple.getTdaward();
			Double disciple_mems = new BigDecimal(disciple_total).subtract(
					new BigDecimal(disciple_td)).doubleValue();
			discipleMap.put("userName",
					null == disciple.getNickname() ? disciple.getMobile()
							: disciple.getNickname());
			discipleMap.put("profit", disciple_mems);
			discipleList.add(discipleMap);
		}
		result.put("invitesNum", disciples.size());
		result.put("sumIncoming", model.getTdaward());
		result.put("apprenticeList", discipleList);
		result.put("result", 1);
		result.put("msg", "获取徒弟列表成功");
		return result;
	}

	/**
	 * 查询当前用户是否关注公众号
	 * 
	 * @param token
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "attention")
	public Object isAttention(String token) {
		JSONObject result = new JSONObject();
		CommUser model = commUserService.selectByIndicate(token);
		if (model == null) {
			result.put("result", 2);
			result.put("msg", "用户不存在");
			return result;
		}
		CommUserQdjl cuq = commUserQdjlService.findByUnionid(model.getUnionid());
		if(null != cuq && cuq.getEnable()){
			result.put("result", 1);
			result.put("msg", "已关注");
			return result;
		}else{
			result.put("result", 2);
			result.put("msg", "未关注");
			return result;
		}
	}

}
