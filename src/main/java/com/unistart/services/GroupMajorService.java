/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.entities.GroupMajor;
import com.unistart.repositories.GroupMajorRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.unistart.services.interfaces.GroupMajorServiceInterface;

/**
 *
 * @author Le Nguyen
 */
@Service
@Transactional
public class GroupMajorService implements GroupMajorServiceInterface{
    @Autowired
    GroupMajorRepository groupMajorRepo;
    
    @Override
    public boolean deleteGroupMajor(int id) {
        groupMajorRepo.changeIsActive(id);
       return true;
    }

    @Override
    public boolean saveGroupMajor(String code, String name) {
        GroupMajor groupMajor=groupMajorRepo.findByCode(code);
        if(groupMajor == null)
        {
            boolean isActive=true;
            groupMajor=new GroupMajor(code, name, isActive);
            groupMajorRepo.save(groupMajor);
            return true;
        }
        return false;
       }

    @Override
    public boolean updateGroupMajor(String code, String name, int id) {
        groupMajorRepo.updateGroupMajor(id, code, name);
       return true;
    }

    @Override
    public List<GroupMajor> getAllGroupMajor() {
        return groupMajorRepo.getAllGroupMajor();
    }
}
