package com.hotel.common.baidu;

import com.sun.org.apache.xml.internal.security.exceptions.Base64DecodingException;
import com.sun.org.apache.xml.internal.security.utils.Base64;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import net.sf.json.JSONObject;

public class BaiduUtil
{
  public static void main(String[] args)
  {
    getBaiduLocation(103.1234F, 130.2345F);
  }

  public static String getBaiduLocationConvert(float x, float y)
    throws MalformedURLException, IOException
  {
    String url = String.format("http://api.map.baidu.com/ag/coord/convert?from=0&to=4&x=%f&y=%f", new Object[] { Float.valueOf(x), Float.valueOf(y) });
    HttpURLConnection urlConnection = (HttpURLConnection)new URL(url).openConnection();
    urlConnection.connect();
    BufferedReader reader = new BufferedReader(new InputStreamReader(urlConnection.getInputStream()));
    String lines = reader.readLine();
    reader.close();
    urlConnection.disconnect();
    return lines;
  }

  public static BaiduLocation getBaiduLocation(float gpsx, float gpsy) {
    BaiduLocation bl = new BaiduLocation();
    try {
      bl.ok = false;
      String res = getBaiduLocationConvert(gpsx, gpsy);
      System.out.println(res);

      JSONObject a = JSONObject.fromObject(res);
      bl.ok = "0".equals(a.getString("error"));
      if (bl.ok) {
        bl.baidux = ConvertBase64(a.getString("x"));
        bl.baiduy = ConvertBase64(a.getString("y"));
        System.out.println("bl.baidux:::" + bl.baidux);
        System.out.println("bl.baiduy:::" + bl.baiduy);
      }
    } catch (Exception e) {
      e.printStackTrace();
      bl.ok = false;
    }
    return bl;
  }
  private static float ConvertBase64(String str) throws Base64DecodingException {
    byte[] bs = Base64.decode(str);
    return Float.valueOf(new String(bs)).floatValue();
  }
}