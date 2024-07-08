package com.everytime.web.persistence;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.ScheduleVO;

@Mapper
public interface ScheduleMapper {

	int insert(ScheduleVO scheduleVO);
	
	ArrayList<ScheduleVO> selectSchedulesByMemberId(String memberId);
	
	int deleteSchedule(ScheduleVO scheduleVO);

	int deleteUser(String memberId);
}
