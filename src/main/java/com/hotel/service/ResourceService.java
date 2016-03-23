package com.hotel.service;

import java.util.List;

import com.hotel.model.Resource;

public interface ResourceService {
	
    List<Resource> getResourceByRoleId(Integer id);
    
    List<Resource> getResourceByParentId(Integer id);
}