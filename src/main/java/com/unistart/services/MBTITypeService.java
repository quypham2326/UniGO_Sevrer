package com.unistart.services;

import com.unistart.entities.Mbtitype;
import com.unistart.repositories.MBTITypeRepository;
import com.unistart.services.interfaces.MBTITypeServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class MBTITypeService implements MBTITypeServiceInterface {
    
    @Autowired
    MBTITypeRepository mbtiTypeRepo;
    
    @Override
    public List<Mbtitype> getAllType() {
        return mbtiTypeRepo.getContentType();
       }

    @Override
    public boolean createMbtiType(String contentType, String description, String mbtitypeName) {
        return true;
    }

    @Override
    public boolean deleteMbtiType(int id) {
        return true;
    }

    @Override
    public boolean updateMbtiType(int id, String contentType, String description, String mbtitypeName) {
        return true;
    }
}
