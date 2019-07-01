package com.guet.dao;

import com.guet.entity.Station;

public interface StationMapper {
    int deleteByPrimaryKey(String name);

    int insert(Station record);

    int insertSelective(Station record);

    Station selectByPrimaryKey(String name);

    int updateByPrimaryKeySelective(Station record);

    int updateByPrimaryKey(Station record);
}