package com.utar.flightwebapp_18acb02736.model.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class ContactData {

    @JsonProperty("email")
    private String email;
    @JsonProperty("phone")
    private String phone;

    public ContactData(String email, String phone) {
        this.email = email;
        this.phone = phone;
    }

    public ContactData() {

    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }
}
