/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.controller;

import com.unistart.constant.UrlConstant;
import com.unistart.entities.BlockOfMajor;
import com.unistart.services.interfaces.BlockOfMajorServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Le Nguyen
 */
@RestController
@RequestMapping(value = UrlConstant.BLOCK_OF_MAJOR)
public class BlockOfMajorController {
    @Autowired
    BlockOfMajorServiceInterface blockOfMajorService;
    @PostMapping(value = UrlConstant.CREATE)
    public ResponseEntity<?> createBlockOfMajor(@RequestBody List<BlockOfMajor> blockOfMajors)
    {
        blockOfMajors.forEach((blockOfMajor) -> {
            blockOfMajorService.createBlockOfMajor(blockOfMajor.getBlock(), blockOfMajor.getMajor());
        });
        return new ResponseEntity<Boolean>(true,HttpStatus.OK);
    }
}
