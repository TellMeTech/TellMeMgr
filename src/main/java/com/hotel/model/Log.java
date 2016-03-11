package com.hotel.model;

import java.util.Date;

import com.hotel.common.utils.Page;

public class Log extends Page
{
  private Integer id;
  private Date logTime;
  private Byte logType;
  private Byte actorType;
  private Integer actorId;
  private String ip;
  private String message;
  
  private String actorName;
  private User user;

  public User getUser() {
	return user;
}

public void setUser(User user) {
	this.user = user;
}

public String getActorName() {
	return actorName;
}

public void setActorName(String actorName) {
	this.actorName = actorName;
}

public Integer getId()
  {
    return this.id;
  }

  public void setId(Integer id) {
    this.id = id;
  }

  public Date getLogTime() {
    return this.logTime;
  }

  public void setLogTime(Date logTime) {
    this.logTime = logTime;
  }

  public Byte getLogType() {
    return this.logType;
  }

  public void setLogType(Byte logType) {
    this.logType = logType;
  }

  public Byte getActorType() {
    return this.actorType;
  }

  public void setActorType(Byte actorType) {
    this.actorType = actorType;
  }

  public Integer getActorId() {
    return this.actorId;
  }

  public void setActorId(Integer actorId) {
    this.actorId = actorId;
  }

  public String getIp() {
    return this.ip;
  }

  public void setIp(String ip) {
    this.ip = ip;
  }

  public String getMessage() {
    return this.message;
  }

  public void setMessage(String message) {
    this.message = message;
  }
}