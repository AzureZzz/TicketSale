package com.guet.dao;

import com.guet.entity.TrainSeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TrainSeatMapper extends ICommonMapper<TrainSeat,Long> {
    void updateState(@Param("tsId") Long tsId,@Param("seatState")Boolean state)throws Exception;
}