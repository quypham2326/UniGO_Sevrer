/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.services.interfaces;

import com.unistart.entities.Block;
import com.unistart.entities.Major;

/**
 *
 * @author Le Nguyen
 */
public interface BlockOfMajorServiceInterface {
    boolean createBlockOfMajor(Block block, Major major);
}
