package com.everytime.web.service;

import java.util.ArrayList;

import com.everytime.web.domain.ScheduleVO;

public interface ScheduleService {

	int createSchedule(ScheduleVO scheduleVO);

	ArrayList<ScheduleVO> selectSchedulesByMemberId(String memberId);

	int deleteSchedule(ScheduleVO scheduleVO);

	int deleteUser(String memberId);
	
}
