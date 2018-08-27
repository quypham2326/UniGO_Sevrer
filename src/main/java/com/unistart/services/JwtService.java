/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.nimbusds.jose.JWSAlgorithm;
import com.nimbusds.jose.JWSHeader;
import com.nimbusds.jose.JWSSigner;
import com.nimbusds.jose.JWSVerifier;
import com.nimbusds.jose.crypto.MACSigner;
import com.nimbusds.jose.crypto.MACVerifier;
import com.nimbusds.jwt.JWTClaimsSet;
import com.nimbusds.jwt.SignedJWT;
import com.unistart.config.auth.JwtManager;
import com.unistart.dto.Authentication;
import com.unistart.entities.Users;
import com.unistart.repositories.UserRepository;
import java.util.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class JwtService {

    public static final String USERNAME = "username";
    public static final String ROLES = "roles";
    public static final String STATUS = "status";
    public static final String SECRET_KEY = "1jnd.8jm8.fnw9.ls0s.mc9s.2.f9s.20ds.d2r4.2sfy.bhg.7jgtf.vde";
    public static final int EXPIRE_TIME = 86400000;//1 days
    private final ObjectMapper om = new ObjectMapper();
    private static final JwtManager manager = new JwtManager();
    @Autowired
    private UserRepository userRepository;

    public String generateTokenLogin(Authentication auth) {
        String token = null;
        try {
            // Create HMAC signer
            JWSSigner signer = new MACSigner(generateShareSecret());

            JWTClaimsSet.Builder builder = new JWTClaimsSet.Builder();
            builder.claim(USERNAME, auth.getUsername());
            builder.expirationTime(generateExpirationDate());

            JWTClaimsSet claimsSet = builder.build();
            SignedJWT signedJWT = new SignedJWT(new JWSHeader(JWSAlgorithm.HS256), claimsSet);

            // Apply the HMAC protection
            signedJWT.sign(signer);

            // Serialize to compact form, produces something like
            // eyJhbGciOiJIUzI1NiJ9.SGVsbG8sIHdvcmxkIQ.onO9Ihudz3WkiauDO2Uhyuz0Y18UASXlSc1eS0NkWyA
            token = signedJWT.serialize();
            manager.addToken(token);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return token;
    }

    private JWTClaimsSet getClaimsFromToken(String token) {
        JWTClaimsSet claims = null;
        try {
            SignedJWT signedJWT = SignedJWT.parse(token);
            JWSVerifier verifier = new MACVerifier(generateShareSecret());
            if (signedJWT.verify(verifier)) {
                claims = signedJWT.getJWTClaimsSet();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return claims;
    }

    private <T> T getObjectFromClaims(Class<T> className, String name, String token) {
        JWTClaimsSet claimsSet = getClaimsFromToken(token);
        return (T) claimsSet.getClaim(name);
    }

    private Date generateExpirationDate() {
        return new Date(System.currentTimeMillis() + EXPIRE_TIME);
    }

    private Date getExpirationDateFromToken(String token) {
        Date expiration = null;
        JWTClaimsSet claims = getClaimsFromToken(token);
        expiration = claims.getExpirationTime();
        return expiration;
    }

    public String getUsernameFromToken(String token) {
        String username = null;
        try {
            JWTClaimsSet claims = getClaimsFromToken(token);
            username = claims.getStringClaim(USERNAME);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return username;
    }

    public Users getUserFromToken(String token) {
        String username = getUsernameFromToken(token);
        Users user = userRepository.findByUsername(username);
        return user;
    }

    public Authentication getAuthentication(String token) {
        Users users = getUserFromToken(token);
        if (users != null) {
            Authentication rs = new Authentication(users);
            rs.setToken(token);
            return rs;
        }
        return null;
    }

    private byte[] generateShareSecret() {
        // Generate 256-bit (32-byte) shared secret
        byte[] sharedSecret = new byte[32];
        sharedSecret = SECRET_KEY.getBytes();
        return sharedSecret;
    }

    private Boolean isTokenExpired(String token) {
        Date expiration = getExpirationDateFromToken(token);
        return expiration.before(new Date());
    }

    public Boolean validateTokenLogin(String token) {
        if (token == null || token.trim().length() == 0) {
            return false;
        }
        if (!manager.isTokenExisted(token)) {
            return false;
        }
        String username = getUsernameFromToken(token);

        if (username == null || username.isEmpty()) {
            return false;
        }
        if (isTokenExpired(token)) {
            return false;
        }
        return true;
    }

    public void invalidateToken(String token) {
        manager.invalidateToken(token);
    }

}
