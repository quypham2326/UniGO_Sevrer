package com.unistart.services;

import com.unistart.dto.Authentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unistart.entities.Role;
import com.unistart.entities.Users;
import com.unistart.repositories.RoleRepository;
import com.unistart.repositories.UserRepository;
import com.unistart.services.interfaces.ProviderServiceInterface;
import com.unistart.services.interfaces.UserServiceInterface;

@Service
@Transactional
public class UserService implements UserServiceInterface {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bcrypt;
    @Autowired
    private ProviderServiceInterface providerService;
    @Autowired
    private JwtService jwtService;
    @Autowired
    private GoogleVerifierService googleVerifierService;
    private Users user;

    @Override
    public boolean register(String username, String password, String email) {
        // TODO Auto-generated method stub
        user = userRepository.findByUsername(username);
        if (user == null) {
            user = new Users();
            user.setUsername(username);
            String encodedPassword = bcrypt.encode(password);
            Role role = roleRepository.findById(1);
            user.setPassword(encodedPassword);
            user.setEmail(email);
            user.setIsActive(true);
            user.setRole(role);
            userRepository.save(user);
            return true;
        }
        return false;
    }

    @Override
    public Authentication checkLogin(String username, String password) {
        // TODO Auto-generated method stub
        user = userRepository.checkLogin(username);
        if (user != null && bcrypt.matches(password, user.getPassword())) {
            Authentication authentication = new Authentication();
            authentication.setUsername(user.getUsername());
            authentication.setName(user.getName());
            authentication.setRole(user.getRole().getName());
            authentication.setImage(user.getImage());
            String jwt = jwtService.generateTokenLogin(authentication);
            authentication.setToken(jwt);
            return authentication;
        }
        return null;
    }

    @Override
    public Authentication checkLoginByGoogleToken(Authentication authentication) {
        String email = null;
        try {
            //verify google token
            email = googleVerifierService.getEmailFromToken(authentication.getToken());
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        if (email != null) {
            user = userRepository.findByEmail(email);
            if (user == null) {
                user = new Users();
                user.setUsername(email);
                user.setEmail(email);
                user.setImage(authentication.getImage());
                user.setName(authentication.getName());
                user.setPassword("12345678");
                user.setIsActive(true);
                Role role = roleRepository.findById(1);
                user.setRole(role);
                providerService.addProvider(authentication.getProviderId(), authentication.getProviderName(), user);
                authentication.setRole(role.getName());
            }
        } else {
            return null;
        }
        return authentication;
    }

    @Override
    public Authentication get3rdPartyInfo(String email) {
        // TODO Auto-generated method stub
        Users user = userRepository.findByUsername(email);
        Authentication userInfo = new Authentication();
        userInfo.setUsername(user.getUsername());
        userInfo.setName(user.getName());
        userInfo.setRole(user.getRole().getName());
        userInfo.setImage(user.getImage());
        return userInfo;
    }

    @Override
    public boolean changeProfile(String name, String email, String image, String password, int userId) {
        user = userRepository.findById(userId);
        if (user != null) {
            String encodedPassword = bcrypt.encode(password);
            userRepository.updateProfile(name, email, encodedPassword, image, userId);
            return true;
        }
        return false;
    }

    @Override
    public Users getUserById(int id) {
        // TODO Auto-generated method stub
        return userRepository.findById(id);
    }

}
