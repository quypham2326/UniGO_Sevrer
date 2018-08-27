/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.dto.SecurityUser;
import com.unistart.entities.Users;
import com.unistart.repositories.UserRepository;
import java.util.HashSet;
import java.util.Set;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

/**
 *
 * @author ADMIN
 */
@Service
public class SecurityUserDetailsService implements UserDetailsService {

    @Autowired
    UserRepository userRepository;

    @Override
    public UserDetails loadUserByUsername(String string) throws UsernameNotFoundException {
        Users user = userRepository.findByUsername(string);
        if (user != null) {
            return buildUserDetail(user);
        }
        throw new UsernameNotFoundException("Not found any username: " + string);
    }

    public UserDetails buildUserDetail(Users user) {
        return new SecurityUser(user.getUsername(), getAuthorities(user), user.isIsActive(), user);
    }

    private Set<GrantedAuthority> getAuthorities(Users user) {
        Set<GrantedAuthority> authorities = new HashSet<GrantedAuthority>();
        GrantedAuthority grantedAuthority = new SimpleGrantedAuthority("ROLE_" + user.getRole().getName());
        authorities.add(grantedAuthority);
        return authorities;
    }
}
