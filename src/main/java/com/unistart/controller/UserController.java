package com.unistart.controller;

import com.fasterxml.jackson.annotation.JsonView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.unistart.constant.ErrorConstant;
import com.unistart.constant.UrlConstant;
import com.unistart.dto.Authentication;
import com.unistart.entities.Users;
import com.unistart.error.ErrorNotification;
import com.unistart.services.GoogleVerifierService;
import com.unistart.services.JwtService;
import com.unistart.services.interfaces.UserServiceInterface;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_FACEBOOK;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_GOOGLE;
import com.unistart.view.AuthenticationView;

@RestController
@RequestMapping(value = UrlConstant.USER)
public class UserController {

    @Autowired
    private UserServiceInterface userService;

    private ErrorNotification error;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private GoogleVerifierService googleVerifierService;

    @JsonView(AuthenticationView.Info.class)
    @GetMapping
    public ResponseEntity<?> getAuthentication(@RequestHeader(value = "Authorization") String token,
            @RequestHeader(value = "Provider", required = false) String provider) {
        Authentication authentication = null;
        if (provider == null) {
            authentication = jwtService.getAuthentication(token);
        } else if (provider.equalsIgnoreCase(PROVIDER_GOOGLE)) {
            authentication = googleVerifierService.getAuthentication(token);
        } else if (provider.equalsIgnoreCase(PROVIDER_FACEBOOK)) {

        }
        if (authentication == null) {
            return new ResponseEntity(HttpStatus.UNAUTHORIZED);
        }
        authentication.setToken(token);
        return new ResponseEntity<Authentication>(authentication, HttpStatus.OK);
    }

    @RequestMapping(value = UrlConstant.REGISTER, method = RequestMethod.POST)
    public ResponseEntity<?> register(@RequestBody Users user) {
        String username = user.getUsername();
        String password = user.getPassword();
        String email = user.getEmail();
        boolean isSuccess = userService.register(username, password, email);
        if (isSuccess) {
            return new ResponseEntity<Boolean>(isSuccess, HttpStatus.OK);
        } else {
            error = new ErrorNotification(ErrorConstant.MES001);
            return new ResponseEntity<ErrorNotification>(error, HttpStatus.CONFLICT);

        }
    }

    @RequestMapping(value = UrlConstant.CHANGE_PROFILE, method = RequestMethod.POST)
    public ResponseEntity<?> changeProfile(@RequestBody Users u) {
        String name = u.getName();
        String email = u.getEmail();
        String password = u.getPassword();
        String image = u.getImage();
        int userId = u.getId();
        boolean isUpdate = userService.changeProfile(name, email, image, password, userId);
        if (isUpdate) {
            return new ResponseEntity<Boolean>(isUpdate, HttpStatus.OK);
        } else {
            error = new ErrorNotification(ErrorConstant.MES013);
            return new ResponseEntity<ErrorNotification>(error, HttpStatus.UNAUTHORIZED);
        }
    }

}
