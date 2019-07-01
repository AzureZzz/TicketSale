package com.guet.dao;

import com.guet.entity.LateTrain;
import com.guet.entity.TrainSeat;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface LateTrainMapper extends ICommonMapper<LateTrain,Long> {

    LateTrain selectByttId(@Param("ttId") Long ttId)throws Exception;

}