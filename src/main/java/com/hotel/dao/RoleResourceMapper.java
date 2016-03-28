package com.hotel.dao;

import com.hotel.model.RoleResource;

@MyBatisRepository
public interface RoleResourceMapper {
	RoleResource selectByPrimaryKey(Integer id);
	
    int deleteByPrimaryKey(Integer id);

    int insert(RoleResource record);

    int insertSelective(RoleResource record);

    int updateByPrimaryKeySelective(RoleResource record);

    int updateByPrimaryKey(RoleResource record);
    
    int deletePermissionByRole(int roleId);
    
    int deletePermissionByRoleAndResource(RoleResource record);
}
