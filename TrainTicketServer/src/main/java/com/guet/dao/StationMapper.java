package com.guet.dao;

import com.guet.entity.Station;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface StationMapper extends ICommonMapper<Station,String> {

    List<Station> selectByInfo(@Param("city") String city) throws Exception;

}