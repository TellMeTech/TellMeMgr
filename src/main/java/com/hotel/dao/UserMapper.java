package com.hotel.dao;

import java.util.List;

import com.hotel.model.User;

@MyBatisRepository
public interface UserMapper {
	User selectByPrimaryKey(Integer id);
	
    int deleteByPrimaryKey(Integer id);

    int insert(User record);

    int insertSelective(User record);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    User getUserByName(String username);
    
    List<User> getUsers(User record);
    
    int countUsers(User record);
}
