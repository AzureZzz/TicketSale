package com.guet.service;

import com.guet.entity.TrainBill;

import java.util.List;

public interface ITrainBillService {

    /**
     * 火车票出单
     * @param trainBill
     * @return
     * @throws Exception
     */
    String addTrainBill(TrainBill trainBill)throws Exception;

    /**
     * 火车票退票
     * @param tbId
     * @param uId
     * @throws Exception
     */
    Float returnTrainBill(Long tbId,Long uId)throws Exception;

    /**
     * 火车票支付
     * @param tbId
     * @param uId
     * @throws Exception
     */
    Float payTrainBill(Long tbId,Long uId)throws Exception;

}
