package com.hotel.common.utils;

public class Constants
{
  public static final String ADMINISTRATOR_ACCOUNT = "admin";
  public static final String USER_SESSION_NAME = "userInfo";
  public static final String USER_SESSION_RESOURCE = "userResources";
  public static final String CURRENT_MENU_ID = "__currentMenuId";
  public static final String THE_REALM_NAME = "userRealm";
  public static final String USER_INFO = "USER_INFO";
  public static final int IMAGE_RESIZE_WIDTH = 150;
  public static final int IMAGE_RESIZE_HEIGHT = 150;
  public static final int DEFAULT_PAGE_SIZE = 10;
  public static final Integer API_RESULT_SUCCESS = Integer.valueOf(0);
  public static final Integer API_RESULT_FAILURE = Integer.valueOf(1);
  public static final Integer API_RESULT_TIMEOUT = Integer.valueOf(95);
  public static final Integer API_RESULT_SUBMIT_DUPLICATE = Integer.valueOf(96);
  public static final Integer API_RESULT_PARAMTER_ERROR = Integer.valueOf(97);
  public static final Integer API_RESULT_TOKEN_ERROR = Integer.valueOf(98);
  public static final Integer API_RESULT_ORTHER_ERROR = Integer.valueOf(99);

  public static final Integer STATUS_ENABLE = Integer.valueOf(0);
  public static final Integer STATUS_DISABLE = Integer.valueOf(1);

  public static final Integer LATEST_TIME = Integer.valueOf(10);

  public static final String BLOWFISHCODE = PropertiesUtil.getInstance().getParamsProperty("BLOWFISHCODE");
  public static final String OPENFIRE_IP = PropertiesUtil.getInstance().getParamsProperty("OPENFIRE_IP");
  public static final String OPENFIRE_DOMAIN = PropertiesUtil.getInstance().getParamsProperty("OPENFIRE_DOMAIN");
  public static final String APK_VERSION = PropertiesUtil.getInstance().getParamsProperty("APK_VERSION");
  public static final String INIT_PASSWORD = "111111";
}