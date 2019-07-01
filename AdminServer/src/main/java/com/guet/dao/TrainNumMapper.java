package com.guet.dao;

import com.guet.entity.TrainNum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface TrainNumMapper extends ICommonMapper<TrainNum,String>{

    List<TrainNum> selectByStation(@Param("start")int start, @Param("limit") int limit,
                                 @Param("station") String station)throws Exception;

    Integer selectCountByStation(@Param("station") String station)throws Exception;
}