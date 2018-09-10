package com.unistart.services.interfaces;

import com.unistart.entities.Mbtitype;

import java.util.List;

public interface MBTITypeServiceInterface  {
    List<Mbtitype> getAllType();
    boolean createMbtiType(String contentType,String description,String mbtitypeName);
    boolean deleteMbtiType(int id);
    boolean updateMbtiType(int id,String contentType,String description,String mbtitypeName);
}
