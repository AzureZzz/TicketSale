package com.guet.dao;

import com.guet.entity.LateTrain;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface LateTrainMapper extends ICommonMapper<LateTrain,Long> {

}