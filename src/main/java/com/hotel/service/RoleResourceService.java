package com.hotel.service;

import com.hotel.model.RoleResource;

public interface RoleResourceService {
	
	int add(RoleResource record);
    
	int deletePermissionByRoleAndResource(RoleResource record);
}