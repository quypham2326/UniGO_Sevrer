/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services;

import com.unistart.entities.TrainSystem;
import com.unistart.repositories.TrainRepository;
import com.unistart.services.interfaces.TrainSystemServiceInterface;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Le Nguyen
 */
@Service
public class TrainSystemService implements TrainSystemServiceInterface{
    
@Autowired
private TrainRepository trainRepo;
    @Override
    public List<TrainSystem> getAllTrainSystem() {
        return trainRepo.getAllTrainSystem();
    }

    @Override
    public boolean deleteTrainSystem(int id) {
        return false;
    }

    @Override
    public boolean saveTrainSystem(String name) {
        return false;
    }

    @Override
    public boolean updateTrainSystem(String name, int id) {
        return false;
    }
    
}
