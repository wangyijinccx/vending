package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;








import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipeaksoft.moneyday.admin.util.JsonTransfer;
import com.ipeaksoft.moneyday.core.entity.VendCompany;
import com.ipeaksoft.moneyday.core.service.VendCompanyGoodsService;
import com.ipeaksoft.moneyday.core.service.VendCompanyService;
import com.ipeaksoft.moneyday.core.service.VendGoodsService;

@Controller
@RequestMapping(value = "/mobile")
public class VendMobileController extends BaseController {

	@Autowired
	private VendGoodsService vendGoodsService;
	@Autowired
	private VendCompanyService vendCompanyService;
	@Autowired
	private VendCompanyGoodsService vendCompanyGoodsService;
	
	@RequestMapping(value = "/published")
	public ModelAndView published(ModelMap map, Principal principal,
			HttpServletRequest request) {
		List<VendCompany> vcs =  vendCompanyService.selectAll(null, null);
		ModelAndView mv = new ModelAndView();
		mv.getModelMap().put("company", vcs);
		mv.setViewName("/mobile/published");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping(value = "/exit")
	public String exit(HttpServletRequest request) throws Exception {
		try {
			int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
			int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
			String sEcho = request.getParameter("draw");// 搜索内容
			Integer companyId = Integer.parseInt(request.getParameter("id"));
			List<Map<Object, Object>> list = vendCompanyGoodsService
					.selectExist(companyId, start, pageSize);
			int total = vendCompanyGoodsService.selectExistNum(companyId);
			String result = JsonTransfer.getJsonFromList(sEcho, list);
			result = "{\"draw\":" + sEcho + ",\"recordsTotal\":" + pageSize
					+ ",\"recordsFiltered\":" + total + ",\"data\":" + result
					+ "}";
			return result;
		} catch (Exception ex) {
			throw ex;
		}
	}
}
