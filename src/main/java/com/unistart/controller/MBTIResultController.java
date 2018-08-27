package com.unistart.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.unistart.constant.ErrorConstant;
import com.unistart.constant.UrlConstant;
import com.unistart.entities.Mbtiquestion;
import com.unistart.entities.Mbtiresult;
import com.unistart.entities.customentities.MBTIResultType;
import com.unistart.error.ErrorNotification;
import com.unistart.services.interfaces.MBTIResultServiceInterface;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;

@RestController
@RequestMapping(value = UrlConstant.MBTI)
public class MBTIResultController {

    @Autowired
    private MBTIResultServiceInterface mbtiResultService;
    private ErrorNotification error;
    private Mbtiresult MBTIResult;

    @RequestMapping(value = UrlConstant.SAVE_MBTI_RESULT, method = RequestMethod.POST)
    public ResponseEntity<?> saveMbtiResult(@RequestBody MBTIResultType mbtiResultType,
            Authentication auth) {
        String mbtiName = mbtiResultType.getMbtiType().getMbtitypeName();
        String username = ((UserDetails) auth.getPrincipal()).getUsername();
        Mbtiresult isSuccess = mbtiResultService.saveMbtiResult(mbtiName, username);
        if (isSuccess != null) {
            return new ResponseEntity<Mbtiresult>(isSuccess, HttpStatus.OK);
        } else {
            error = new ErrorNotification(ErrorConstant.MES005);
            return new ResponseEntity<ErrorNotification>(error, HttpStatus.CONFLICT);
        }
    }

//	@RequestMapping(value = UrlConstant.UPDATE_MBTI_RESULT, method = RequestMethod.POST)
//	public ResponseEntity<?> updateMbtiResult(@RequestBody MBTIResultType mbtiResultType) {
//		String mbtiName = mbtiResultType.getMbtiType().getMbtitypeName();
//		int userId = mbtiResultType.getUser().getId();
//		boolean isSuccess = mbtiResultService.updateMbtiResult(mbtiName, userId);
//		if (isSuccess) {
//			return new ResponseEntity<Boolean> (isSuccess, HttpStatus.OK);
//		} else {
//			error = new ErrorNotification(ErrorConstant.MES005);
//			return new ResponseEntity<ErrorNotification> (error, HttpStatus.CONFLICT);
//		}
//	}
    @RequestMapping(value = UrlConstant.GET_MBTI_RESULT, method = RequestMethod.GET)
    public ResponseEntity<?> getMbtiResult(Authentication auth) {
        String username = ((UserDetails) auth.getPrincipal()).getUsername();
        MBTIResult = mbtiResultService.getMBTIResult(username);
        if (MBTIResult != null) {
            return new ResponseEntity<Mbtiresult>(MBTIResult, HttpStatus.OK);
        }
        error = new ErrorNotification(ErrorConstant.MES008);
        return new ResponseEntity<ErrorNotification>(error, HttpStatus.CONFLICT);
    }
}
