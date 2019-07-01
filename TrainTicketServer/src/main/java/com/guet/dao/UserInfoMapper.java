package com.guet.dao;

import com.guet.entity.UserInfo;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface UserInfoMapper extends ICommonMapper<UserInfo,Long> {

}