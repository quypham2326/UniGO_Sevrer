package com.unistart.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.unistart.entities.TrainSystem;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

public interface TrainRepository extends JpaRepository<TrainSystem, Integer>{
     TrainSystem findById(int id);
     @Modifying
    @Query("select new com.unistart.entities.TrainSystem(id,name) from TrainSystem where isActive=1")
    List<TrainSystem> getAllTrainSystem();
}
