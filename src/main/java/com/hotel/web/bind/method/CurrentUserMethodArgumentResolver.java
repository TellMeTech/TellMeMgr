package com.hotel.web.bind.method;

import com.hotel.web.bind.annotation.CurrentUser;
import org.springframework.core.MethodParameter;
import org.springframework.web.bind.support.WebDataBinderFactory;
import org.springframework.web.context.request.NativeWebRequest;
import org.springframework.web.method.support.HandlerMethodArgumentResolver;
import org.springframework.web.method.support.ModelAndViewContainer;

public class CurrentUserMethodArgumentResolver
  implements HandlerMethodArgumentResolver
{
  public boolean supportsParameter(MethodParameter parameter)
  {
    if (parameter.hasParameterAnnotation(CurrentUser.class)) {
      return true;
    }
    return false;
  }

  public Object resolveArgument(MethodParameter parameter, ModelAndViewContainer mavContainer, NativeWebRequest webRequest, WebDataBinderFactory binderFactory) throws Exception
  {
    CurrentUser currentUserAnnotation = (CurrentUser)parameter.getParameterAnnotation(CurrentUser.class);
    return webRequest.getAttribute(currentUserAnnotation.value(), 0);
  }
}