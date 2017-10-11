package com.ipeaksoft.moneyday.api.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.glxn.qrgen.core.image.ImageType;
import net.glxn.qrgen.javase.QRCode;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ipeaksoft.moneyday.core.service.HttpService;

@Controller
@RequestMapping(value = "/qr")
public class VendQRController extends BaseController {

	@Autowired
	private HttpService httpService;

	/**
	 * 测试：二维码生成
	 * @param request
	 * @param type
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("getParaQr")
	public void getParaQr(HttpServletRequest request, Integer type,
			HttpServletResponse response) {
		try {
			URL url = new URL(
					"https://mp.weixin.qq.com/cgi-bin/showqrcode?ticket=gQHi8DoAAAAAAAAAASxodHRwOi8vd2VpeGluLnFxLmNvbS9xL0UweTNxNi1sdlA3RklyRnNKbUFvAAIELdnUUgMEAAAAAA%3D%3D");
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setConnectTimeout(5 * 1000);
			InputStream inStream = conn.getInputStream();// 通过输入流获取图片数据
			byte data[] = readInputStream(inStream);
			// inStream.read(data); //读数据
			// inStream.close();
			response.setContentType("image/jpg"); // 设置返回的文件类型
			OutputStream os = response.getOutputStream();
			os.write(data);
			os.flush();
			os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 测试二维码生成
	 * @param request
	 * @param response
	 */
	@ResponseBody
	@RequestMapping("getQr")
	public void addForHost(HttpServletRequest request,
			HttpServletResponse response) {
		String qrtext = "http://xiguamei.com";

		ByteArrayOutputStream out = QRCode.from(qrtext).to(ImageType.PNG)
				.stream();

		response.setContentType("image/png");
		response.setContentLength(out.size());

		try {
			OutputStream outStream = response.getOutputStream();
			outStream.write(out.toByteArray());

			outStream.flush();
			outStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public static byte[] readInputStream(InputStream inStream) throws Exception {
		ByteArrayOutputStream outStream = new ByteArrayOutputStream();
		byte[] buffer = new byte[2048];
		int len = 0;
		while ((len = inStream.read(buffer)) != -1) {
			outStream.write(buffer, 0, len);
		}
		inStream.close();
		return outStream.toByteArray();
	}

}
