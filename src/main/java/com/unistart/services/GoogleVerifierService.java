/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.google.api.client.googleapis.auth.oauth2.GoogleIdToken;
import com.google.api.client.googleapis.auth.oauth2.GoogleIdTokenVerifier;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.unistart.constant.AuthenticationConstants;
import com.unistart.dto.Authentication;
import com.unistart.entities.Users;
import com.unistart.repositories.UserRepository;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Collections;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class GoogleVerifierService {

    @Autowired
    private UserRepository userRepository;

    public String getEmailFromToken(String token) throws GeneralSecurityException, IOException {
        GoogleIdToken.Payload payload = verify(token);
        if (payload != null) {
            return payload.getEmail();
        }
        return null;
    }

    public Users findUserByGoogleToken(String token) {
        GoogleIdToken.Payload payload = verify(token);
        if (payload != null) {
            String email = payload.getEmail();
            Users user = userRepository.findByUsername(email);
            return user;
        }
        return null;
    }

    public Authentication getAuthentication(String token) {
        try {
            Users users = findUserByGoogleToken(token);
            if (users != null) {
                Authentication rs = new Authentication(users);
                rs.setToken(token);
                return rs;
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        return null;
    }

    public GoogleIdToken.Payload verify(String idTokenString) {
        try {
            if (idTokenString != null) {
                HttpTransport transport = GoogleNetHttpTransport.newTrustedTransport();
                JsonFactory jsonFactory = JacksonFactory.getDefaultInstance();
                GoogleIdTokenVerifier verifier = new GoogleIdTokenVerifier.Builder(transport, jsonFactory)
                        // Specify the CLIENT_ID of the app that accesses the backend:
                        .setAudience(Collections.singletonList(AuthenticationConstants.G_CLIENT_ID))
                        // Or, if multiple clients access the backend:
                        //.setAudience(Arrays.asList(CLIENT_ID_1, CLIENT_ID_2, CLIENT_ID_3))
                        .build();
                // (Receive idTokenString by HTTPS POST)
                GoogleIdToken idToken = verifier.verify(idTokenString);
                if (idToken != null) {
                    return idToken.getPayload();
                }
            }
        } catch (Exception ex) {
            System.out.println("Invalid google token: " + idTokenString);
        }
        return null;
    }
}
