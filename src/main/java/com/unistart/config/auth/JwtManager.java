package com.unistart.config.auth;

import com.google.common.cache.CacheBuilder;
import com.google.common.cache.CacheLoader;
import com.google.common.cache.LoadingCache;
import com.unistart.services.JwtService;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.TimeUnit;
import org.springframework.context.annotation.Bean;

/**
 *
 * @author ADMIN
 */
public class JwtManager {

    private LoadingCache<String, String> blackList = null;

    public JwtManager() {
        blackList = CacheBuilder.newBuilder()
                .expireAfterWrite(JwtService.EXPIRE_TIME, TimeUnit.MILLISECONDS)
                .build(new CacheLoader<String, String>() {
                    @Override
                    public String load(String k) throws Exception {
                        System.out.println("ADD JWT TO SESSION: " + k);
                        return k;
                    }
                });
    }

    public void addToken(String token) throws ExecutionException {
        blackList.get(token);
    }

    public boolean isTokenExisted(String token) {
        return blackList.asMap().get(token) != null;
    }

    public void invalidateToken(String token) {
        blackList.asMap().remove(token);
    }

}
