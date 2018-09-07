package com.unistart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.unistart.entities.Tag;
import org.springframework.data.jpa.repository.Query;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer>{
   Tag findById(int id);
   Tag findByTagName(String tagName);
   @Query("update Tag set isActive=0 where id=?1")
   void deleteTag(int id);
}
