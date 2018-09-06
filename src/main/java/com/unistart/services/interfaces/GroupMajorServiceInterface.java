/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services.interfaces;

import com.unistart.entities.GroupMajor;
import java.util.List;

/**
 *
 * @author Le Nguyen
 */
public interface GroupMajorServiceInterface {
    
    boolean deleteGroupMajor(int id);
    boolean saveGroupMajor(String code,String name);
    boolean updateGroupMajor(String code,String name,int id);
    List<GroupMajor> getAllGroupMajor();
}
