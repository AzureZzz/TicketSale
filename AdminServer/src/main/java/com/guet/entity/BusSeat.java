package com.guet.entity;

import java.io.Serializable;

public class BusSeat implements Serializable {
    private Long bsId;

    private Long bId;

    private BusNum busNum;

    private Short seatNo;

    private Boolean seatState;

    private static final long serialVersionUID = 1L;

    public Long getBsId() {
        return bsId;
    }

    public void setBsId(Long bsId) {
        this.bsId = bsId;
    }

    public Long getbId() {
        return bId;
    }

    public void setbId(Long bId) {
        this.bId = bId;
    }

    public BusNum getBusNum() {
        return busNum;
    }

    public void setBusNum(BusNum busNum) {
        this.busNum = busNum;
    }

    public Short getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(Short seatNo) {
        this.seatNo = seatNo;
    }

    public Boolean getSeatState() {
        return seatState;
    }

    public void setSeatState(Boolean seatState) {
        this.seatState = seatState;
    }
}