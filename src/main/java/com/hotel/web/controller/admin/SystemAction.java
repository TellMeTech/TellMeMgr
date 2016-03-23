package com.hotel.web.controller.admin;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.common.JsonResult;
import com.hotel.model.Role;
import com.hotel.model.User;
import com.hotel.service.RoleService;
import com.hotel.service.UserService;
import com.hotel.web.controller.BaseAction;

@Scope("prototype")
@Controller
@RequestMapping({"/admin/system"})
public class SystemAction extends BaseAction
{

	// [start] 接口引用
//	@Resource(name = "roleService")
//	private RoleService roleService; 
	
	@Resource(name = "userService")
	private UserService userService; 
	
	@Resource(name = "roleService")
	private RoleService roleService;

	// [end]
	
	// [started]
	/**
	 * 系统用户管理
	 *  
	 * @param request
	 * @param response
	 * @return 
	 */
	@RequestMapping(value = "/permissionsList.do")
	public String permissionsList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/system/permissionsList";
	}
	
	@RequestMapping(value = "/roleList.do")
	public String roleList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		request.getSession().setAttribute("roles", roleService.getRoles());
		return "web/admin/system/roleList";
	}
	
	@RequestMapping(value = "/roleInfo.do")
	public String roleInfo(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		Role role = new Role();
		if(request.getParameter("roleId") == null){
			role.setId(0);
			role.setDescription("");
			role.setName("");
		}else{
			int id = new Integer(request.getParameter("roleId"));
			if(id == 0) {
				role.setId(0);
				role.setDescription("");
				role.setName("");
			}else{
				role = roleService.selectByPrimaryKey(id);
			}
			
		}
		request.getSession().setAttribute("role", role);
		return "web/admin/system/roleInfo";
	}
	
	@RequestMapping(value = "/userList.do")
	public String userList(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/system/userList";
	}
	
	@RequestMapping(value = "/config.do")
	public String config(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/system/config";
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonSaveOrUpdateRole.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<Role> jsonSaveOrUpdateRole(
			Role role, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<Role> js = new JsonResult<Role>();
		js.setCode(new Integer(1));
		js.setMessage("保存失败!");
		Role existrole = new Role();
		try {
			if (role.getId() == null || role.getId() == 0) {
				
				existrole.setName(role.getName()); 
				List<Role> role1 = roleService.getExistRole(existrole);
				if(role1.size()>0){
					js.setMessage("角色名称已存在!");
					return js;
				}
			}else{
				existrole.setName(role.getName());
				existrole.setId(role.getId());
				List<Role> role1 = roleService.getExistRole(existrole);
				if(role1.size()>0){
					js.setMessage("角色名称已存在!");
					return js;
				}
			}  
			boolean res = roleService.saveRole(role);
			if(res){
				js.setCode(new Integer(0));
				js.setMessage("保存成功!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonDeleteRole.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<Role> jsonDeleteRole(
			Role role, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<Role> js = new JsonResult<Role>();
		js.setCode(new Integer(1));
		js.setMessage("保存失败!");
		try {
			if (role.getId() != null && role.getId() != 0) {
				if(roleService.deleteRole(role.getId())){
					js.setCode(new Integer(0));
					js.setMessage("保存成功!");
				}
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return js;
	}
	
 	// [end]
}
