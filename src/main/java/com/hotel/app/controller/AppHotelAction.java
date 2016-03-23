package com.hotel.app.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.common.JsonResult;
import com.hotel.model.User;
import com.hotel.web.controller.BaseAction;

@Scope("prototype")
@Controller
@RequestMapping({"/app/hotel"})
public class AppHotelAction extends BaseAction
{	
//  @Resource(name="userService")
//  private UserService userService;

  @ResponseBody
  @RequestMapping(value={"/jsonLoadHotel.do"}, method={org.springframework.web.bind.annotation.RequestMethod.POST})
  public JsonResult<User> json(User user, HttpServletRequest request, HttpServletResponse response) {
    JsonResult<User> json = new JsonResult<User>();
    json.setCode(new Integer(0));
    json.setMessage("hello hotel");
   
    return json;
  }
}