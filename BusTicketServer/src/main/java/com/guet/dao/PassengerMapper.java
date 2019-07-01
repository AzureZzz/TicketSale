package com.guet.dao;

import com.guet.entity.Passenger;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface PassengerMapper extends ICommonMapper<Passenger,Long>{

    List<Passenger> selectByUid(@Param("uId") Long uId) throws Exception;

}