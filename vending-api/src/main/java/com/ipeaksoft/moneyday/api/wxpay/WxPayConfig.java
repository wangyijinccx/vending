package com.ipeaksoft.moneyday.api.wxpay;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


/**
 *
 * @author lish
 */
public class WxPayConfig {
	//请求接口
	public static final String  POST_URL ="https://api.mch.weixin.qq.com/mmpaymkttransfers/promotion/transfers";
    //编码格式
    public static final String  CHARSET = "UTF-8";
    //西瓜妹   
	//public static final String  API_KEY = "JiuRu111XigUAmEi222liJIAngtAo333";//商户apikey
	//public static final String  MCHID = "1305314501";//商户号
    //public static final String APPID_XIGUAMEI = "wxbcbd557ee763bf7c";//公众号的APPID
    
    //钱袋精灵
    public static final String  API_KEY = "JiuRu111XigUAmEi222liJIAngtAo333";//商户apikey
  	public static final String  MCHID = "1362456902";//商户号
    public static final String APPID_XIGUAMEI = "wx0689b1b1de2de97f";//公众号的APPID
    
}
