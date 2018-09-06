package com.unistart.services;

import com.unistart.entities.Mbtitype;
import com.unistart.repositories.MBTITypeRepository;
import com.unistart.services.interfaces.MBTITypeServiceInterface;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class MBTITypeService implements MBTITypeServiceInterface {

//    private final MBTITypeRepository mbtiTypeRepository;
//    @Autowired
//    public MBTITypeService(MBTITypeRepository mbtiTypeRepository) {
//        this.mbtiTypeRepository = mbtiTypeRepository;
//    }
//
//
//    @Override
//    public List<Mbtitype> getAllType() {
//        return mbtiTypeRepository.getContentType();
//    }
}
