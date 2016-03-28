package com.hotel.service;

import java.util.List;

import com.hotel.common.ReturnResult;
import com.hotel.model.User;

public interface UserService {

    int deleteUser(Integer id);

    int saveUser(User record);
    
    int updateUser(User record);
    
    User getUserById(Integer id);
    
    ReturnResult<User> login(String loginName, String passwd,boolean rememberMe) throws Exception;
    
    List<User> getUsers(User record);
    
    int countUsers(User record);
}