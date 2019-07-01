package com.guet.dao;

import com.guet.entity.Station;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface StationMapper extends ICommonMapper<Station,String>{

}