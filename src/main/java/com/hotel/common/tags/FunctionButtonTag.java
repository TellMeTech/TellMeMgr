package com.hotel.common.tags;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

public class FunctionButtonTag extends TagSupport
{
  private static final long serialVersionUID = -873501176437637524L;
  private String buttonType = "btn";
  private String functionCode;
  private String onClick = "";

  private String style = "";

  private String styleClass = "";

  private String iconCls = "";

  private String target = "";

  private String plain = "false";

  private String id = "";

  private String name = "";

  public String getButtonType() {
    return this.buttonType;
  }

  public void setButtonType(String buttonType) {
    this.buttonType = buttonType;
  }

  public String getOnClick() {
    return this.onClick;
  }

  public void setOnClick(String onClick) {
    this.onClick = onClick;
  }

  public String getStyle() {
    return this.style;
  }

  public void setStyle(String style) {
    this.style = style;
  }

  public String getStyleClass() {
    return this.styleClass;
  }

  public void setStyleClass(String styleClass) {
    this.styleClass = styleClass;
  }

  public String getIconCls() {
    return this.iconCls;
  }

  public void setIconCls(String iconCls) {
    this.iconCls = iconCls;
  }

  public String getFunctionCode() {
    return this.functionCode;
  }

  public void setFunctionCode(String functionCode) {
    this.functionCode = functionCode;
  }

  public String getTarget() {
    return this.target;
  }

  public void setTarget(String target) {
    this.target = target;
  }

  public String getPlain() {
    return this.plain;
  }

  public void setPlain(String plain) {
    this.plain = plain;
  }

  public String getId() {
    return this.id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return this.name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int doEndTag()
    throws JspException
  {
    throw new Error("Unresolved compilation problem: \n\tUSER_SESSION_FUNCTION cannot be resolved or is not a field\n");
  }
}