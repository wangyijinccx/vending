import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;
import java.util.TreeMap;
import java.util.UUID;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.core.util.HttpRequest;
import com.ipeaksoft.moneyday.core.util.RSAutil;

public class TEST {

	public static final String PLAT_SECURE_KEY = "5e511d59019de14691b8f0f360bf6841";
	public static final String PLAT_ID = "1869527";

	public static void main(String[] args) throws Exception {
		String xgurl = "http://localhost:8080/community-api/drawal/alipayOrder";
		Map<String, Object> postParamsXg = new HashMap<String, Object>();
		postParamsXg.put("account", "13552886455");
		postParamsXg.put("balance", "10");
		postParamsXg.put("name", "王艺锦");
		postParamsXg.put("token", "2e9d442f78a1420f88a38b52d8b96b80");
		String callback = HttpRequest.postForm(xgurl, postParamsXg);
		System.out.println(callback);

	}

	public static void drawl() throws Exception {
		String token = UUID.randomUUID().toString().replace("-", "");
		TreeMap<String, String> params = new TreeMap<>();
		params.put("mch_appid", WxPayConfig.APPID_XIGUAMEI);// 企业公众号appid
		params.put("mchid", WxPayConfig.MCHID);// 微信支付分配的商户号
		params.put("nonce_str", WxPayUtil.getNonceStr());// 随机字符串，不长于32位
		params.put("partner_trade_no", token);// 商户订单号，需保持唯一性
		params.put("amount", "1"); // 企业付款金额，单位为分
		params.put("desc", "西瓜妹游戏平台-提现款额");// 企业付款描述信息
		params.put("spbill_create_ip", "101.41.44.203");// 调用接口的机器Ip地址,
														// 测试用"101.41.44.203"
		params.put("openid", "ooFMms36rgdxspcczr1OzgN6fN9o");// 用户openid
		// params.put("openid", "ojAlkwiuUI1dnxRNjrvfIKar_z34");// 用户openid
		params.put("check_name", "NO_CHECK"); // NO_CHECK：不校验真实姓名
												// FORCE_CHECK：强校验真实姓名,OPTION_CHECK：针对已实名认证的用户才校验真实姓名

		params.put("sign", WxPayUtil.buildRequestMysign(params));// 签名

		String resultXML = WxPayUtil.httpClientResult(params);// 转账
	}

	public static void reg(String phoneNumber) {
		String xgName = "xg_18601042108";
		String pass = "042108";
		String encStr = "";
		try {
			String content = xgName + pass;
			System.out.println("签名前=" + content);
			String signstr = RSAutil.sign(content);
			encStr = URLEncoder.encode(signstr);
			System.out.println("签名后=" + encStr);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String xgurl = "http://101.201.253.175/index.php/Register/remote";
		Map<String, Object> postParamsXg = new HashMap<String, Object>();
		postParamsXg.put("name", xgName);
		postParamsXg.put("pwd", pass);
		postParamsXg.put("sign", encStr);
		String callback = HttpRequest.postForm(xgurl, postParamsXg);
		System.out.println(callback);

		// 验证？？
	}

	public static void userPay() {
		String url = "http://localhost:8080/community-api/user/pay";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "149751");
		p.put("sign_type", "MD5");
		p.put("sign", "24a4ed9e99ce33ce2f2648b5787944e3");
		p.put("app_id", 1001);
		p.put("uersname", "ztwireless");
		p.put("agentname", "xg_13552886455");
		p.put("ip", "106.37.252.136");
		p.put("time", "149751");
		p.put("device_id", "macsgi12352");
		p.put("from", 4);
		p.put("userua", "1231212");

		p.put("order_id", 123456);
		p.put("payway", "payway");
		p.put("real_amount", 100);
		p.put("amount", 110);
		p.put("gm_cnt", 500);
		p.put("status", 2);
		p.put("rebate_cnt", 0);

		p.put("role_id", "r10012");
		p.put("role_level", 100);
		p.put("role_name", "二当家");
		p.put("server_id", "10011");
		p.put("server_name", "天下一通");

		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void userUproleinfo() {
		String url = "http://localhost:8080/community-api/user/uproleinfo";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "149751");
		p.put("sign_type", "MD5");
		p.put("sign", "063e859aaaa561403c5b16403dae388b");
		p.put("app_id", 1001);
		p.put("username", "ztwireless");
		p.put("agentname", "xg_13552886455");
		p.put("ip", "106.37.252.136");
		p.put("time", "149751");
		p.put("device_id", "macsgi12351");
		p.put("from", 4);
		p.put("userua", "1231212");

		p.put("role_id", "r10012");
		p.put("role_level", 100);
		p.put("role_name", "二当家");
		p.put("server_id", "10011");
		p.put("server_name", "天下一通");

		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void userReg() {
		String url = "http://localhost:8080/community-api/user/reg";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "149751");
		p.put("sign_type", "MD5");
		p.put("sign", "356b52b5b1a50be9e34a7dbbf09a0a8a");
		p.put("app_id", 1001);
		p.put("username", "ztwireless");
		p.put("agentname", "xg_13552886455");
		p.put("ip", "106.37.252.136");
		p.put("time", "149751");
		p.put("device_id", "macsgi1235");
		p.put("from", 4);
		p.put("userua", "1231212");
		p.put("password", "12314");
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void serverUpdate() {
		JSONObject jo = new JSONObject();
		jo.put("update_time", 149751);
		jo.put("server_name", "huangshiserver1");
		jo.put("server_id", "10011");
		String url = "http://localhost:8080/community-api/server/update";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "149751");
		p.put("sign_type", "MD5");
		p.put("sign", "b267ca557e8b46b0a3e1d0a3d40463e2");
		p.put("app_id", 1001);
		p.put("gamename", "皇室战争");
		p.put("serinfo", jo.toString());
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void serverAdd() {
		String url = "http://localhost:8080/community-api/server/add";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "149751");
		p.put("sign_type", "MD5");
		p.put("sign", "82b429ff6a6f98d7611be440e4e102a4");
		p.put("app_id", 1001);
		p.put("gamename", "皇室战争");
		p.put("server_id", 10011);
		p.put("server_code", "huangshiserver");
		p.put("server_name", "天下一通");
		p.put("server_desc", "天下一通");
		p.put("creat_time", 149751);
		p.put("start_time", 149751);
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void gameAdd() {
		String url = "http://localhost:8080/community-api/game/add";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "1497515216512");
		p.put("sign_type", "MD5");
		p.put("sign", "962c30ef8d87ad5916005ac4eb54c817");
		p.put("app_id", 1001);
		p.put("gamename", "皇室战争");
		p.put("classify", 4);
		p.put("gameflag", "huangshizhanzheng");
		p.put("creat_time", "1497515216512");
		p.put("status", "2");
		p.put("pinyin", "huangshizhanzheng");
		p.put("initial", "h");
		p.put("version", 1);
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void gameUpdate() {
		JSONObject jo = new JSONObject();
		jo.put("update_time", "1497515216512");
		jo.put("status", "3");
		jo.put("pinyin", "huangshizhanzheng1");
		String url = "http://localhost:8080/community-api/game/update";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "1497515216512");
		p.put("sign_type", "MD5");
		p.put("sign", "68fac253cecb1229bf4481c6b7ebd8bf");
		p.put("app_id", 1001);
		p.put("upinfo", jo.toString());
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void gameDelete() {
		String url = "http://localhost:8080/community-api/game/delete";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "1497515216512");
		p.put("sign_type", "MD5");
		p.put("sign", "9900e4768e916339e18f6ad87759d656");
		p.put("app_id", 1001);
		p.put("delete_time", "1497515216512");
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}

	public static void gameRestore() {
		String url = "http://localhost:8080/community-api/game/restore";
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("plat_id", PLAT_ID);
		p.put("timestamp", "1497515216512");
		p.put("sign_type", "MD5");
		p.put("sign", "1818a53f8a546b13a53f1da851c40a41");
		p.put("app_id", 1001);
		p.put("restore_time", "1497515216512");
		String result = HttpRequest.postForm(url, p);
		System.out.println(result);
	}
}
