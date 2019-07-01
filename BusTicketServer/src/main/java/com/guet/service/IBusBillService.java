package com.guet.service;

import com.guet.entity.BusBill;
import org.springframework.stereotype.Service;

import java.util.List;

public interface IBusBillService {

    /**
     * 查询汽车票详情信息
     * @param bbId 汽车票Id
     * @return 汽车票信息
     * @throws Exception
     */
    BusBill getBusBill(Long bbId) throws Exception;

    /**
     * 查询用户所有已支付汽车票
     * @param uId  用户Id
     * @return 汽车票结果集
     */
    List<BusBill> getUserBusBillsPay(Long uId)throws Exception;

    /**
     * 查询用户所有未支付汽车票
     * @param uId  用户Id
     * @return 汽车票结果集
     */
    List<BusBill> getUserBusBillsUnPay(Long uId)throws Exception;

}
