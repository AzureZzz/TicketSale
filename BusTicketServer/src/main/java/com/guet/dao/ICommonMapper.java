package com.guet.dao;

import java.io.Serializable;
import java.util.List;

public interface ICommonMapper<T,PK extends Serializable>{

    int deleteByPrimaryKey(PK id) throws Exception;

    PK insert(T record) throws Exception;

    PK insertSelective(T record) throws Exception;

    T selectByPrimaryKey(PK id) throws Exception;

    List<T> selectAll() throws Exception;

    int selectCount() throws Exception;

    int updateByPrimaryKeySelective(T record) throws Exception;

    int updateByPrimaryKeyWithBLOBs(T record) throws Exception;

    int updateByPrimaryKey(T record) throws Exception;


}

