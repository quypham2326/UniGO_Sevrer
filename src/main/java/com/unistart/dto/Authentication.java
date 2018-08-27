package com.unistart.dto;

import com.fasterxml.jackson.annotation.JsonView;
import com.unistart.entities.Users;
import com.unistart.view.AuthenticationView;
import java.io.Serializable;

public class Authentication implements Serializable {

    @JsonView(AuthenticationView.Info.class)
    private String username;
    private String password;
    @JsonView(AuthenticationView.Info.class)
    private String image;
    @JsonView(AuthenticationView.Info.class)
    private String role;
    @JsonView(AuthenticationView.Info.class)
    private String name;
    @JsonView(AuthenticationView.Info.class)
    private String providerId;
    @JsonView(AuthenticationView.Info.class)
    private String providerName;
    @JsonView(AuthenticationView.Info.class)
    private String token;

    public Authentication() {
    }

    public Authentication(Users users) {
        username = users.getUsername();
        password = users.getPassword();
        image = users.getImage();
        name = users.getName();
        if (users.getRole() != null) {
            role = users.getRole().getName();
        }
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getProviderId() {
        return providerId;
    }

    public void setProviderId(String providerId) {
        this.providerId = providerId;
    }

    public String getProviderName() {
        return providerName;
    }

    public void setProviderName(String providerName) {
        this.providerName = providerName;
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

}
