package com.ipeaksoft.moneyday.api.controller;

import java.net.URLEncoder;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.api.util.MD5Util;
import com.ipeaksoft.moneyday.core.entity.CommMembers;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.service.CommMembersService;
import com.ipeaksoft.moneyday.core.service.CommUserDayService;
import com.ipeaksoft.moneyday.core.service.CommUserService;
import com.ipeaksoft.moneyday.core.util.strUtil;

@Controller
@RequestMapping(value = "/user")
public class CommMembersController extends BaseController {

	@Autowired
	CommMembersService commMembersService;
	@Autowired
	CommUserService commUserService;
	@Autowired
	CommUserDayService commUserDayService;

	/**
	 * 用户注册
	 * 
	 * @param request
	 * @param response
	 * @return
	 */
	@SuppressWarnings("deprecation")
	@ResponseBody
	@RequestMapping("reg")
	public Object add(HttpServletRequest request, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		JSONObject json = new JSONObject();
		try {
			Map<String, String[]> maps = request.getParameterMap();
			String js = strUtil.map2JsonString(maps);
			json = JSONObject.parseObject(js);
			logger.info("comm_userreg:{}", js);
			if (!PLAT_ID.equals(json.getString("plat_id"))) {
				result.put("code", 401);
				result.put("fun", "/user/reg");
				result.put("time", new Date());
				result.put("info", json);
				sdklogger.info("ERROR:{}", result.toString());
				return result;
			}
			String sign = MD5Util.md5("plat_id=" + URLEncoder.encode(PLAT_ID)
					+ "&app_id=" + URLEncoder.encode(json.getString("app_id"))
					+ "&username="
					+ URLEncoder.encode(json.getString("username"))
					+ "&timestamp="
					+ URLEncoder.encode(json.getString("timestamp")) + "&time="
					+ URLEncoder.encode(json.getString("time")) + "&ip="
					+ URLEncoder.encode(json.getString("ip")) + "&device_id="
					+ URLEncoder.encode(json.getString("device_id")) + "&from="
					+ URLEncoder.encode(json.getString("from")) + "&userua="
					+ URLEncoder.encode(json.getString("userua"))
					+ "&PLAT_SECURE_KEY=" + URLEncoder.encode(PLAT_SECURE_KEY));
			String reqSign = json.getString("sign");
			if (!sign.equals(reqSign)) {
				result.put("code", 404);
				result.put("fun", "/user/reg");
				result.put("time", new Date());
				result.put("info", json);
				sdklogger.info("ERROR:{}", result.toString());
				return result;
			}
			CommMembers commMembers = new CommMembers();
			commMembers.setUsername(json.getString("username"));
			// commMembers.setNickname(json.getString("username"));
			commMembers.setPassword(json.getString("password"));
			commMembers.setDeviceId(json.getString("device_id"));
			String ip = json.getString("ip");
			commMembers.setRegIp(strUtil.ipToLong(ip));
			commMembers.setPlatId(json.getInteger("plat_id"));
			commMembers.setFrom(json.getByte("from"));
			commMembers.setOaAppId(json.getInteger("app_id"));
			String agentname = json.getString("agentname");
			CommUser commUser = commUserService.selectBymobile(strUtil
					.getAgentName(agentname));
			if (null == commUser) {
				result.put("code", 407);
				result.put("fun", "/user/uproleinfo");
				result.put("time", new Date());
				result.put("info", json);
				sdklogger.info("ERROR:{}", result.toString());
				return result;
			}
			commMembers.setPromoterId(commUser.getId());
			commMembers.setRegTime(json.getLong("time"));
			commMembers.setUpdateTime(json.getLong("time"));
			if (commMembersService.insertSelective(commMembers) < 1) {
				result.put("code", 1000);
				result.put("fun", "/user/reg");
				result.put("time", new Date());
				result.put("info", json);
				sdklogger.info("ERROR:{}", result.toString());
				return result;
			}
			commUserDayService.registered(commUser);
		} catch (Exception e) {
			result.put("code", 1000);
			result.put("fun", "/user/reg");
			result.put("time", new Date());
			result.put("info", json);
			sdklogger.info("ERROR:{}", result.toString());
			return result;
		}
		result.put("code", 200);
		return result;
	}

	/**
	 * 获取玩家详情
	 * 
	 * @param request
	 * @param gameID
	 * @param Token
	 * @param sortType
	 * @param pos
	 * @param pageSize
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getgamemems")
	public Object getGameMems(HttpServletRequest request, Integer gameID,
			String token, String sortType, Integer pos, Integer pageSize,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 2);
			result.put("msg", "该推广员不存在");
		}
		List<Map<String, Object>> mems = commMembersService.selectGameMems(
				gameID, commUser.getId(), sortType, pos*pageSize, pageSize);
		result.put("result", 1);
		result.put("userList", mems);
		result.put("msg", "获取玩家信息成功");
		return result;
	}

	/**
	 * 获取指定玩家信息
	 * @param request
	 * @param gameID
	 * @param token
	 * @param userID
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getonegamemems")
	public Object getOneGameMems(HttpServletRequest request, Integer gameID,
			String token, Integer userID, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser commUser = commUserService.selectByIndicate(token);
		if (null == commUser) {
			result.put("result", 2);
			result.put("msg", "该推广员不存在");
		}
		List<Map<String, Object>> mems = commMembersService.selectOneGameMems(
				gameID, commUser.getId(), userID);
		result.put("result", 1);
		result.put("userList", mems);
		result.put("msg", "获取指定玩家信息成功");
		return result;
	}

	/**
	 * 添加qq微信
	 * 
	 * @param request
	 * @param userid
	 * @param qq
	 * @param weixin
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("addcontact")
	public Object addContact(HttpServletRequest request, Integer userid,
			String qq, String weixin, HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommMembers commMemBers = new CommMembers();
		commMemBers.setId((long) userid);
		commMemBers.setQq(qq);
		commMemBers.setWeixin(weixin);
		if (commMembersService.updateByPrimaryKeySelective(commMemBers) < 1) {
			result.put("result", 2);
			result.put("msg", "添加qq微信失败");
		}
		result.put("result", 1);
		result.put("msg", "添加qq微信成功");
		return result;
	}

}
