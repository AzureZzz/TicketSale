package com.guet.service;

import com.guet.entity.TrainBill;

import java.util.List;

public interface ITrainBillService {

    /**
     * 查询火车票详情信息
     * @param tbId 火车票Id
     * @return 火车票信息
     * @throws Exception
     */
    TrainBill getTrainBill(Long tbId) throws Exception;

    /**
     * 查询用户所有已支付火车票订单
     * @param uId  用户Id
     * @return 火车票订单结果集
     */
    List<TrainBill> getUserTrainBillsPay(Long uId)throws Exception;

    /**
     * 查询用户所有未支付火车票订单
     * @param uId  用户Id
     * @return 火车票订单结果集
     */
    List<TrainBill> getUserTrainBillsUnPay(Long uId)throws Exception;
}
