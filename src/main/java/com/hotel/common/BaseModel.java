package com.hotel.common;

import java.io.Serializable;
import java.lang.reflect.Field;
import java.lang.reflect.Modifier;
import java.util.HashMap;
import java.util.Map;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.codehaus.jackson.JsonProcessingException;
import org.codehaus.jackson.map.ObjectMapper;

public abstract class BaseModel
  implements Serializable
{
  public String toString()
  {
    return ToStringBuilder.reflectionToString(this);
  }

  public String toJson()
  {
    ObjectMapper om = new ObjectMapper();
    try {
      return om.writeValueAsString(this);
    } catch (JsonProcessingException e) {
      e.printStackTrace();
    } catch (Exception e) {
      e.printStackTrace();
    }
    return null;
  }

  public Map<String, Object> toMap()
  {
    Map map = new HashMap();
    Field[] fields = getClass().getDeclaredFields();
    for (Field field : fields) {
      if (!Modifier.isStatic(field.getModifiers()))
        try {
          field.setAccessible(true);
          map.put(field.getName(), field.get(this));
        } catch (Exception e) {
          e.printStackTrace();
        }
    }
    return map;
  }
}