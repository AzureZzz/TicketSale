package com.guet.dao;

import com.guet.entity.TrainNum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainNumMapper extends ICommonMapper<TrainNum,String> {

    List<TrainNum> selectByInfo(@Param("goOff") String goOff,@Param("endTime")String endTime,
                                @Param("startStation") String startStation)throws Exception;

    TrainNum selectByNo(@Param("goOff") String goOff,@Param("endTime")String endTime,
                        @Param("trainNo") String trainNo)throws Exception;
}