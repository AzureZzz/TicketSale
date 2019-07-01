package com.guet.entity;

import java.io.Serializable;
import java.util.Date;

public class TrainBill implements Serializable {
    private Long tbId;

    private Long uId;

    private TrainSeat trainSeat;

    private Passenger passenger;

    private String tNo;

    private String type;

    private Date buyTime;

    private Boolean billState;

    private static final long serialVersionUID = 1L;

    public Long getTbId() {
        return tbId;
    }

    public void setTbId(Long tbId) {
        this.tbId = tbId;
    }

    public Long getuId() {
        return uId;
    }

    public void setuId(Long uId) {
        this.uId = uId;
    }

    public TrainSeat getTrainSeat() {
        return trainSeat;
    }

    public void setTrainSeat(TrainSeat trainSeat) {
        this.trainSeat = trainSeat;
    }

    public Passenger getPassenger() {
        return passenger;
    }

    public void setPassenger(Passenger passenger) {
        this.passenger = passenger;
    }

    public String gettNo() {
        return tNo;
    }

    public void settNo(String tNo) {
        this.tNo = tNo == null ? null : tNo.trim();
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type == null ? null : type.trim();
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public Boolean getBillState() {
        return billState;
    }

    public void setBillState(Boolean billState) {
        this.billState = billState;
    }
}