/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.repositories;

import com.unistart.entities.GroupMajor;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface GroupMajorRepository extends JpaRepository<GroupMajor, Integer> {

    GroupMajor findByCode(String code);

    @Modifying
    @Query("update GroupMajor set isActive = 0 where id = ?1")
    void changeIsActive(int id);

    @Modifying
    @Query("update GroupMajor set name=?3 where id = ?1 and code=?2")
    void updateGroupMajor(int id, String code, String name);

    @Query("select new com.unistart.entities.GroupMajor( id,code,name) from GroupMajor where isActive = 1")
    List<GroupMajor> getAllGroupMajor();
}
