package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.Mbtitype;
import com.unistart.services.MBTITypeService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(UrlConstant.MBTI_TYPE)
public class MBTITypeController {

    @Autowired
    private MBTITypeService mbtiTypeService;
    
    List<Mbtitype> mbtiTypes;
    @RequestMapping(value = UrlConstant.GET_ALL_MBTI_TYPE, method = RequestMethod.GET)
    public ResponseEntity<?> getMbtiType() {
        mbtiTypes=mbtiTypeService.getAllType();
        return new ResponseEntity<List<Mbtitype>>(mbtiTypes,HttpStatus.OK);
    }
}
