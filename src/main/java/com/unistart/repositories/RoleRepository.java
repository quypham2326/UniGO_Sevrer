package com.unistart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unistart.entities.Role;
import org.springframework.data.jpa.repository.Query;

public interface RoleRepository extends JpaRepository <Role, Integer>{
	
	Role findById(int roleId);
        @Query("update Role set isActive=0 where id=?1")
        void deleleRole(int id);
}
