package com.guet.service.impl;

import com.guet.dao.TrainBillMapper;
import com.guet.entity.TrainBill;
import com.guet.service.ITrainBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TrainBillServiceImpl implements ITrainBillService {

    @Autowired
    private TrainBillMapper trainBillMapper;

    @Override
    public TrainBill getTrainBill(Long tbId) throws Exception {
        return trainBillMapper.selectByPrimaryKey(tbId);
    }

    @Override
    public List<TrainBill> getUserTrainBillsPay(Long uId) throws Exception {
        return trainBillMapper.selectByUidPay(uId);
    }

    @Override
    public List<TrainBill> getUserTrainBillsUnPay(Long uId) throws Exception {
        return trainBillMapper.selectByUidUnPay(uId);
    }
}
