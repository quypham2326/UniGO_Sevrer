/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.entities.Major;
import com.unistart.entities.MajorMbti;
import com.unistart.entities.Mbtitype;
import com.unistart.repositories.MajorMBTIRepository;
import com.unistart.services.interfaces.MajorMbtiServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Le Nguyen
 */
@Service
public class MajorMbtiService implements MajorMbtiServiceInterface{
    
@Autowired
private MajorMBTIRepository majorMbtiRepo;
    @Override
    public boolean createMajorMbti(MajorMbti majorMbti) {
        majorMbti.setIsActive(true);
        majorMbtiRepo.save(majorMbti);
        return true;
    }
    
}
