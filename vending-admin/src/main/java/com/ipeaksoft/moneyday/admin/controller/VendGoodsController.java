package com.ipeaksoft.moneyday.admin.controller;

import java.math.BigDecimal;
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
import com.ipeaksoft.moneyday.core.entity.VendGoods;
import com.ipeaksoft.moneyday.core.service.VendGoodsService;

@Controller
@RequestMapping(value = "/goods")
public class VendGoodsController extends BaseController {

	@Autowired
	private VendGoodsService vendGoodsService;

	@RequestMapping(value = "/published")
	public String published(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/goods/published";
	}

	@RequestMapping(value = "/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		VendGoods vg = vendGoodsService
				.selectByPrimaryKey(Integer.parseInt(id));
		mv.getModelMap().put("goods", vg);
		mv.setViewName("/goods/update");
		return mv;
	}

	@RequestMapping(value = "/create")
	public String create(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/goods/create";
	}

	@ResponseBody
	@RequestMapping(value = "/data_load")
	public String data_load(HttpServletRequest request) throws Exception {
		try {
			int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
			int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
			String sEcho = request.getParameter("draw");// 搜索内容
			List<VendGoods> list = vendGoodsService.selectAll(start, pageSize);
			int total = vendGoodsService.selectNum();
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
	public String add(VendGoods vendGoods, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"添加成功\"}";
		try {
			Double originalPrice = vendGoods.getOriginalPrice();
			Double discount = vendGoods.getDiscount();
			BigDecimal bigDecimalMultiply = (new BigDecimal(originalPrice))
					.multiply(new BigDecimal(discount / 10));
			double actualPrice = bigDecimalMultiply.doubleValue();
			vendGoods.setActualPrice(actualPrice);
			vendGoods.setCreateTime(new Date());
			vendGoods.setUpdateTime(new Date());
			if (vendGoodsService.insertSelective(vendGoods) < 1) {
				result = "{\"status\":true,\"msg\":\"添加失败\"}";
			}

		} catch (Exception e) {
			result = "{\"status\":true,\"msg\":\"添加失败\"}";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/updateInfo")
	public String updateInfo(VendGoods vendGoods, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"更新成功\"}";
		try {
			// 进行更新操作
			VendGoods model = vendGoodsService.selectByPrimaryKey(vendGoods
					.getId());
			if (model == null) {
				result = "{\"status\":true,\"msg\":\"不存在该对象\"}";
			} else {
				Double originalPrice = vendGoods.getOriginalPrice();
				Double discount = vendGoods.getDiscount();
				BigDecimal bigDecimalMultiply = (new BigDecimal(originalPrice))
						.multiply(new BigDecimal(discount / 10));
				double actualPrice = bigDecimalMultiply.doubleValue();
				model.setName(vendGoods.getName());
				model.setOriginalPrice(vendGoods.getOriginalPrice());
				model.setActualPrice(actualPrice);
				model.setDiscount(vendGoods.getDiscount());
				model.setStatus(vendGoods.getStatus());
				model.setNum(vendGoods.getNum());
				model.setUpdateTime(new Date());
				if (vendGoodsService.updateByPrimaryKeySelective(model) < 1) {
					result = "{\"status\":true,\"msg\":\"更新失败\"}";
				}
			}

		} catch (Exception e) {
			result = "{\"status\":true,\"msg\":\"更新失败\"}";
		}
		return result;
	}

	@ResponseBody
	@RequestMapping(value = "/addnum")
	public String addNum(HttpServletRequest request) {
		String result = "200";
		String num = request.getParameter("num");
		String goodId = request.getParameter("goodId");
		try {
			VendGoods model = vendGoodsService.selectByPrimaryKey(Integer
					.parseInt(goodId));
			VendGoods vg = new VendGoods();
			vg.setId(Integer.parseInt(goodId));
			vg.setUpdateTime(new Date());
			vg.setNum(model.getNum() + Integer.parseInt(num));
			if (vendGoodsService.updateByPrimaryKeySelective(vg) < 1) {
				result = "100";
			}
		} catch (Exception e) {
			result = "100";
		}
		return result;
	}

}
