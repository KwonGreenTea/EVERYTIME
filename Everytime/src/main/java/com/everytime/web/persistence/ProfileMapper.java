package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.ProfileVO;

@Mapper
public interface ProfileMapper {
    int insert(ProfileVO attach);
    ProfileVO selectByProfileId(String memberId);
    List<Integer> selectIdList();
    int update(ProfileVO attach);
    int delete(int attachId);
}