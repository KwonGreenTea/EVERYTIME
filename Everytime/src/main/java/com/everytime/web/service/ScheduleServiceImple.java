package com.everytime.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ScheduleVO;
import com.everytime.web.persistence.ScheduleMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ScheduleServiceImple implements ScheduleService{

	@Autowired
	private ScheduleMapper scheduleMapper;
	
	@Override
	public int createSchedule(ScheduleVO scheduleVO) {
		log.info("createSchedule");
		return scheduleMapper.insert(scheduleVO);
	}

	@Override
	public ArrayList<ScheduleVO> selectSchedulesByMemberId(String memberId) {
		log.info("selectSchedulesByMemberId");
		return scheduleMapper.selectSchedulesByMemberId(memberId);
	}

	@Override
	public int deleteSchedule(ScheduleVO scheduleVO) {
		log.info("deleteSchedule");
		return scheduleMapper.deleteSchedule(scheduleVO);
	}

	@Override
	public int deleteUser(String memberId) {
		log.info("deleteUser");
		return scheduleMapper.deleteUser(memberId);
	}

}
