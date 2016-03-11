package com.hotel.web.controller;

import com.hotel.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.log4j.Logger;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;

public abstract class BaseAction
{
  protected Logger log = Logger.getLogger(getClass());
  private String resultCode;
  private String resultMessage;
  private HttpServletRequest req;
  private HttpServletResponse res;

  public HttpServletRequest getReq()
  {
    return this.req;
  }

  public void setReq(HttpServletRequest req) {
    this.req = req;
  }

  public HttpServletResponse getRes() {
    return this.res;
  }

  public void setRes(HttpServletResponse res) {
    this.res = res;
  }

  public Object getSession(String key) {
    return SecurityUtils.getSubject().getSession().getAttribute(key);
  }

  public Session getSession() {
    return SecurityUtils.getSubject().getSession();
  }

  public String getResultCode() {
    return this.resultCode;
  }

  public void setResultCode(String resultCode) {
    this.resultCode = resultCode;
  }

  public String getResultMessage() {
    return this.resultMessage;
  }

  public void setResultMessage(String resultMessage) {
    this.resultMessage = resultMessage;
  }

  protected User getLoginUser()
  {
    User loginUser = (User)SecurityUtils.getSubject().getSession().getAttribute("userInfo");
    return loginUser;
  }

  protected void setLoginUser(User loginUser)
  {
    SecurityUtils.getSubject().getSession().setAttribute("userInfo", loginUser);
  }
}