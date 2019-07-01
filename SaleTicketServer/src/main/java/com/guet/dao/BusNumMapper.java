package com.guet.dao;

import com.guet.entity.BusNum;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface BusNumMapper extends ICommonMapper<BusNum,Long> {

}