package com.hotel.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dao.RoleResourceMapper;
import com.hotel.model.RoleResource;
import com.hotel.service.RoleResourceService;

@Service("roleResourceService")
public class RoleResourceServiceImpl implements RoleResourceService {

	@Autowired
	private RoleResourceMapper roleResourceMapper;

	@Override
	public int add(RoleResource record) {
		// TODO Auto-generated method stub
		return roleResourceMapper.insert(record);
	}

	@Override
	public int deletePermissionByRoleAndResource(RoleResource record) {
		// TODO Auto-generated method stub
		return roleResourceMapper.deletePermissionByRoleAndResource(record);
	}
}
