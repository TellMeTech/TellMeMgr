package com.hotel.dao;

import java.util.List;

import com.hotel.model.Log;
@MyBatisRepository
public interface LogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Log record);

    int insertSelective(Log record);

    Log selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Log record);

    int updateByPrimaryKey(Log record);

	List<Log> getLogList(Log log);

	int getLogListCount(Log log);
}