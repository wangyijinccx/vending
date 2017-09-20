package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipeaksoft.moneyday.admin.util.JsonTransfer;
import com.ipeaksoft.moneyday.core.entity.VendCompany;
import com.ipeaksoft.moneyday.core.service.AdminUserService;
import com.ipeaksoft.moneyday.core.service.CommUserService;
import com.ipeaksoft.moneyday.core.service.VendCompanyService;

@Controller
@RequestMapping(value = "/company")
public class VendCompanyController extends BaseController {
    
	@Autowired
	private VendCompanyService vendCompanyService;
	

	@RequestMapping(value = "/published")
	public String published(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/company/published";
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.getModelMap().put("game", null);
		mv.setViewName("/game/update");
		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/data_load")
	public String data_load(HttpServletRequest request) throws Exception {
		try {
			int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
			int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
			String sEcho = request.getParameter("draw");// 搜索内容
			List<VendCompany> list = vendCompanyService.selectAll(start, pageSize);
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
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"更新成功\"}";
		return result;
	}

}
