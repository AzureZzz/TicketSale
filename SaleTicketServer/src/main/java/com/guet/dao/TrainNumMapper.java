package com.guet.dao;

import com.guet.entity.TrainNum;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface TrainNumMapper extends ICommonMapper<TrainNum,Long> {

}