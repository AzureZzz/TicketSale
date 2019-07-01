package com.guet.dao;

import com.guet.entity.Passenger;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface PassengerMapper extends ICommonMapper<Passenger,Long>{

}