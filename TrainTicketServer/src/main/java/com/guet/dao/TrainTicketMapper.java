package com.guet.dao;

import com.guet.entity.TrainTicket;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainTicketMapper extends ICommonMapper<TrainTicket,Long> {

    List<TrainTicket> selectByInfo(@Param("startPlace") String startPlace, @Param("desPlace")String desPlace,
                                   @Param("goOff") String goOff,@Param("endTime")String endTime) throws Exception;

    TrainTicket selectStart(@Param("startStation")String startStation,@Param("trainNo") String trainNo)throws Exception;

    TrainTicket selectDes(@Param("desStation")String startStation,@Param("trainNo") String trainNo)throws Exception;
}