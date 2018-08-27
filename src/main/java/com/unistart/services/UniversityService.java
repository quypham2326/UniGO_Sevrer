package com.unistart.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unistart.entities.Location;
import com.unistart.entities.TrainSystem;
import com.unistart.entities.University;
import com.unistart.entities.customentities.UniversitySearchEntity;
import com.unistart.repositories.LocationRepository;
import com.unistart.repositories.TrainRepository;
import com.unistart.repositories.UniversityRepository;
import com.unistart.services.interfaces.UniversityServiceInterface;
import javax.persistence.EntityManager;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;

@Service
@Transactional
public class UniversityService implements UniversityServiceInterface {

    @Autowired
    private UniversityRepository universityRepo;

    @Autowired
    private LocationRepository locationRepo;

    @Autowired
    private TrainRepository trainRepo;
    private University university;

    public List<University> listAllUniversity() {
        List<University> listUniversity = universityRepo.findAll();
        return listUniversity;
    }

    @Override
    public boolean addUniversity(String code, String name, String email, String phone, String logo,
            String image, int priority, String description, int trainSystem) {
        // TODO Auto-generated method stub
        University university = universityRepo.findByCode(code);
        TrainSystem train = trainRepo.findById(trainSystem);
        if (university == null) {
            boolean isActive = true;
            university = new University(code, name, email, phone, logo, image, priority, description, isActive);
            university.setTrainSystem(train);
            universityRepo.save(university);
            return true;
        }
        return false;
    }

    @Override
    public void setLocation(Location location) {
        // TODO Auto-generated method stub
        universityRepo.setLocation(location);
    }

    @Override
    public University getUniversityById(int id) {
        // TODO Auto-generated method stub
        return universityRepo.findById(id);
    }

    @Override
    public University getUniversityShort(int id) {
        // TODO Auto-generated method stub
        return universityRepo.findWithShortData(id);
    }

    @Override
    public List<University> listAllUniversityName() {
        List<University> listUniversity = universityRepo.showByUniversityName();
        return listUniversity;
    }

    @Override
    public List<University> findUniversity(UniversitySearchEntity search) {
        Pageable pageable = new PageRequest(search.getPage(), search.getLimit(), Sort.Direction.ASC, "priority");
        List<University> listUniversity;
        String name = "%" + search.getName() + "%";
        boolean searchMajor = !search.getMajorIds().isEmpty();
        boolean searchLocation = !search.getLocationIds().isEmpty();
        if (!searchMajor && !searchLocation) {
            //find by name only
            listUniversity = universityRepo.findActiveUniByName(name, pageable);
        } else if (searchMajor && !searchLocation) {
            //find by major and name
            listUniversity = universityRepo.findByMajorAndName(search.getMajorIds(), name, pageable);
        } else if (!searchMajor && searchLocation) {
            //find by location and name
            listUniversity = universityRepo.findByLocationAndName(search.getLocationIds(), name, pageable);
        } else {
            // find by name, location, major
            listUniversity = universityRepo.findByCriterias(search.getMajorIds(), name, search.getLocationIds(), pageable);
        }
        return listUniversity;
    }

    @Override
    public List<University> findUniversityByMajorId(int majorId) {
        List<University> listUniversity;
        listUniversity = universityRepo.findByMajor(majorId, null);
        return listUniversity;
    }

    @Override
    public List<University> getListId() {
        // TODO Auto-generated method stub
        List<University> listUniversity = universityRepo.getListId();
        return listUniversity;
    }

    public University getUniversityByCode(String code) {
        return universityRepo.findByCode(code);
    }

    @Override
    public boolean addLocation(int locationID, int uniId) {
        universityRepo.addLocation(locationRepo.findById(locationID), uniId);
        return true;
    }

    @Override
    public boolean updateUniversity(int id, String code, String name, String email, String phone, String logo, String image, int priority,
            String description, int trainSystem) {
        University university = universityRepo.findById(id);
        if (university != null) {
            universityRepo.updateUniversity(code, name, email, phone, logo, image, priority, description, trainSystem, id);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteUniversity(int id) {
        universityRepo.changeIsActive(id);
        return true;
    }

    @Override
    public List<University> getUniByLocationMajor(int locationId, int majorId) {
        List<University> listUniversity;
        listUniversity = universityRepo.getByLocationMajor(locationId, majorId);
        return listUniversity;
    }

    @Override
    public List<University> getUniByMajorId(int majorId) {
        List<University> listUniversity;
        listUniversity = universityRepo.findByMajorId(majorId);
        return listUniversity;
    }

    @Override
    public List<University> getUniByLocationId(int locationId) {
        List<University> listUniversity;
        listUniversity = universityRepo.getUniByLocationId(locationId);
        return listUniversity;
    }

    @Autowired
    EntityManager entityManager;

    @Override
    public List<University> getTop10University() {
        return universityRepo.findTop10University(entityManager);
    }

}
