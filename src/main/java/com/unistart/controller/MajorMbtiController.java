/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.MajorMbti;
import com.unistart.services.MajorMbtiService;
import com.unistart.services.interfaces.MajorMbtiServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = UrlConstant.MAJOR_MBTI)
public class MajorMbtiController{    
    @Autowired
    private MajorMbtiService majorMbtiServiceInterface;
    
    @PostMapping(value =  UrlConstant.CREATE)
    public ResponseEntity<?> createMajorMbti(@RequestBody List<MajorMbti> listMajorMbti)
    {
        System.out.println("ahihi");
        listMajorMbti.forEach((majorMbti) -> {
            majorMbtiServiceInterface.createMajorMbti(majorMbti);
        });
        return new ResponseEntity<Boolean>(true,HttpStatus.OK);
    }
}
