package com.ipeaksoft.moneyday.admin.controller;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.security.Principal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONObject;
import com.ipeaksoft.moneyday.admin.util.JsonTransfer;
import com.ipeaksoft.moneyday.core.entity.VendCompany;
import com.ipeaksoft.moneyday.core.service.HttpService;
import com.ipeaksoft.moneyday.core.service.VendCompanyService;

@Controller
@RequestMapping(value = "/company")
public class VendCompanyController extends BaseController {

	@Autowired
	private VendCompanyService vendCompanyService;

	@Autowired
	private HttpService httpService;

	@RequestMapping(value = "/published")
	public String published(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/company/published";
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		VendCompany vc = vendCompanyService.selectByPrimaryKey(Integer
				.parseInt(id));
		mv.getModelMap().put("company", vc);
		mv.setViewName("/company/update");
		return mv;
	}

	@RequestMapping(value = "/create")
	public String create(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/company/create";
	}

	@ResponseBody
	@RequestMapping(value = "/data_load")
	public String data_load(HttpServletRequest request) throws Exception {
		try {
			int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
			int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
			String sEcho = request.getParameter("draw");// 搜索内容
			List<VendCompany> list = vendCompanyService.selectAll(start,
					pageSize);
			int total = vendCompanyService.selectNum();
			String result = JsonTransfer.getJsonFromList(sEcho, list);
			result = "{\"draw\":" + sEcho + ",\"recordsTotal\":" + pageSize
					+ ",\"recordsFiltered\":" + total + ",\"data\":" + result
					+ "}";
			return result;
		} catch (Exception ex) {
			throw ex;
		}
	}

	@ResponseBody
	@RequestMapping(value = "/add")
	public String add(VendCompany vendCompany, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"添加成功\"}";
		try {
			vendCompany.setCreateTime(new Date());
			vendCompany.setUpdateTime(new Date());
			if (vendCompanyService.insertSelective(vendCompany) < 1) {
				result = "{\"status\":true,\"msg\":\"添加失败\"}";
			}

		} catch (Exception e) {
			result = "{\"status\":true,\"msg\":\"添加失败\"}";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(VendCompany vendCompany, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"更新成功\"}";
		try {
			// 进行更新操作
			VendCompany model = vendCompanyService
					.selectByPrimaryKey(vendCompany.getId());
			if (model == null) {
				result = "{\"status\":true,\"msg\":\"不存在该对象\"}";
			} else {
				model.setCompany(vendCompany.getCompany());
				model.setAddress(vendCompany.getAddress());
				model.setTel(vendCompany.getTel());
				model.setStatus(vendCompany.getStatus());
				model.setUpdateTime(new Date());
				if (vendCompanyService.updateByPrimaryKeySelective(model) < 1) {
					result = "{\"status\":true,\"msg\":\"更新失败\"}";
				}
			}

		} catch (Exception e) {
			result = "{\"status\":true,\"msg\":\"更新失败\"}";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/readcode")
	public void readCode(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String companyId = request.getParameter("id");
			String url = "http://localhost:8080/vending-api/readcode?companyId="
					+ companyId;
			String callback = httpService.get(url);
			JSONObject json = JSONObject.parseObject(callback);
			if (json != null && "200".equals(json.getString("result"))) {
				String code = json.getString("code");
				URL codeUrl = new URL(code);
				HttpURLConnection conn = (HttpURLConnection) codeUrl
						.openConnection();
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
			}
		} catch (Exception e) {

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
