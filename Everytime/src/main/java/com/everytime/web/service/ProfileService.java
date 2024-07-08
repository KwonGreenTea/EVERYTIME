package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.ProfileVO;

public interface ProfileService {
	
    int createProfile(ProfileVO attachVO);
    ProfileVO getProfileById(String memberId);
    List<Integer> getAllId();
    int updateProfile(ProfileVO attachVO);
    int deleteProfile(int attachId);

}