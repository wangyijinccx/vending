package com.ipeaksoft.moneyday.admin.controller;

import java.security.Principal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ipeaksoft.moneyday.admin.util.JsonTransfer;
import com.ipeaksoft.moneyday.admin.util.MD5Util;
import com.ipeaksoft.moneyday.core.entity.AdminUser;
import com.ipeaksoft.moneyday.core.service.AdminUserService;

@Controller
@RequestMapping(value = "/account")
public class AccountController extends BaseController {

	@Autowired
	private AdminUserService AdminUserService;

	/**
	 * 创建用户页面
	 * @param map
	 * @param principal
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/create", method = { RequestMethod.GET })
	public String Account_Create(ModelMap map, Principal principal,
			HttpServletRequest request) {
		return "/account/create_account";
	}

	/**
	 * 创建用户
	 * @param record
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/create", method = { RequestMethod.POST })
	public String Account_Add(AdminUser record, HttpServletRequest request) {
		String result = "{\"status\":true,\"msg\":\"添加成功\"}";
		AdminUser sessionUser = getUser();
		if (sessionUser.getLevel() == -1) {
		} else if (sessionUser.getLevel() == 0) {
		} else if (sessionUser.getLevel() == 1) {
		} else if (sessionUser.getLevel() == 2) {
		} else {
			return "{\"status\":false,\"msg\":\"您没有权限创建用户\"}";
		}
		record.setLevel(record.getLevel());
		record.setCreateTime(new Date());// 指定用户创建时间
		record.setModifyTime(new Date());
		record.setPassword(MD5Util.md5(record.getPassword())); // 加密密码
		record.setIsValid(1);
		record.setPid(sessionUser.getId());

		try {
			AdminUser existInfo = AdminUserService.getUserByName(record
					.getUsername());
			if (existInfo != null) {
				return "{\"status\":false,\"msg\":\"用户名已经存在\"}";
			}
			if (AdminUserService.addUser(record) < 1) {
				result = "{\"status\":false,\"msg\":\"添加失败\"}";
			}
		} catch (Exception ex) {
			result = "{\"status\":false,\"msg\":\"添加失败\"}";
		}
		return result;
	}
	
	/**
	 * 用户列表
	 * @param map
	 * @param principal
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/list")
	public ModelAndView Account_List(ModelMap map, Principal principal, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/account/list");
		return mv;
	}
	
	/**
	 * 用户信息
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/Load_UserList")
	public Object Load_UserList(HttpServletRequest request) {
		// 获取当前登录用户信息
		AdminUser adminSession = getUser();
		if (adminSession == null) {
			return "";
		}
		int start = Integer.parseInt(request.getParameter("start"));// 开始记录数
		int pageSize = Integer.parseInt(request.getParameter("length"));// 每页记录数
		String sEcho = request.getParameter("draw");// 搜索内容
		String searchContent = request.getParameter("search[value]");
		int total = 100;
		Map<String, Object> where = new HashMap<String, Object>();
		where.put("keys", searchContent.equals("") ? null : searchContent);
		where.put("start", start);
		where.put("limit", pageSize);
		where.put("ordeStr", "id");
		List<AdminUser> list = AdminUserService.findPageUserByWhere(where);
		total = AdminUserService.findPageUserByWhereCount(where);
		String result = JsonTransfer.getJsonFromList(sEcho, list);
		result = "{\"draw\":" + sEcho + ",\"recordsTotal\":" + pageSize
				+ ",\"recordsFiltered\":" + total + ",\"data\":" + result
				+ "}";
		return result;
	}
	
	/**
	 * 删除
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/delete")
	public Object delete(HttpServletRequest request) {
		// 获取当前登录用户信息
		String id = request.getParameter("id");
		AdminUser adminUser = adminUserService.getUserById(Integer.parseInt(id));
		if(null  == adminUser){
			//return "400";
		}
		AdminUser ad = new AdminUser();
		ad.setId((Integer.parseInt(id)));
		ad.setIsValid(0);
		ad.setModifyTime(new Date());
		if(adminUserService.updateUser(ad)<1){
			//return "401";
		}
		return "/account/list";
	}
	
	/**
	 * 激活
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/activation")
	public Object activation(HttpServletRequest request) {
		// 获取当前登录用户信息
		String id = request.getParameter("id");
		AdminUser adminUser = adminUserService.getUserById(Integer.parseInt(id));
		if(null  == adminUser){
			//return "400";
		}
		AdminUser ad = new AdminUser();
		ad.setId((Integer.parseInt(id)));
		ad.setIsValid(1);
		ad.setModifyTime(new Date());
		if(adminUserService.updateUser(ad)<1){
			//return "401";
		}
		return "/account/list";
	}
	
	
	
	
}
