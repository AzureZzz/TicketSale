package com.guet.dao;

import com.guet.entity.Artical;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

@Mapper
@Repository
public interface ArticalMapper extends ICommonMapper<Artical,Long>{

}