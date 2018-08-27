package com.unistart.services.interfaces;

import com.unistart.dto.Authentication;
import com.unistart.entities.Users;

public interface UserServiceInterface {

    boolean register(String username, String password, String email);

    Authentication checkLogin(String username, String password);

    boolean changeProfile(String name, String email, String image, String password, int userId);

    Authentication checkLoginByGoogleToken(Authentication authentication);

    Authentication get3rdPartyInfo(String email);

    Users getUserById(int id);
}
