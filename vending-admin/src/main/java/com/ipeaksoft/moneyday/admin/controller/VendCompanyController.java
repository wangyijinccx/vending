package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.util.Date;
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

	@RequestMapping(value = "/goodsmanager")
	public String goodsManager(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/company/goods_manager";
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

}
