/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services.interfaces;

import com.unistart.entities.TrainSystem;
import java.util.List;

/**
 *
 * @author Le Nguyen
 */
public interface TrainSystemServiceInterface {
    List<TrainSystem> getAllTrainSystem();
    boolean deleteTrainSystem(int id);
    boolean saveTrainSystem(String name);
    boolean updateTrainSystem(String name,int id);
}
