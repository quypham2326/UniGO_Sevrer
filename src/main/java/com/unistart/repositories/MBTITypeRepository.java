package com.unistart.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.unistart.entities.Mbtitype;

public interface MBTITypeRepository extends JpaRepository<Mbtitype, Integer> {

	Mbtitype findByMbtitypeName(String name);	
	Mbtitype findById(int id);
	@Query("select new com.unistart.entities.Mbtitype(m.id , m.contentType) from Mbtitype m where m.isActive = 1")
	List<Mbtitype> getContentType();
        @Query("update Mbtitype set contentType=?2,description=?3,MBTITypeName=?4 where id=?1")
        void updateMbtiType(int id,String contentType,String description,String mbtitypeName);
        @Query("update Mbtitype set isActive=0 where id=?1")
        void deleteMbtiType(int id);
}
