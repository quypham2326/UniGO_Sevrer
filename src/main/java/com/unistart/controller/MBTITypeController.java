package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.Mbtitype;
import com.unistart.services.interfaces.MBTITypeServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequestMapping(UrlConstant.GET_MBTI_TYPE)
public class MBTITypeController {

//    private final MBTITypeServiceInterface mbtiTypeServiceInterface;
//    @Autowired
//    public MBTITypeController(MBTITypeServiceInterface mbtiTypeServiceInterface) {
//        this.mbtiTypeServiceInterface = mbtiTypeServiceInterface;
//    }
//
//
//    @GetMapping(value = "")
//    public List<Mbtitype> getContent(){
//        return  mbtiTypeServiceInterface.getAllType();
//
//    }
}
