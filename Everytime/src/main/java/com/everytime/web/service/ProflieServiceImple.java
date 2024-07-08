package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ProfileVO;
import com.everytime.web.persistence.ProfileMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ProflieServiceImple implements ProfileService {

	@Autowired
    private ProfileMapper profileMapper;


    @Override
    public int createProfile(ProfileVO attachVO) {
    	log.info("createProfile");
        return profileMapper.insert(attachVO);
    }

    @Override
    public ProfileVO getProfileById(String memberId) {
    	log.info("getProfileById()");
        return profileMapper.selectByProfileId(memberId);
    }
    
    @Override
    public List<Integer> getAllId() {
    	log.info("getAllId()");
    	return profileMapper.selectIdList();
    }

    @Override
    public int updateProfile(ProfileVO attachVO) {
    	log.info("updateProfile()");
        return profileMapper.update(attachVO);
    }

    @Override
    public int deleteProfile(int attachId) {
    	log.info("deleteProfile()");
        return profileMapper.delete(attachId);
    }
}