package com.utar.flightwebapp_18acb02736.model.entity;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Login {

    @JsonProperty("email")
    private String email;
    @JsonProperty("password")
    private String password;

    public Login(String email, String password) {
        this.email = email;
        this.password = password;
    }

    public Login() {
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
