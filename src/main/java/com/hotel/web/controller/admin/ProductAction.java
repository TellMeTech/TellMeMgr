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
@RequestMapping({"/admin/product"})
public class ProductAction extends BaseAction
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
	@RequestMapping(value = "/productList.do")
	public String productList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/product/productList";
	}
	
	@RequestMapping(value = "/categoryList.do")
	public String categoryList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/product/categoryList";
	}
	
	@RequestMapping(value = "/parameterList.do")
	public String parameterList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/product/parameterList";
	}
	
	@RequestMapping(value = "/photoList.do")
	public String photoList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/product/photoList";
	}
	
 	// [end]
}
