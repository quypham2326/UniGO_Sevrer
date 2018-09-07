package com.unistart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.unistart.entities.Provider;
import org.springframework.data.jpa.repository.Query;

@Repository
public interface ProviderRepository extends JpaRepository<Provider, Integer> {
	Provider findByProviderId(String providerId);
	
//	@Query("update Provider set isActive=0 where id=?1")
//        void deleteProvider(int id);
}
