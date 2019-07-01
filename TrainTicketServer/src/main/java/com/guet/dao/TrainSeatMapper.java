package com.guet.dao;

import com.guet.entity.TrainSeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainSeatMapper extends ICommonMapper<TrainSeat,Long> {

    List<TrainSeat> selectByIdandType(@Param("ttId")Long ttId, @Param("seatType") String seatType) throws Exception;
}