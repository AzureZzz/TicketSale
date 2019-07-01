package com.guet.dao;

import com.guet.entity.BusNum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.sql.Date;
import java.util.List;

@Mapper
@Repository
public interface BusNumMapper extends ICommonMapper<BusNum,Long>{
    List<BusNum> selectByInfo(@Param("startCity") String startCity, @Param("arriveCity")String arriveCity
                            ,@Param("goOff") String goOff,@Param("endTime")String endTime) throws Exception;
    List<BusNum> selectByInfo2(@Param("startCity") String startCity, @Param("arriveCity")String arriveCity
                             ,@Param("goOff") String goOff,@Param("endTime")String endTime) throws Exception;
}