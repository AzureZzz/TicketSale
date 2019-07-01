package com.guet.service;

import com.guet.entity.BusBill;

import java.util.List;

public interface IBusBillService {

    /**
     * 汽车票出单
     * @param busBill
     * @return
     * @throws Exception
     */
    String addBusBill(BusBill busBill) throws Exception;

    /**
     * 汽车票退票
     * @param bbId
     * @param uId
     * @throws Exception
     */
    Float returnBusBill(Long bbId,Long uId) throws Exception;

    /**
     * 汽车票支付
     * @param bbId
     * @param uId
     * @throws Exception
     */
    Float payBusBill(Long bbId,Long uId) throws Exception;
}
