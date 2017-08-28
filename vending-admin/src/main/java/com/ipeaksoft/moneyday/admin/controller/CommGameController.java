package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipeaksoft.moneyday.admin.util.JsonTransfer;
import com.ipeaksoft.moneyday.core.entity.CommGame;
import com.ipeaksoft.moneyday.core.service.CommGameService;

@Controller
@RequestMapping(value = "/game")
public class CommGameController extends BaseController {
	@Autowired
	private CommGameService CommGameService;

	@InitBinder
	protected void initBinder(HttpServletRequest request,
			ServletRequestDataBinder binder) throws Exception {
		DateFormat fmt = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		CustomDateEditor dateEditor = new CustomDateEditor(fmt, true);
		binder.registerCustomEditor(Date.class, dateEditor);
	}

	@RequestMapping(value = "/published")
	public String published(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/game/published";
	}

	

	@RequestMapping(value = "/update")
	public ModelAndView update(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		String id = request.getParameter("id");
		mv.addObject("id", Long.parseLong(request.getParameter("id")));
		CommGame game = CommGameService.selectByPrimaryKey(Integer
				.parseInt(id));
		mv.getModelMap().put("game", game);
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
			List<CommGame> list = CommGameService.selectListGame(
					start, pageSize);
			int total = CommGameService.selectNum();
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
	public String updateInfo(CommGame commGame, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"更新成功\"}";
		try {
			// 进行更新操作
			CommGame model = CommGameService.selectByPrimaryKey(commGame.getId());
			if (model == null) {
				result = "{\"status\":true,\"msg\":\"不存在该对象\"}";
			} else {
				CommGame cg = new CommGame();
				cg.setDescription(commGame.getDescription());
				cg.setStartTime(commGame.getStartTime());
				cg.setEndTime(commGame.getEndTime());
				cg.setRules(commGame.getRules());
				cg.setId(commGame.getId());
				if (CommGameService.updateByPrimaryKeySelective(cg) < 1) {
					result = "{\"status\":true,\"msg\":\"更新失败\"}";
				}
			}

		} catch (Exception e) {
			result = "{\"status\":true,\"msg\":\"更新失败\"}";
		}
		return result;
	}

}
