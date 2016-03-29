package com.hotel.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.common.JsonResult;
import com.hotel.common.ReturnResult;
import com.hotel.model.Role;
import com.hotel.model.User;
import com.hotel.service.ResourceService;
import com.hotel.service.RoleService;
import com.hotel.service.UserService;

@Scope("prototype")
@Controller
public class LoginAction extends BaseAction
{	
  @Resource(name="userService")
  private UserService userService;
  @Resource(name="roleService")
  private RoleService roleService;
  @Resource(name="resourceService")
  private ResourceService resourceService;

//  @Resource(name="logService")
//  private LogService logService;

  @RequestMapping({"/admin.do"})
  public ModelAndView adminlogin() {
    ModelAndView mav = new ModelAndView("adminLogin");
    return mav;
  }

//  @RequestMapping({"/gotologin.do"})
//  public ModelAndView gotologin() {
//    ModelAndView mav = new ModelAndView("login");
//    return mav;
//  }
  @ResponseBody
  @RequestMapping(value={"/adminLogin.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public JsonResult<User> adminLogin(User user, HttpServletRequest request, HttpServletResponse response) {
    JsonResult<User> json = new JsonResult<User>();
    json.setCode(new Integer(1));
    json.setMessage("登录失败!");
    try {
      ReturnResult<User> res = this.userService.login(user.getName(), user.getPsd(), user.isRememberMe());
      if (res.getCode().intValue() == 1) {
    	User u = (User)res.getResultObject();
    	
    	//固定写死，确定表后需替换
    	Integer roleId = 1;
    	
        List<com.hotel.model.Resource> rs = parseResourceList(this.resourceService.getResourceByRoleId(roleId));
        request.getSession().setAttribute("userResources", rs);
        u.setSelectedMainMenu(rs.get(0).getId().intValue());
        u.setSelectedChildMenu(rs.get(0).getChildResourceList().get(0).getId().intValue());
        u.setChildMenuList(rs.get(0).getChildResourceList());
        
        setLoginUser(u);
        
        Role role = roleService.selectByPrimaryKey(roleId);
        request.getSession().setAttribute("roleName", role.getName());

        json.setCode(new Integer(0));
        json.setGotoUrl(rs.get(0).getUrl()); 
        json.setMessage("登录成功!");
        //日志
        //int type = u.getUserType();
        //logService.saveLog(u, u.getAccount()+"登录成功", IpUtil.getIp(request), (byte)type, (byte)1);
      } else {
        json.setMessage(res.getMessage());
        //logService.saveLog(new User(), user.getAccount()+"登录失败", IpUtil.getIp(request), null, (byte)2);
      }
    } catch (Exception e) {
      e.printStackTrace();
    }
    return json;
  }
//  @ResponseBody
//  @RequestMapping(value={"/customerLogin.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
//  public JsonResult<User> customerLogin(User user, HttpServletRequest request, HttpServletResponse response) { 
//	  JsonResult<User> json = new JsonResult<User>();
//    json.setCode(new Integer(1));
//    json.setMessage("登录失败!");
//    try {
//      ReturnResult<User> res = this.userService.login(user.getAccount(), user.getPassword(), user.isRememberMe(), user.getUserType());
//      if (res.getCode().intValue() == 1) {
//        setLoginUser((User)res.getResultObject());
//        json.setCode(new Integer(0));
//        json.setMessage("登录成功!");
//        //日志
//        User u = new User();
//        int type = u.getUserType();
//        //logService.saveLog(u, u.getAccount()+"登录成功", IpUtil.getIp(request), (byte)type, (byte)1);
//      } else {
//        json.setMessage(res.getMessage());
//        //logService.saveLog(new User(), user.getAccount()+"登录失败", IpUtil.getIp(request), null, (byte)2);
//      }
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//    return json; }
//
//  @ResponseBody
//  @RequestMapping(value={"/register.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
//  public JsonResult<User> register(User user, HttpServletRequest request, HttpServletResponse response) {
//    JsonResult<User> json = new JsonResult<User>();
//    json.setCode(new Integer(1));
//    json.setMessage("注册失败!");
//    try {
//      json.setMessage("注册成功!");
//    } catch (Exception e) {
//      e.printStackTrace();
//    }
//    return json;
//  }
  @ResponseBody
  @RequestMapping({"/jsonLoadSession.do"})
  public JsonResult<User> jsonLoadSession(@RequestParam(value="selectedMainMenu", required=false) Integer selectedMainMemu, @RequestParam(value="selectedChildMenu", required=false) Integer selectedChildMenu, HttpServletRequest request, HttpServletResponse response) { 
	  JsonResult<User> json = new JsonResult<User>();
    if (selectedMainMemu != null) {
      getLoginUser().setSelectedMainMenu(selectedMainMemu.intValue()); 
	@SuppressWarnings("unchecked")
	List<com.hotel.model.Resource> lf = (List<com.hotel.model.Resource>) request.getSession().getAttribute("userResources");
      for (com.hotel.model.Resource resource : lf) {
        if (resource.getId().intValue() == selectedMainMemu.intValue()) {
          getLoginUser().setSelectedChildMenu((resource.getChildResourceList().get(0)).getId().intValue());
          break;
        }
      }
    }
    else if (selectedChildMenu != null) {
      getLoginUser().setSelectedChildMenu(selectedChildMenu.intValue());
    }

    json.setCode(new Integer(0));
    json.setMessage("更新成功!");

    return json; }

  private List<com.hotel.model.Resource> parseResourceList(List<com.hotel.model.Resource> src)
  {
    for (com.hotel.model.Resource r : src) {
      r.setChildResourceList(this.resourceService.getResourceByParentId(r.getId()));
    }
    return src;
  }
}