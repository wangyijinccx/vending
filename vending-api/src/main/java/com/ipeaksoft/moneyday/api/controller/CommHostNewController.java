package com.ipeaksoft.moneyday.api.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.entity.CommHost;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.service.CommHostService;
import com.ipeaksoft.moneyday.core.service.CommUserService;
import com.ipeaksoft.moneyday.core.service.HttpService;
import com.ipeaksoft.moneyday.core.service.RedisClient;

@Controller
@RequestMapping(value = "/newhost")
public class CommHostNewController extends BaseController {

	@Autowired
	CommUserService commUserService;
	@Autowired
	private HttpService httpService;
	@Autowired
	CommHostService commHostService;
	@Autowired
	RedisClient redis;

	/**
	 * 获取主播列表
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getlist")
	public Object getlist() {
		JSONObject result = new JSONObject();
		List<Map<String, Object>> listsOnline = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> listsUonline = new ArrayList<Map<String, Object>>();
		List<CommHost> commHosts = commHostService.selectAll();
		for (CommHost commHost : commHosts) {
			String url = "http://e.vhall.com/api/vhallapi/v2/webinar/list";
			Map<String, String> params = new HashMap<String, String>();
			params.put("user_id", commHost.getUserId() + "");
			params.put("type", "1");
			params.put("pos", "0");
			params.put("limit", "100");
			params.put("status", "1");
			params.put("auth_type", auth_type);
			params.put("account", account);
			params.put("password", password);
			String callback = httpService.post(url, params);
			JSONObject json = JSONObject.parseObject(callback);
			if (null == json) {
				result.put("result", 2);
				result.put("msg", "获取主播列表失败");
				return result;
			}
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("headimg", commHost.getHeadimg());
			map.put("hostid", commHost.getId());
			map.put("nickname", commHost.getNickname());
			if (10019 == json.getInteger("code")) {
				map.put("onlinestatus", 0);
				listsUonline.add(map);
			} else if (200 == json.getInteger("code")) {
				map.put("onlinestatus", 1);
				listsOnline.add(map);
			}
		}
		for (Map<String, Object> map : listsUonline) {
			listsOnline.add(map);
		}
		result.put("result", 1);
		result.put("host", listsOnline);
		result.put("msg", "获取主播信息成功");
		return result;
	}

	/**
	 * 绑定主播
	 * 
	 * @param hostid
	 * @param token
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("bindinghost")
	public Object bindingHost(Integer hostid, String token,
			HttpServletResponse response) {
		JSONObject result = new JSONObject();
		CommUser commUser = new CommUser();
		commUser.setIndicate(token);
		commUser.setCommid(hostid);
		commUser.setUpdateTime(new Date());
		if (commUserService.updateByIndicate(commUser) < 1) {
			result.put("result", 2);
			result.put("msg", "绑定失败");
			return result;
		}
		result.put("result", 1);
		result.put("msg", "绑定成功");
		return result;
	}

	/**
	 * 获取回访列表
	 * 
	 * @param webinarId
	 * @param token
	 * @param pos
	 * @param response
	 * @return
	 */
	@ResponseBody
	@RequestMapping("getrecords")
	public Object getRecords(String token, HttpServletResponse response) {
		CommUser commUser = commUserService.selectByIndicate(token);
		CommHost commhost = commHostService.selectByPrimaryKey(commUser
				.getCommid());
		Integer userId = commhost.getUserId();
		JSONObject result = new JSONObject();
		JSONArray online = new JSONArray();
		JSONArray uonline = new JSONArray();
		// 获取主播徒弟数
		// Map<String, Object> map = new HashMap<String, Object>();
		List<Map<String, Object>> lists = commHostService
				.getStudentsNew(userId);

		// 获取主播状态
		String statusUrl = "http://e.vhall.com/api/vhallapi/v2/webinar/list";
		Map<String, String> statusparams = new HashMap<String, String>();
		statusparams.put("user_id", commhost.getUserId() + "");
		statusparams.put("type", "1");
		statusparams.put("pos", "0");
		statusparams.put("limit", "100");
		statusparams.put("auth_type", auth_type);
		statusparams.put("account", account);
		statusparams.put("password", password);
		String statuscallback = httpService.post(statusUrl, statusparams);
		JSONObject statusjson = JSONObject.parseObject(statuscallback);
		if (null == statusjson) {
			result.put("result", 2);
			result.put("msg", "获取主播列表失败");
			return result;
		}
		if (10019 == statusjson.getInteger("code")) {
			result.put("result", 3);
			result.put("msg", "没有活动");
			return result;
		} else if (200 == statusjson.getInteger("code")) {
			// 一个子账号 只能有一个活动在直播
			//result.put("members", 0);
			JSONObject jo = statusjson.getJSONObject("data");
			JSONArray ja = jo.getJSONArray("lists");
			for (int i = 0; i < ja.size(); i++) {
				JSONObject item = ja.getJSONObject(i);
				Integer status = item.getInteger("status");
				Integer webinarId = item.getInteger("webinar_id");
				// 活动信息
				String fields = "subject,introduction,img_url,type,layout";
				String webinarUrl = "http://e.vhall.com/api/vhallapi/v2/webinar/fetch";
				Map<String, String> webinarparams = new HashMap<String, String>();
				webinarparams.put("webinar_id", webinarId + "");
				webinarparams.put("fields", fields);
				webinarparams.put("auth_type", auth_type);
				webinarparams.put("account", account);
				webinarparams.put("password", password);
				String webinarCallback = httpService.post(webinarUrl,
						webinarparams);
				JSONObject webinarJson = JSONObject
						.parseObject(webinarCallback);
				if (null == webinarJson
						|| !"200".equals(webinarJson.getString("code"))) {
					result.put("result", 2);
					result.put("msg", "获取活动信息失败");
					return result;
				}
				JSONObject data = webinarJson.getJSONObject("data");

				item.put("id", commhost.getId());
				item.put("imgUrl", data.getString("img_url"));
				item.put("layout", data.getString("layout"));
				if (1 == status) {
					// 主播在线人数
					JSONObject memberInfo = (JSONObject) getMembers(webinarId);
					if (null == memberInfo
							|| !"1".equals(memberInfo.getString("result"))) {
						result.put("result", 2);
						result.put("msg", "获取主播在线人数徒弟数失败");
						return result;
					}
				    //map.put("id", commhost.getId());
					//map.put("webinarId", webinarId);
					//map.put("subject", data.getString("subject"));
					//map.put("imgUrl", data.getString("img_url"));
					//map.put("onlinestatus", 1);
					item.put("members", memberInfo.getInteger("members"));
					//ja.remove(item);
					online.add(item);
				}else{
					uonline.add(item);
				}
			}
			for (int i = 0; i < uonline.size(); i++) {
				JSONObject item = uonline.getJSONObject(i);
				online.add(item);
			}
		}
		
		result.put("result", 1);
		result.put("students", lists.size());
		result.put("headimg", commhost.getHeadimg());
		result.put("coverimg", commhost.getCoverimg());
		result.put("nickname", commhost.getNickname());
		result.put("id", commhost.getId());
		//result.put("records", statusjson);
		//result.put("onlineLive", online);
		//result.put("uonlineLive", uonline);
		result.put("records", online);
		result.put("msg", "获取回放列表成功");
		return result;
	}

	@ResponseBody
	@RequestMapping("getmembers")
	public Object getMembers(Integer webinar_id) {
		JSONObject result = new JSONObject();
		String key = webinar_id + "";
		Integer cnt = redis.getInteger(key);
		logger.info("commwebinar_id:{},cnt:{}", webinar_id, cnt);
		if (null == cnt) {
			String url = "http://e.vhall.com/api/vhallapi/v2/webinar/current-online-number";
			Map<String, String> params = new HashMap<String, String>();
			params.put("webinar_id", webinar_id + "");
			params.put("auth_type", auth_type);
			params.put("account", account);
			params.put("password", password);
			String callback = httpService.post(url, params);
			JSONObject json = JSONObject.parseObject(callback);
			if (null == json || (!"200".equals(json.getString("code")))) {
				//result.put("result", 2);
				//result.put("msg", "获取当前在线人数失败");
				result.put("result", 1);
				result.put("members", 0);
				return result;
			}
			redis.setInteger(key, json.getInteger("data"));
			redis.expire(key, 60);
			result.put("result", 1);
			result.put("members", json.getInteger("data"));
			result.put("msg", "获取当前在线人数成功");
			return result;
		} else {
			result.put("result", 1);
			result.put("members", cnt);
			result.put("msg", "获取当前在线人数成功");
			return result;
		}
	}
}
