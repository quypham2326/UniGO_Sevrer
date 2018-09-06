/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.entities.Mbtitype;
import com.unistart.repositories.MBTITypeRepository;
import com.unistart.services.interfaces.MBTITypeServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Le Nguyen
 */
@Service
public class MBTITypeService implements MBTITypeServiceInterface{
    @Autowired
    private MBTITypeRepository mbtiTypeRepo;
    
    @Override
    public boolean deleteMbtiType(int id) {
        return true;
    }

    @Override
    public boolean updateMbtiType(int id, String mbtiTypeName, String description, String contentType) {
        return true;
    }

    @Override
    public boolean createMbtiType(String mbtiTypeName, String description, String contentType) {
        return true;
    }

    @Override
    public List<Mbtitype> getListMbtiType() {
        return mbtiTypeRepo.getMBTIType();
    }
    
}
