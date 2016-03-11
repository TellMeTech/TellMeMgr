package com.hotel.common.shiro;

import com.hotel.common.utils.EhcacheUtil;
import java.util.concurrent.atomic.AtomicInteger;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.credential.HashedCredentialsMatcher;

public class RetryLimitHashedCredentialsMatcher extends HashedCredentialsMatcher
{
  public boolean doCredentialsMatch(AuthenticationToken token, AuthenticationInfo info)
  {
    String username = (String)token.getPrincipal();

    Object element = EhcacheUtil.getItem(username);
    if (element == null) {
      EhcacheUtil.putItem(username, Integer.valueOf(1));
      element = Integer.valueOf(0);
    } else {
      int count = Integer.parseInt(element.toString()) + 1;
      element = Integer.valueOf(count);
      EhcacheUtil.putItem(username, element);
    }
    AtomicInteger retryCount = new AtomicInteger(Integer.parseInt(element.toString()));

    boolean matches = super.doCredentialsMatch(token, info);
    if (matches)
    {
      EhcacheUtil.removeItem(username);
    }
    return matches;
  }
}