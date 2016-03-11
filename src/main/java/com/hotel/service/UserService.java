package com.hotel.service;

import com.hotel.common.ReturnResult;
import com.hotel.model.User;

public interface UserService {

    int deleteUser(Integer id);

    int saveUser(User record);
    
    int updateUser(User record);
    
    ReturnResult<User> getUserById(Integer id);
    
    ReturnResult<User> login(String loginName, String passwd,boolean rememberMe) throws Exception;
}