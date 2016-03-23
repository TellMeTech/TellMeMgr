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
@RequestMapping({"/admin/app"})
public class AppAction extends BaseAction
{

	// [start] 接口引用
//	@Resource(name = "roleService")
//	private RoleService roleService; 
	
	@Resource(name = "userService")
	private UserService userService; 

	// [end]
	
	// [started]
	/**
	 * 公告管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
	@RequestMapping(value = "/noticeList.do")
	public String NoticeList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/noticeList";
	}
	
	@RequestMapping(value = "/serverList.do")
	public String ServerList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/serverList";
	}
	
	@RequestMapping(value = "/discoveryList.do")
	public String DiscoveryList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/discoveryList";
	}
	
	@RequestMapping(value = "/adList.do")
	public String AdList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/adList";
	}
	
	@RequestMapping(value = "/topicList.do")
	public String TopicList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/topicList";
	}
	
	@RequestMapping(value = "/suggestList.do")
	public String SuggestList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		return "web/admin/app/suggestList";
	}
	
 	// [end]
}
