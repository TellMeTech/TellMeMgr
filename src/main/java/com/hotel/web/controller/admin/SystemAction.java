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
import com.hotel.model.RoleResource;
import com.hotel.model.User;
import com.hotel.service.ResourceService;
import com.hotel.service.RoleResourceService;
import com.hotel.service.RoleService;
import com.hotel.service.UserService;
import com.hotel.web.controller.BaseAction;

@Scope("prototype")
@Controller
@RequestMapping({"/admin/system"})
public class SystemAction extends BaseAction
{

	// [start] 接口引用
	@Resource(name = "resourceService")
	private ResourceService resourceService; 
	
	@Resource(name = "userService")
	private UserService userService; 
	
	@Resource(name = "roleService")
	private RoleService roleService;
	
	@Resource(name = "roleResourceService")
	private RoleResourceService roleResourceService;

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
		request.getSession().setAttribute("roles", roleService.getRoles());
		request.getSession().setAttribute("resources", resourceService.getResourceByParentId(0));
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
		if (user.getPageNo() == null){
			user.setPageNo(1);
		}
		if (user.getPageSize() == null){
			user.setPageSize(10);
		}
		String temp = user.getSearchName();
		
		if (temp != null){
			temp = new String(temp.getBytes("ISO-8859-1"), "UTF-8");
			user.setSearchName("%"+temp+"%");
		}
		user.setTotalCount(userService.countUsers(user));
		request.getSession().setAttribute("users", userService.getUsers(user));
		user.setSearchName(temp);
		request.getSession().setAttribute("pageUser", user);
		return "web/admin/system/userList";
	}
	
	@RequestMapping(value = "/userInfo.do")
	public String userInfo(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		User u = new User();
		if(user.getId() == null || user.getId().intValue() == 0){
			u.setId(0);
			//u.setDescription("");
			u.setName("");
		}else{
			u = userService.getUserById(user.getId());
		}
		request.getSession().setAttribute("u", u);
		return "web/admin/system/userInfo";
	}
	
	@RequestMapping(value = "/config.do")
	public String config(
			User user,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException{ 
		
		return "web/admin/system/config";
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonLoadRoleList.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<Role> jsonLoadRoleList(
			Role role, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<Role> js = new JsonResult<Role>();
		js.setCode(new Integer(1));
		js.setMessage("获取失败!");
		try {
			List<Role> roles = roleService.getRoles();
			js.setCode(new Integer(0));
			js.setMessage("");
			js.setList(roles);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return js;
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
	
	@ResponseBody
	@RequestMapping(value = "/jsonLoadRoleResource.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<com.hotel.model.Resource> jsonLoadRoleResource(
			Role role, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<com.hotel.model.Resource> js = new JsonResult<com.hotel.model.Resource>();
		js.setCode(new Integer(1));
		js.setMessage("保存失败!");
		try {
			if (role.getId() != null && role.getId() != 0) {
				List<com.hotel.model.Resource> list = resourceService.getResourceByRoleId(role.getId());
				js.setCode(new Integer(0));
				js.setMessage("保存成功!");
				js.setList(list);
			} 
		} catch (Exception e) {
			e.printStackTrace();
		}
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonUpdateRoleResource.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<Role> jsonUpdateRoleResource(
			Role role, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<Role> js = new JsonResult<Role>();
		js.setCode(new Integer(1));
		js.setMessage("保存失败!");
		
		if (role.getId() == null || role.getId() == 0){
			js.setMessage("参数不完整!");
			return js;
		}
		
		String needAdd = request.getParameter("needAdd");
		String needDelete = request.getParameter("needDelete");
		if(needAdd == null || needDelete == null){
			js.setMessage("参数不完整!");
			return js;
		}
		
		//删除部分
		if(!needDelete.trim().equals("")){
			RoleResource roleResource = new RoleResource();
			if(needDelete.contains(",")){
				String[] arr = needDelete.split(",");
				roleResource.setRoleId(role.getId());
				for(String tp : arr){
					roleResource.setResourceId(new Integer(tp));
					roleResourceService.deletePermissionByRoleAndResource(roleResource);
				}
			}else{
				roleResource.setRoleId(role.getId());
				roleResource.setResourceId(new Integer(needDelete));
				roleResourceService.deletePermissionByRoleAndResource(roleResource);
			}
		}
		
		//添加部分
		if(!needAdd.trim().equals("")){
			RoleResource roleResource = new RoleResource();
			if(needAdd.contains(",")){
				String[] arr = needAdd.split(",");
				roleResource.setRoleId(role.getId());
				for(String tp : arr){
					roleResource.setResourceId(new Integer(tp));
					roleResourceService.add(roleResource);
				}
			}else{
				roleResource.setRoleId(role.getId());
				roleResource.setResourceId(new Integer(needDelete));
				roleResourceService.add(roleResource);
			}
		}
		
		js.setCode(new Integer(0));
		js.setMessage("保存成功!");
		return js;
	}
	
	@ResponseBody
	@RequestMapping(value = "/jsonUpdateSystemUserStatus.do", method = RequestMethod.POST, produces = { "text/html;charset=UTF-8" })
	public JsonResult<User> jsonUpdateSystemUserStatus(
			User user, HttpServletRequest request,
			HttpServletResponse response) {
		JsonResult<User> js = new JsonResult<User>();
		js.setCode(new Integer(1));
		js.setMessage("保存失败!");
		try {
			int res = userService.updateUser(user);
			if(res > 0){
				js.setCode(new Integer(0));
				js.setMessage("保存成功!");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return js;
	}
	
 	// [end]
}
