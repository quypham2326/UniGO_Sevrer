/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.Mbtitype;
import com.unistart.services.MBTITypeService;
import java.util.List;
import org.apache.http.protocol.HTTP;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Le Nguyen
 */
@RestController
@RequestMapping(value = UrlConstant.MBTI_TYPE)
public class MBTITypeController {
    
    @Autowired
    private MBTITypeService mbtiTypeService;
    private List<Mbtitype> listMbtiType;
    @RequestMapping(value = UrlConstant.GET_ALL_MBTI_TYPE,method = RequestMethod.GET)
    public ResponseEntity<?> getListMbtiType(){
        listMbtiType=mbtiTypeService.getListMbtiType();
        System.out.println("aaa");
        return new ResponseEntity<List<Mbtitype>>(listMbtiType,HttpStatus.OK);
    }
}
