package com.guet.entity;

import java.io.Serializable;

public class Agency implements Serializable {
    private Long aId;

    private String province;

    private String town;

    private String county;

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

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province == null ? null : province.trim();
    }

    public String getTown() {
        return town;
    }

    public void setTown(String town) {
        this.town = town == null ? null : town.trim();
    }

    public String getCounty() {
        return county;
    }

    public void setCounty(String county) {
        this.county = county == null ? null : county.trim();
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