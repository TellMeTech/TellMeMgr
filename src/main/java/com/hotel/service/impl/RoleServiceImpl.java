package com.hotel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dao.RoleMapper;
import com.hotel.model.Role;
import com.hotel.service.RoleService;

@Service("roleService")
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper mapper;

	@Override
	public List<Role> getRoles() {
		// TODO Auto-generated method stub
		return mapper.selectAll();
	}

	@Override
	public Role selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return mapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Role> getExistRole(Role role) {
		// TODO Auto-generated method stub
		return mapper.getExistRole(role);
	}

	@Override
	public boolean saveRole(Role role) {
		int res = 0;
		if(role.getId()>0){
			res = mapper.updateByPrimaryKey(role);
		}else{
			res = mapper.insert(role);
		}
		if(res > 0){
			return true;
		}
		return false;
	}

	@Override
	public boolean deleteRole(int roleId) {
		// TODO Auto-generated method stub
		int res = mapper.deleteByPrimaryKey(roleId);
		if(res > 0){
			mapper.deletePermissionByRole(roleId);
			return true;
		}
		return false;
	}
}
