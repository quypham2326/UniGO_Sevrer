/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services.interfaces;

import com.unistart.entities.Mbtitype;
import java.util.List;

public interface MBTITypeServiceInterface {
    boolean deleteMbtiType(int id);
    boolean updateMbtiType(int id,String mbtiTypeName,String description,String contentType);
    boolean createMbtiType(String mbtiTypeName,String description,String contentType);
    List<Mbtitype> getListMbtiType();
}
