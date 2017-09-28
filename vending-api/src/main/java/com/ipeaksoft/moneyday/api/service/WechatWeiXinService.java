package com.ipeaksoft.moneyday.api.service;

import java.io.DataInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.net.URL;
import java.util.Date;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.entity.CommUser;
import com.ipeaksoft.moneyday.core.service.CommUserService;
import com.ipeaksoft.moneyday.core.service.HttpService;

@Service
public class WechatWeiXinService extends BaseService {
	@Autowired
	HttpService httpService;
	@Autowired
	CommUserService commUserService;

	public static final String APPID_QDJL = "wx6b7c4049eaf68d0e";
	public static final String APPSECRET_QDJL = "6dcb03d6802b365966eb3b264dac4f8e";

	private static Logger logger = LoggerFactory
			.getLogger(WechatWeiXinService.class.getName());
	private static String ACCESS_TOKEN_GLOBAL = null;
	private static String REFRESH_TOKEN = null;
	private static String ACCESS_TOKEN = null;
	private static Date TOKEN_TIME_GLOBAL = null;
	private static Date TOKEN_TIME = null;

	public String getInviteCode(String unionid) {
		CommUser commUser = commUserService.selectByUnionid(unionid);
		if (null == commUser) {
			// 需要先绑定微信，这个先不做处理
			return null;
		}
		return commUser.getInviteCode();
	}

	public void binging(String unionid) {

	}

	public String getXGMOpenid(String code) {
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
		url = String.format(url, APPID_QDJL, APPSECRET_QDJL, code);
		String result = httpService.get(url);
		if (StringUtils.isNotBlank(result)) {
			JSONObject json = JSONObject.parseObject(result);
			if (json.containsKey("openid")) {
				return json.getString("openid");
			}
		}
		return null;
	}

	public String getOpenid(String code) {
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
		url = String.format(url, APPID_QDJL, APPSECRET_QDJL, code);
		String result = httpService.get(url);
		if (StringUtils.isNotBlank(result)) {
			JSONObject json = JSONObject.parseObject(result);
			if (json.containsKey("openid")) {
				return json.getString("openid");
			}
		}
		return null;
	}

	public JSONObject getUserInfoFromCode(String code) {
		String url = "https://api.weixin.qq.com/sns/oauth2/access_token?appid=%s&secret=%s&code=%s&grant_type=authorization_code";
		url = String.format(url, APPID_QDJL, APPSECRET_QDJL, code);
		String result = httpService.get(url);
		if (StringUtils.isNotBlank(result)) {
			JSONObject json = JSONObject.parseObject(result);
			if (json.containsKey("access_token")) {
				String token = json.getString("access_token");
				String openid = json.getString("openid");
				url = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s";
				url = String.format(url, token, openid);
				result = httpService.get(url);
				return JSONObject.parseObject(result);
			}
		}
		return null;
	}

	public JSONObject getUserInfo(String openid) {
		String url = "https://api.weixin.qq.com/sns/userinfo?access_token=%s&openid=%s";
		String token = getToken();
		url = String.format(url, token, openid);
		String result = httpService.get(url);
		JSONObject json = JSONObject.parseObject(result);
		return json;
	}

	public JSONObject getInfo(String openid) {
		String url = "https://api.weixin.qq.com/cgi-bin/user/info?access_token=%s&openid=%s&lang=zh_CN";
		String token = getTokenGlobal();
		url = String.format(url, token, openid);
		String result = httpService.get(url);
		JSONObject json = JSONObject.parseObject(result);
		return json;
	}

	// 每60分钟修改一次ACCESSTOKEN_GLOBAL
	public String getTokenGlobal() {
		if (null != ACCESS_TOKEN_GLOBAL
				&& 1 > compareTime(TOKEN_TIME_GLOBAL, new Date())) {
			logger.info("ACCESSTOKEN_GLOBAL: " + ACCESS_TOKEN_GLOBAL);
			return ACCESS_TOKEN_GLOBAL;
		} else {
			String url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=%s&secret=%s";
			url = String.format(url, APPID_QDJL, APPSECRET_QDJL);
			String result = httpService.get(url);
			if (!StringUtils.isBlank(result)) {
				JSONObject jsonObject = JSONObject.parseObject(result);
				if (jsonObject.containsKey("access_token")) {
					TOKEN_TIME_GLOBAL = new Date();
					ACCESS_TOKEN_GLOBAL = jsonObject.getString("access_token");
				}
			}
		}
		logger.info("ACCESSTOKEN_GLOBAL: " + ACCESS_TOKEN_GLOBAL);
		return ACCESS_TOKEN_GLOBAL;
	}

	// 每110分钟修改一次ACCESSTOKEN
	public String getToken() {
		if (null != ACCESS_TOKEN && !isTimeOut(TOKEN_TIME)) {
			logger.info("ACCESS_TOKEN: " + ACCESS_TOKEN);
			return ACCESS_TOKEN;
		} else {
			refreshToken();
		}
		logger.info("ACCESSTOKEN: " + ACCESS_TOKEN);
		return ACCESS_TOKEN;
	}

	private void refreshToken() {
		String url = "https://api.weixin.qq.com/sns/oauth2/refresh_token?appid=%s&grant_type=refresh_token&refresh_token=%s";
		url = String.format(url, APPID_QDJL, REFRESH_TOKEN);
		String result = httpService.get(url);
		if (!StringUtils.isBlank(result)) {
			JSONObject jsonObject = JSONObject.parseObject(result);
			if (jsonObject.containsKey("access_token")) {
				TOKEN_TIME = new Date();
				ACCESS_TOKEN = jsonObject.getString("access_token");
			}
		}
	}

	@Async
	private void asyncRefreshToken() {
		refreshToken();
	}

	/**
	 * 微信超时时间是2小时，本地超时时间是110分钟
	 */
	private final long timeout = 110 * 60 * 1000;

	private boolean isTimeOut(Date begin) {
		return System.currentTimeMillis() - begin.getTime() > timeout;
	}

	public String getJsapiTicket() {
		String url = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?type=jsapi&access_token="
				+ getTokenGlobal();
		String result = httpService.get(url);
		if (!StringUtils.isBlank(result)) {
			JSONObject jsonObject = JSONObject.parseObject(result);
			if (jsonObject.containsKey("ticket")) {
				return jsonObject.getString("ticket");
			}
		}
		return null;
	}

	private long compareTime(Date begin, Date end) {
		long beginTime = begin.getTime();
		long endTime = end.getTime();
		long between = (endTime - beginTime) / 1000;
		long day = between / (24 * 3600);
		long hour = between % (24 * 3600) / 3600;
		return day * 24 + hour;
	}
	
	public Object downCode(Integer companyId, String path) {
		JSONObject result = new JSONObject();
		// 获取access_token
		String token = getTokenGlobal();
		// 永久字符串型二维码
		String codeInfo = "{\"action_name\": \"QR_LIMIT_SCENE\", \"action_info\": {\"scene\": {\"scene_id\": "
				+ companyId + "}}}";
		String url = "https://api.weixin.qq.com/cgi-bin/qrcode/create?access_token="
				+ token;
		String callback = httpService.postJson(url, codeInfo);
		JSONObject json = JSONObject.parseObject(callback);
		if (null == json) {
			result.put("result", 301);
			result.put("msg", "生成二维码失败");
			return result;
		}
		String ticket = json.getString("ticket");
		String codeUrl = "https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket="
				+ ticket;
		save(codeUrl, path + companyId + ".png");
		result.put("result", 200);
		result.put("msg", "获取二维码成功");
		return result;
	}

	public void save(String codeurl, String code) {
		try {
			URL url = new URL(codeurl);
			DataInputStream dataInputStream = new DataInputStream(
					url.openStream());
			FileOutputStream fileOutputStream = new FileOutputStream(new File(
					code));

			byte[] buffer = new byte[1024];
			int length;

			while ((length = dataInputStream.read(buffer)) > 0) {
				fileOutputStream.write(buffer, 0, length);
			}
			dataInputStream.close();
			fileOutputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
