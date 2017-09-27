package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.util.Date;
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
import com.ipeaksoft.moneyday.core.entity.VendCompanyGoods;
import com.ipeaksoft.moneyday.core.service.VendCompanyGoodsService;
import com.ipeaksoft.moneyday.core.service.VendCompanyService;
import com.ipeaksoft.moneyday.core.service.VendGoodsService;

@Controller
@RequestMapping(value = "/companygoods")
public class VendCompanyGoodsController extends BaseController {

	@Autowired
	private VendCompanyService vendCompanyService;
	@Autowired
	private VendCompanyGoodsService vendCompanyGoodsService;
	@Autowired
	private VendGoodsService vendGoodsService;

	@RequestMapping(value = "/goodsmanager")
	public ModelAndView goodsManager(ModelMap map, Principal principal,
			HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		Integer id = Integer.parseInt(request.getParameter("id"));
		VendCompany company = vendCompanyService.selectByPrimaryKey(id);
		List<VendCompanyGoods> vcg = vendCompanyGoodsService
				.selectByCompanyId(id);
		mv.getModelMap().put("company", company);
		mv.getModelMap().put("companygoods", vcg);
		mv.setViewName("/company/goods_manager");

		return mv;
	}

	@ResponseBody
	@RequestMapping(value = "/data_exit")
	public String data_exit(HttpServletRequest request) throws Exception {
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

	@ResponseBody
	@RequestMapping(value = "/data_nothave")
	public String data_nothave(HttpServletRequest request) throws Exception {
		try {
			int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
			int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
			String sEcho = request.getParameter("draw");// 搜索内容
			Integer companyId = Integer.parseInt(request.getParameter("id"));
			List<Map<Object, Object>> list = vendCompanyGoodsService
					.selectNotHave(companyId, start, pageSize);
			int total = vendCompanyGoodsService.selectNotHaveNum(companyId);
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
	@RequestMapping(value = "/shelves")
	public String shelves(HttpServletRequest request) {
		String result = "{\"status\":200,\"msg\":\"上架成功\"}";
		try {
			Integer companyId = Integer.parseInt(request
					.getParameter("companyId"));
			Integer goodsId = Integer.parseInt(request.getParameter("goodId"));
			// 添加商品，不需要判断是否已上架。
			VendCompanyGoods vcg = new VendCompanyGoods();
			vcg.setCompanyId(companyId);
			vcg.setGoodsId(goodsId);
			vcg.setNum(0);
			vcg.setStatus((byte) 1);
			vcg.setCreateTime(new Date());
			vcg.setUpdateTime(new Date());
			vcg.setSalesAmount(0);
			int rnum = vendCompanyGoodsService.insertSelective(vcg);
			if (rnum < 1) {
				return result = "{\"status\":301,\"msg\":\"上架失败\"}";
			}
		} catch (Exception e) {
			result = "{\"status\":500,\"msg\":\"上架失败\"}";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/down")
	public String down(HttpServletRequest request) {
		String result = "{\"status\":200,\"msg\":\"下架成功\"}";
		try {
			Integer companyId = Integer.parseInt(request
					.getParameter("companyId"));
			Integer goodsId = Integer.parseInt(request.getParameter("goodId"));
			// 下架商品
			VendCompanyGoods model = vendCompanyGoodsService
					.selectByGoodsAndCompanyId(goodsId, companyId);
			VendCompanyGoods vcg = new VendCompanyGoods();
			vcg.setId(model.getId());
			vcg.setStatus((byte) 0);
			vcg.setUpdateTime(new Date());

			int rnum = vendCompanyGoodsService.updateByPrimaryKeySelective(vcg);
			if (rnum < 1) {
				return result = "{\"status\":301,\"msg\":\"下架失败\"}";
			}
		} catch (Exception e) {
			result = "{\"status\":500,\"msg\":\"下架失败\"}";
		}
		return result;
	}
}
