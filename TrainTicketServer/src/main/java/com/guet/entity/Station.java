package com.guet.entity;

import java.io.Serializable;

public class Station implements Serializable {
    private String name;

    private String city;

    private String contactPhone;

    private String adress;

    private Boolean stationType;

    private static final long serialVersionUID = 1L;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city == null ? null : city.trim();
    }

    public String getContactPhone() {
        return contactPhone;
    }

    public void setContactPhone(String contactPhone) {
        this.contactPhone = contactPhone == null ? null : contactPhone.trim();
    }

    public String getAdress() {
        return adress;
    }

    public void setAdress(String adress) {
        this.adress = adress == null ? null : adress.trim();
    }

    public Boolean getStationType() {
        return stationType;
    }

    public void setStationType(Boolean stationType) {
        this.stationType = stationType;
    }
}