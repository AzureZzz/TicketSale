package com.guet.dao;

import com.guet.entity.UserBase;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface UserBaseMapper extends ICommonMapper<UserBase,Long>{

    List<UserBase> selectAllUserBase(@Param("start")int start, @Param("limit") int limit) throws Exception;

    List<UserBase> selectUserBaseKey(@Param("start")int start, @Param("limit") int limit,
                                     @Param("username") String username) throws Exception;

    UserBase selectByUsername(@Param("username") String username)throws Exception;
}