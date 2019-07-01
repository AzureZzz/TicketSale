package com.guet.entity;

import java.io.Serializable;

public class TrainSeat implements Serializable {
    private Long tsId;

    private Long ttId;

    private TrainTicket trainTicket;

    private String seatType;

    private String seatNo;

    private Boolean seatState;

    private Float piece;

    private static final long serialVersionUID = 1L;

    public Long getTsId() {
        return tsId;
    }

    public void setTsId(Long tsId) {
        this.tsId = tsId;
    }

    public Long getTtId() {
        return ttId;
    }

    public void setTtId(Long ttId) {
        this.ttId = ttId;
    }

    public TrainTicket getTrainTicket() {
        return trainTicket;
    }

    public void setTrainTicket(TrainTicket trainTicket) {
        this.trainTicket = trainTicket;
    }

    public String getSeatType() {
        return seatType;
    }

    public void setSeatType(String seatType) {
        this.seatType = seatType == null ? null : seatType.trim();
    }

    public String getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(String seatNo) {
        this.seatNo = seatNo == null ? null : seatNo.trim();
    }

    public Boolean getSeatState() {
        return seatState;
    }

    public void setSeatState(Boolean seatState) {
        this.seatState = seatState;
    }

    public Float getPiece() {
        return piece;
    }

    public void setPiece(Float piece) {
        this.piece = piece;
    }
}