package com.hotel.dao;

import java.util.List;

import com.hotel.model.Role;

@MyBatisRepository
public interface RoleMapper {
	Role selectByPrimaryKey(Integer id);
	
    int deleteByPrimaryKey(Integer id);

    int insert(Role record);

    int insertSelective(Role record);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectAll();
    
    List<Role> getExistRole(Role role);
}
