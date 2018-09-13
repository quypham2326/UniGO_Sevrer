/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.unistart.repositories;

import java.io.Serializable;
import org.springframework.data.jpa.repository.JpaRepository;
import com.unistart.entities.BlockOfMajor;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Le Nguyen
 */
@Repository
public interface BlockOfMajorRepository extends JpaRepository<BlockOfMajor, Integer>{
    BlockOfMajor findById(int id);
}
