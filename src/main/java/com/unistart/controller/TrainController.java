/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.TrainSystem;
import com.unistart.services.TrainSystemService;
import java.util.List;
import javax.ws.rs.GET;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.Repository;
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
@RequestMapping(UrlConstant.TRAIN_SYSTEM)
public class TrainController {
    
    @Autowired
    private TrainSystemService trainService;
    List<TrainSystem> listTrain;
    @RequestMapping(value = UrlConstant.VIEW,method = RequestMethod.GET)
    public ResponseEntity<?> getAllTrainSystem()
    {
        listTrain=trainService.getAllTrainSystem();
        return new ResponseEntity<List<TrainSystem>>(listTrain,HttpStatus.OK);
    }
}
