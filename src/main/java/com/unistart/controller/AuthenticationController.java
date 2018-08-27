package com.unistart.controller;

import com.fasterxml.jackson.annotation.JsonView;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_FACEBOOK;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_GOOGLE;
import com.unistart.constant.ErrorConstant;
import com.unistart.dto.Authentication;
import com.unistart.error.ErrorNotification;
import com.unistart.services.interfaces.UserServiceInterface;
import com.unistart.view.AuthenticationView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class AuthenticationController {

    @Autowired
    private UserServiceInterface userService;

    @JsonView(AuthenticationView.Info.class)
    @PostMapping(value = "login")
    public ResponseEntity<?> login(@RequestHeader(value = "Provider", required = false) String provider,
            @RequestBody Authentication authentication) {
        if (provider == null) {
            //normal login
            String username = authentication.getUsername();
            String password = authentication.getPassword();
            Authentication auth = userService.checkLogin(username, password);
            if (auth != null) {
                return new ResponseEntity<Authentication>(auth, HttpStatus.OK);
            } else {
                ErrorNotification error = new ErrorNotification(ErrorConstant.MES002);
                return new ResponseEntity<ErrorNotification>(error, HttpStatus.UNAUTHORIZED);
            }
        } else {
            //google login
            if (provider.equalsIgnoreCase(PROVIDER_GOOGLE)) {
                Authentication auth = userService.checkLoginByGoogleToken(authentication);
                if (auth != null) {
                    auth.setToken(authentication.getToken());
                    return new ResponseEntity<Authentication>(auth, HttpStatus.OK);
                }
            }
            //facebook login
            if (provider.equalsIgnoreCase(PROVIDER_FACEBOOK)) {

            }
        }
        return new ResponseEntity(HttpStatus.UNAUTHORIZED);
    }

    @PostMapping(value = "logout")
    public void logout() {

    }
}
