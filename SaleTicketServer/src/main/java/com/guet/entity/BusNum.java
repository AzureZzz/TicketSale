package com.guet.entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

public class BusNum implements Serializable {
    private Long bId;

    private String startStation;

    private String desStation;

    private String startCity;

    private String arriveCity;

    private String busType;

    private Date goOff;

    private Date arriveTime;

    private Float piece;

    private String numNo;

    private List<BusSeat> busSeats;

    private static final long serialVersionUID = 1L;

    public Long getbId() {
        return bId;
    }

    public void setbId(Long bId) {
        this.bId = bId;
    }

    public String getStartStation() {
        return startStation;
    }

    public void setStartStation(String startStation) {
        this.startStation = startStation == null ? null : startStation.trim();
    }

    public String getDesStation() {
        return desStation;
    }

    public void setDesStation(String desStation) {
        this.desStation = desStation == null ? null : desStation.trim();
    }

    public String getStartCity() {
        return startCity;
    }

    public void setStartCity(String startCity) {
        this.startCity = startCity == null ? null : startCity.trim();
    }

    public String getArriveCity() {
        return arriveCity;
    }

    public void setArriveCity(String arriveCity) {
        this.arriveCity = arriveCity == null ? null : arriveCity.trim();
    }

    public String getBusType() {
        return busType;
    }

    public void setBusType(String busType) {
        this.busType = busType == null ? null : busType.trim();
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

    public Float getPiece() {
        return piece;
    }

    public void setPiece(Float piece) {
        this.piece = piece;
    }

    public List<BusSeat> getBusSeats() {
        return busSeats;
    }

    public String getNumNo() {
        return numNo;
    }

    public void setNumNo(String numNo) {
        this.numNo = numNo;
    }

    public void setBusSeats(List<BusSeat> busSeats) {
        this.busSeats = busSeats;
    }
}