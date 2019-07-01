package com.guet.entity;

import java.io.Serializable;

public class Agency implements Serializable {
    private Long aId;

    private String city;

    private String name;

    private String adress;

    private String saleTime;

    private Short windowNum;

    private String contactNum;

    private static final long serialVersionUID = 1L;

    public Long getaId() {
        return aId;
    }

    public void setaId(Long aId) {
        this.aId = aId;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }

    public String getSaleTime() {
        return saleTime;
    }

    public void setSaleTime(String saleTime) {
        this.saleTime = saleTime == null ? null : saleTime.trim();
    }

    public Short getWindowNum() {
        return windowNum;
    }

    public void setWindowNum(Short windowNum) {
        this.windowNum = windowNum;
    }

    public String getContactNum() {
        return contactNum;
    }

    public void setContactNum(String contactNum) {
        this.contactNum = contactNum == null ? null : contactNum.trim();
    }
}