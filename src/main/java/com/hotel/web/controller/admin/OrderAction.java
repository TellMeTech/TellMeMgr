package com.hotel.web.controller.admin;

import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hotel.model.User;
import com.hotel.service.UserService;
import com.hotel.web.controller.BaseAction;

@Scope("prototype")
@Controller
@RequestMapping({"/admin/order"})
public class OrderAction extends BaseAction
{

	// [start] 接口引用
//	@Resource(name = "roleService")
//	private RoleService roleService; 
	
	@Resource(name = "userService")
	private UserService userService; 

	// [end]
	
	// [started]
	/**
	 * 系统用户管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
	@RequestMapping(value = "/orderList.do")
	public String OrderList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/order/orderList";
	}
	
 	// [end]
}
