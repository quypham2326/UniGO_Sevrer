package com.unistart.config.auth;

import com.unistart.entities.Users;
import com.unistart.services.GoogleVerifierService;
import com.unistart.services.JwtService;
import com.unistart.services.SecurityUserDetailsService;
import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_GOOGLE;
import static com.unistart.constant.AuthenticationConstants.PROVIDER_FACEBOOK;
import java.nio.file.AccessDeniedException;
import java.security.GeneralSecurityException;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;

public class AuthenticationTokenFilter extends UsernamePasswordAuthenticationFilter {

    private final static String TOKEN_HEADER = "Authorization";
    private final static String PROVIDER_HEADER = "Provider";
    @Autowired
    private JwtService jwtService;
    @Autowired
    private GoogleVerifierService googleVerifierService;

    @Autowired
    private SecurityUserDetailsService securityUserDetailsService;

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        String authToken = httpRequest.getHeader(TOKEN_HEADER);
        String provider = httpRequest.getHeader(PROVIDER_HEADER);
        Users user = null;
        if (provider != null) {
            if (provider.equalsIgnoreCase(PROVIDER_GOOGLE)) {
                try {
                    user = googleVerifierService.findUserByGoogleToken(authToken);
                } catch (GeneralSecurityException ex) {
                    ex.printStackTrace();
                }
            }
            if (provider.equalsIgnoreCase(PROVIDER_FACEBOOK)) {

            }
        } else if (jwtService.validateTokenLogin(authToken)) {
            user = jwtService.getUserFromToken(authToken);
        }
        //build user detail
        if (user != null) {
            UserDetails userDetail = securityUserDetailsService.buildUserDetail(user);
            if (userDetail != null) {
                UsernamePasswordAuthenticationToken authentication = new UsernamePasswordAuthenticationToken(userDetail,
                        null, userDetail.getAuthorities());
                authentication.setDetails(new WebAuthenticationDetailsSource().buildDetails(httpRequest));
                SecurityContextHolder.getContext().setAuthentication(authentication);
            }
        }
        chain.doFilter(request, response);
    }

}
