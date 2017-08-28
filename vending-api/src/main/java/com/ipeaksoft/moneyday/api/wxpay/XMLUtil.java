package com.ipeaksoft.moneyday.api.wxpay;
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;
import java.util.TreeMap;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.SAXException;

/**
 *
 * @author lish
 */
public class XMLUtil {

	/**
	 * 解析微信xml,返回第一级元素键值对。如果第一级元素有子节点，则此节点的值是子节点的xml数据。 
	 * 
	 * @param strxml
	 * @return
	 * @throws Exception 
	 * @throws JDOMException
	 * @throws IOException
	 */
	public static Map<String, String> doXMLParse(String strxml) {
		Map<String, String> map = new HashMap<>();
		InputStream in = null;
		try {
			strxml = strxml.replaceFirst("encoding=\".*\"", "encoding=\"UTF-8\"");
			if (null == strxml || "".equals(strxml)) {
				return null;
			}
			in  = new ByteArrayInputStream(strxml.getBytes("UTF-8"));
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();  
			DocumentBuilder builder = dbf.newDocumentBuilder();
			Document doc = builder.parse(in);
			Element root = doc.getDocumentElement();
			NodeList collegeNodes = root.getChildNodes();  
			for (int i = 0; i < collegeNodes.getLength(); i++) {
				Node college = collegeNodes.item(i);
				if (college != null && college.getNodeType() == Node.ELEMENT_NODE) {
					String k = college.getNodeName();
					String v = college.getTextContent();
					map.put(k, v);
				}
			}
		} catch (IOException | ParserConfigurationException | SAXException e1) {
			e1.printStackTrace();
		} finally { 
			try {
                if (in != null) 
                    in.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return map;
	}
	
	
	/**
	 * @Description：将请求参数转换为微信xml格式的字符串
	 * @param parameters  请求参数
	 * @return
	 */
	public static String getRequestXml(TreeMap<String, String> parameters) throws Exception{
		StringBuffer sb = new StringBuffer();
		sb.append("<xml>");
		Set es = parameters.entrySet();
		Iterator it = es.iterator();
		while(it.hasNext()) {
			Map.Entry entry = (Map.Entry)it.next();
			String k = (String)entry.getKey();
			String v = (String)entry.getValue();
			if ("attach".equalsIgnoreCase(k) || "body".equalsIgnoreCase(k) || "sign".equalsIgnoreCase(k)) {
				sb.append("<" + k + ">" + "<![CDATA[" + v + "]]></" + k + ">");
			}else {
				sb.append("<" + k + ">" + v + "</" + k + ">");
			}
		}
		sb.append("</xml>");
		return sb.toString();
	}
	    
}
