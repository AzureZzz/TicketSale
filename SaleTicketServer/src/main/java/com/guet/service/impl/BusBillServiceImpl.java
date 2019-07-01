package com.guet.service.impl;

import com.guet.dao.BusBillMapper;
import com.guet.dao.BusNumMapper;
import com.guet.dao.BusSeatMapper;
import com.guet.dao.UserBaseMapper;
import com.guet.entity.BusBill;
import com.guet.entity.BusSeat;
import com.guet.entity.UserBase;
import com.guet.exceptions.BalanceNotEnoughException;
import com.guet.service.IBusBillService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.UUID;

@Service
public class BusBillServiceImpl implements IBusBillService {

    @Autowired
    private BusBillMapper busBillMapper;

    @Autowired
    private BusSeatMapper busSeatMapper;

    @Autowired
    private UserBaseMapper userBaseMapper;

    @Override
    public String addBusBill(BusBill busBill) throws Exception {
        String billNo = "No"+UUID.randomUUID();
        billNo = billNo.substring(0,15);
        busBill.setBillNo(billNo);
        busBill.setBillState(false);    //设为未支付
        busSeatMapper.updateState(busBill.getBsId(),true);//设置座位为已出售
        busBillMapper.insert(busBill);
        return billNo;
    }

    @Override
    public Float returnBusBill(Long bbId,Long uId) throws Exception {
        BusBill busBill = busBillMapper.selectByPrimaryKey(bbId);
        busSeatMapper.updateState(busBill.getBsId(),false); //设置座位为未出售
        Float cost = null;
        if(busBill.getBillState()){
            UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
            if(busBill.getBillType().equals("学生")){
                cost = (float)(busSeatMapper.selectByPrimaryKey(busBill.getBsId()).getBusNum().getPiece()*0.5);
            }else{
                cost =busSeatMapper.selectByPrimaryKey(busBill.getBsId()).getBusNum().getPiece();
            }
            userBase.setBalance(userBase.getBalance()+cost);
            userBaseMapper.updateByPrimaryKeySelective(userBase);
        }
        busBillMapper.deleteByPrimaryKey(bbId);     //删除车票
        return cost;
    }

    @Override
    public Float payBusBill(Long bbId,Long uId) throws Exception {
        UserBase userBase = userBaseMapper.selectByPrimaryKey(uId);
        BusBill busBill = busBillMapper.selectByPrimaryKey(bbId);
        Float result = null;
        if(busBill.getBillType().equals("学生")){
            result = (float) (busSeatMapper.selectByPrimaryKey(busBill.getBsId()).getBusNum().getPiece()*0.5);
        }else{
            result = busSeatMapper.selectByPrimaryKey(busBill.getBsId()).getBusNum().getPiece();
        }
        if(userBase.getBalance()-result < 0){
            throw new BalanceNotEnoughException();
        }else{
            busBillMapper.updateState(bbId,true);
            userBase.setBalance(userBase.getBalance()-result);
            userBaseMapper.updateByPrimaryKeySelective(userBase);
        }
        return result;
    }


}
