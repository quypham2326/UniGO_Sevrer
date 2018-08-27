package com.unistart.services;

import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.unistart.entities.Mbtiresult;
import com.unistart.entities.Mbtitype;
import com.unistart.entities.Users;
import com.unistart.repositories.MBTIResultRepository;
import com.unistart.repositories.MBTITypeRepository;
import com.unistart.repositories.UserRepository;
import com.unistart.services.interfaces.MBTIResultServiceInterface;

@Service
@Transactional
public class MBTIResultService implements MBTIResultServiceInterface {

    @Autowired
    private MBTITypeRepository mbtiTypeRepo;
    @Autowired
    private UserRepository userRepo;
    @Autowired
    private MBTIResultRepository mbtiResultRepo;

    private Mbtitype mbtiType;
    private Users user;
    private Mbtiresult mbtiResult = new Mbtiresult();

    @Override
    public Mbtiresult saveMbtiResult(String mbtiTypeName, String username) {
        mbtiType = mbtiTypeRepo.findByMbtitypeName(mbtiTypeName);
        user = userRepo.findByUsername(username);
        Calendar cal = Calendar.getInstance();
        if (mbtiType != null) {
            mbtiResult = new Mbtiresult();
            mbtiResult.setMbtitype(mbtiType);
            mbtiResult.setUsers(user);
            mbtiResult.setTestDate(cal.getTime());
            mbtiResult = mbtiResultRepo.save(mbtiResult);
            return mbtiResult;
        }
        return null;
    }

    @Override
    public Mbtiresult getMBTIResult(String username) {
        Users user = userRepo.findByUsername(username);
        if (user != null) {
            List<Mbtiresult> result = mbtiResultRepo.getMBTIResult(user.getId());
            if (result.size() >= 1) {
                int x = 0;
                return result.get(x);
            }
        }
        return null;
    }

    @Override
    public boolean updateMbtiResult(String mbtiName, int userid) {
        mbtiType = mbtiTypeRepo.findByMbtitypeName(mbtiName);
        if (mbtiType != null) {
            mbtiResultRepo.updateMBTIResult(userid, mbtiType.getId());
            return true;
        }
        return false;
    }

}
