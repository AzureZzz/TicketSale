package com.guet.service;

import com.guet.entity.Agency;

import java.util.List;

public interface IAgencyService {

    /**
     * 查询某城市的代售点
     * @param city
     * @return
     * @throws Exception
     */
    List<Agency> getAgencyByInfo(String city) throws Exception;

    /**
     * 查询指定名称代售点
     * @param name
     * @return
     * @throws Exception
     */
    Agency getAgencyByName(String name)throws Exception;
}
