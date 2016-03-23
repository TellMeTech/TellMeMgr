package com.hotel.service;

import java.util.List;

import com.hotel.model.Role;

public interface RoleService {
	
	List<Role> getRoles();
	
	Role selectByPrimaryKey(Integer id);
	
	List<Role> getExistRole(Role role);
	
	boolean saveRole(Role role);
	
	boolean deleteRole(int roleId);
}