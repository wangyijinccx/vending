package com.ipeaksoft.moneyday.api.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.glxn.qrgen.core.image.ImageType;
import net.glxn.qrgen.javase.QRCode;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/qr")
public class VendQRController extends BaseController {

	@ResponseBody
	@RequestMapping("getQr")
	public void addForHost(HttpServletRequest request, String token,
			String device, Integer type, HttpServletResponse response) {
		String qrtext ="http://xiguamei.com";

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

}
