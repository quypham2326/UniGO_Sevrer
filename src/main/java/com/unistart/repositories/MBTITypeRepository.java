package com.unistart.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.unistart.entities.Mbtitype;

public interface MBTITypeRepository extends JpaRepository<Mbtitype, Integer> {

	Mbtitype findByMbtitypeName(String name);
	
	Mbtitype findById(int id);

	@Query("select m.id , m.contentType from Mbtitype m where m.isActive = 1")
	List<Mbtitype> getContentType();
}
