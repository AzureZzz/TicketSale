package com.guet.entity;

import java.util.Date;

public class BusTicketInfo {

    private Long bsId;

    private String startStation;

    private String desStation;

    private String busType;

    private Date goOff;

    private Short seatNo;

    private Float piece;

    private String numNo;

    public Long getBsId() {
        return bsId;
    }

    public void setBsId(Long bsId) {
        this.bsId = bsId;
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

    public String getBusType() {
        return busType;
    }

    public void setBusType(String busType) {
        this.busType = busType;
    }

    public Date getGoOff() {
        return goOff;
    }

    public void setGoOff(Date goOff) {
        this.goOff = goOff;
    }

    public Short getSeatNo() {
        return seatNo;
    }

    public void setSeatNo(Short seatNo) {
        this.seatNo = seatNo;
    }

    public Float getPiece() {
        return piece;
    }

    public void setPiece(Float piece) {
        this.piece = piece;
    }

    public String getNumNo() {
        return numNo;
    }

    public void setNumNo(String numNo) {
        this.numNo = numNo;
    }
}
