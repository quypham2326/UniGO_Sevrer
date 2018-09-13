/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.entities.Block;
import com.unistart.entities.BlockOfMajor;
import com.unistart.entities.Major;
import com.unistart.repositories.BlockOfMajorRepository;
import com.unistart.services.interfaces.BlockOfMajorServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Le Nguyen
 */
@Service
public class BlockOfMajorService implements BlockOfMajorServiceInterface{

    @Autowired
    private BlockOfMajorRepository blockOfMajorRepo; 
    @Override
    public boolean createBlockOfMajor( Block block, Major major) {
        boolean isActive=true;
        BlockOfMajor blockOfMajor=new BlockOfMajor(block, major, isActive);
        blockOfMajorRepo.save(blockOfMajor);
        return true;
    }

   
   
    
}
