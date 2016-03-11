package com.hotel.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.common.JsonResult;
import com.hotel.common.ReturnResult;
import com.hotel.model.User;
import com.hotel.service.UserService;

@Scope("prototype")
@Controller
public class LoginAction extends BaseAction
{

  @Resource(name="userService")
  private UserService userService;

//  @Resource(name="logService")
//  private LogService logService;

//  @RequestMapping({"/admin.do"})
//  public ModelAndView adminlogin() {
//    ModelAndView mav = new ModelAndView("adminLogin");
//    return mav;
//  }

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
//        List<ResourceConfig> lf = parseResourceList(this.resourceService.getUserResource(u.getRoleId()));
//        request.getSession().setAttribute("userResources", lf);
//
//        u.setSelectedMainMemu(((ResourceConfig)lf.get(0)).getId().intValue());
//        u.setSelectedChildMenu(((ResourceConfig)((ResourceConfig)lf.get(0)).getChildResourcelist().get(0)).getId().intValue());
//        u.setChildMenuList(((ResourceConfig)lf.get(0)).getChildResourcelist());
        setLoginUser(u);

        json.setCode(new Integer(0));
        //json.setGotoUrl(((ResourceConfig)lf.get(0)).getUrl()); 
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
//  @ResponseBody
//  @RequestMapping({"/jsonLoadSession.do"})
//  public JsonResult<User> jsonLoadSession(@RequestParam(value="selectedMainMemu", required=false) Integer selectedMainMemu, @RequestParam(value="selectedChildMenu", required=false) Integer selectedChildMenu, HttpServletRequest request, HttpServletResponse response) { 
//	  JsonResult<User> json = new JsonResult<User>();
//    if (selectedMainMemu != null) {
//      getLoginUser().setSelectedMainMemu(selectedMainMemu.intValue()); 
//	List<ResourceConfig> lf = (List<ResourceConfig>) request.getSession().getAttribute(Constants.USER_SESSION_RESOURCE);
//      for (ResourceConfig resource : lf) {
//        if (resource.getId().intValue() == selectedMainMemu.intValue()) {
//          getLoginUser().setSelectedChildMenu(((ResourceConfig)resource.getChildResourcelist().get(0)).getId().intValue());
//          break;
//        }
//      }
//    }
//    else if (selectedChildMenu != null) {
//      getLoginUser().setSelectedChildMenu(selectedChildMenu.intValue());
//    }
//
//    json.setCode(new Integer(0));
//    json.setMessage("更新成功!");
//
//    return json; }

//  private List<ResourceConfig> parseResourceList(List<ResourceConfig> src)
//  {
//    for (ResourceConfig f : src) {
//      f.setChildResourcelist(this.resourceService.getResourceByParentId(f.getId()));
//    }
//    return src;
//  }
}