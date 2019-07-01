package com.guet.dao;

import com.guet.entity.Log;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface LogMapper extends ICommonMapper<Log,Long> {

}