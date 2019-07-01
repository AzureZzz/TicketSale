package com.guet.service.impl;

import com.guet.dao.TrainBillMapper;
import com.guet.dao.TrainSeatMapper;
import com.guet.dao.UserBaseMapper;
import com.guet.entity.TrainBill;
import com.guet.entity.TrainSeat;
import com.guet.entity.UserBase;
import com.guet.exceptions.BalanceNotEnoughException;
import com.guet.service.ITrainBillService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class TrainBillServiceImpl implements ITrainBillService {

    @Autowired
    private TrainSeatMapper trainSeatMapper;
    
    @Autowired
    private TrainBillMapper trainBillMapper;

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Override
    public String addTrainBill(TrainBill trainBill) throws Exception {
        String billNo = "No"+UUID.randomUUID();
        billNo = billNo.substring(0,15);
        trainBill.settNo(billNo);
        trainBill.setBillState(false);      //设为未支付
        System.out.println(trainBill.getTsId());
        trainSeatMapper.updateState(trainBill.getTsId(),true);//设置座位为已出售
        trainBillMapper.insert(trainBill);
        return billNo;
    }

    @Override
    public Float returnTrainBill(Long tbId,Long uId) throws Exception {
        TrainBill trainBill = trainBillMapper.selectByPrimaryKey(tbId);
        trainSeatMapper.updateState(trainBill.getTsId(),false);//设置座位为未出售
        Float cost = null;
        if(trainBill.getBillState()){
            UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
            if(trainBill.getType().equals("学生")){
                cost =(float) (trainSeatMapper.selectByPrimaryKey(trainBill.getTsId()).getPiece()*0.5);
            }else{
                cost = trainSeatMapper.selectByPrimaryKey(trainBill.getTsId()).getPiece();

            }
            userBase.setBalance(userBase.getBalance()+cost);
            userBaseMapper.updateByPrimaryKeySelective(userBase);
        }
        trainBillMapper.deleteByPrimaryKey(tbId);
        return cost;
    }

    @Override
    public Float payTrainBill(Long tbId,Long uId) throws Exception {
        UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
        TrainBill trainBill = trainBillMapper.selectByPrimaryKey(tbId);
        Float result = null;
        if(trainBill.getType().equals("学生")){
            result = (float) (trainSeatMapper.selectByPrimaryKey(trainBill.getTsId()).getPiece()*0.5);
        }else{
            result = trainSeatMapper.selectByPrimaryKey(trainBill.getTsId()).getPiece();
        }
        if(userBase.getBalance()-result<0){
            throw new BalanceNotEnoughException();
        }else{
            userBase.setBalance(userBase.getBalance()-result);
            userBaseMapper.updateByPrimaryKeySelective(userBase);
            trainBillMapper.updateState(tbId,true);
        }
        return result;
    }

}
