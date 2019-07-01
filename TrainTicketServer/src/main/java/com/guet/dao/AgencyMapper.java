package com.guet.dao;

import com.guet.entity.Agency;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface AgencyMapper extends ICommonMapper<Agency,Long> {

    List<Agency> selectByCity(@Param("city") String city)throws Exception;

    Agency selectByName(@Param("name")String name)throws Exception;
}