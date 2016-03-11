package com.hotel.common.utils;

import java.io.IOException;
import java.io.PrintStream;
import java.util.Properties;

public class PropertiesUtil
{
  private static PropertiesUtil propertiesUtil;

  public static PropertiesUtil getInstance()
  {
    if (propertiesUtil == null) {
      propertiesUtil = new PropertiesUtil();
    }
    return propertiesUtil;
  }

  public String getParamsProperty(String name)
  {
    Properties p = new Properties();
    try
    {
      p.load(getClass().getClassLoader().getResourceAsStream("params.properties"));
    }
    catch (IOException e) {
      e.printStackTrace();
    }
    String param = p.getProperty(name);
    System.out.println("param:::::" + param);
    return param;
  }

  public static void main(String[] args)
  {
    System.out.println(getInstance().getParamsProperty("AUTO_NO"));
  }
}