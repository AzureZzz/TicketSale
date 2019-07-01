package com.guet.entity;

import java.util.Date;

public class TrainTicketInfo {

    private Long tsId;

    private String seatType;

    private String seatNo;

    private Float piece;

    private String startStation;

    private String desStation;

    private String trainNo;

    private Date goOff;

    private Date arriveTime;

    public Long getTsId() {
        return tsId;
    }

    public void setTsId(Long tsId) {
        this.tsId = tsId;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType;
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo;
    }

    public Float getPiece() {
        return piece;
    }

    public void setPiece(Float piece) {
        this.piece = piece;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation;
    }

    public String getDesStation() {
        return desStation;
    }

    public void setDesStation(String desStation) {
        this.desStation = desStation;
    }

    public String getTrainNo() {
        return trainNo;
    }

    public void setTrainNo(String trainNo) {
        this.trainNo = trainNo;
    }

    public Date getGoOff() {
        return goOff;
    }

    public void setGoOff(Date goOff) {
        this.goOff = goOff;
    }

    public Date getArriveTime() {
        return arriveTime;
    }

    public void setArriveTime(Date arriveTime) {
        this.arriveTime = arriveTime;
    }
}
