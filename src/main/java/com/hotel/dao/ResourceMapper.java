package com.hotel.dao;

import java.util.List;

import com.hotel.model.Resource;

@MyBatisRepository
public interface ResourceMapper {
	Resource selectByPrimaryKey(Integer id);
	
    int deleteByPrimaryKey(Integer id);

    int insert(Resource record);

    int insertSelective(Resource record);

    int updateByPrimaryKeySelective(Resource record);

    int updateByPrimaryKey(Resource record);
    
    List<Resource> selectByParentId(Integer parentId);
    
    List<Resource> selectByRoleId(Integer roleId);
}
