package com.guet.dao;

import com.guet.entity.Agency;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface AgencyMapper extends ICommonMapper<Agency,Long>{

}