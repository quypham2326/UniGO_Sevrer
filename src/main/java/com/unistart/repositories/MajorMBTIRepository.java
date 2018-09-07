package com.unistart.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.unistart.entities.MajorMbti;


public interface MajorMBTIRepository extends JpaRepository<MajorMbti, Integer>{
    @Query("update MajorMbti set isActive=0 where id=?1")
    void updateMajorMbti(int id);
}
