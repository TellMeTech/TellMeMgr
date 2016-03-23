package com.hotel.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.dao.ResourceMapper;
import com.hotel.model.Resource;
import com.hotel.service.ResourceService;

@Service("resourceService")
public class ResourceServiceImpl implements ResourceService {

	@Autowired
	private ResourceMapper resourceMapper;

	@Override
	public List<Resource> getResourceByRoleId(Integer id) {
		// TODO Auto-generated method stub
		return resourceMapper.selectByRoleId(id);
	}

	@Override
	public List<Resource> getResourceByParentId(Integer id) {
		// TODO Auto-generated method stub
		return resourceMapper.selectByParentId(id);
	}
}
