package com.unistart.repositories;


import org.springframework.data.jpa.repository.JpaRepository;

import com.unistart.entities.Mbtitype;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface MBTITypeRepository extends JpaRepository<Mbtitype, Integer> {

    Mbtitype findByMbtitypeName(String name);
    Mbtitype findById(int id);

    @Query(value = "SELECT Id,MBTITypeName,Description,contentType,isActive FROM MBTIType",nativeQuery = true)
    public List<Mbtitype> getMBTIType();

}
