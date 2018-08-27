package com.unistart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.unistart.entities.Tag;

@Repository
public interface TagRepository extends JpaRepository<Tag, Integer>{
   Tag findById(int id);
   Tag findByTagName(String tagName);
}
