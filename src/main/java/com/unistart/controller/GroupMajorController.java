/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.controller;

import com.unistart.constant.ErrorConstant;
import com.unistart.constant.UrlConstant;
import com.unistart.entities.GroupMajor;
import com.unistart.entities.Major;
import com.unistart.error.ErrorNotification;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import com.unistart.services.interfaces.GroupMajorServiceInterface;
import com.unistart.services.interfaces.MajorServiceInterface;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author Le Nguyen
 */
@RestController
@RequestMapping(UrlConstant.GROUP_MAJOR)
public class GroupMajorController {
    @Autowired
    private GroupMajorServiceInterface groupMajorService;
    @Autowired
    private MajorServiceInterface majorService;
    private List<GroupMajor> listGroupMajor;
    private List<Major> listMajor;
    private ErrorNotification error;
    @RequestMapping(value = UrlConstant.CREATE,method = RequestMethod.POST)
    public ResponseEntity<?> saveGroupMajor(@RequestBody GroupMajor groupMajor)
    {
        String code=groupMajor.getCode();
        String name=groupMajor.getName();
        boolean isCreated=groupMajorService.saveGroupMajor(code, name);
        if(isCreated)
        return new ResponseEntity<Boolean>(isCreated, HttpStatus.OK);      
        error= new ErrorNotification(ErrorConstant.MES016);
        return new ResponseEntity<ErrorNotification>(error, HttpStatus.CONFLICT);
    }
    @RequestMapping(value = UrlConstant.DELETE,method = RequestMethod.POST)
    public ResponseEntity<?> deleteGroupMajor(@RequestBody GroupMajor groupMajor)
    {
        int id=groupMajor.getId();
        boolean isDeleted=groupMajorService.deleteGroupMajor(id);
        return new ResponseEntity<Boolean>(isDeleted, HttpStatus.OK);
    }
    
    @RequestMapping(value = UrlConstant.UPDATE,method = RequestMethod.POST)
    public ResponseEntity<?> updateGroupMajor(@RequestBody GroupMajor groupMajor)
    {
        int id=groupMajor.getId();
        String code=groupMajor.getCode();
        String name=groupMajor.getName();
        boolean isUpdate=groupMajorService.updateGroupMajor(code, name, id);
        return new ResponseEntity<Boolean>(isUpdate, HttpStatus.OK);
    }
    @RequestMapping(value = UrlConstant.SHOW_GROUP_MAJOR,method = RequestMethod.GET)
    public ResponseEntity<?> getAllGroupMajor()
    {
        listGroupMajor=groupMajorService.getAllGroupMajor();
        return new ResponseEntity<List<GroupMajor>>(listGroupMajor, HttpStatus.OK);
    }
    @RequestMapping(value = UrlConstant.SHOW_MAJOR_IN_GROUP,method = RequestMethod.GET)
    public ResponseEntity<?> getMajorInGroup(@RequestParam(value = "groupMajorId") int groupMajorId)
    {
        listMajor=majorService.findByGroupMajorId(groupMajorId);
        return new ResponseEntity<List<Major>>(listMajor,HttpStatus.OK);
    }
}
