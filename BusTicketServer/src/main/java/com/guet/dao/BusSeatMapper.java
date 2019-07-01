package com.guet.dao;

import com.guet.entity.BusSeat;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface BusSeatMapper extends ICommonMapper<BusSeat,Long>{

}