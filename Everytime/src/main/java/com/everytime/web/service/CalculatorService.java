package com.everytime.web.service;

import java.util.ArrayList;

import com.everytime.web.domain.CalculatorVO;
import com.everytime.web.domain.ScheduleVO;

public interface CalculatorService {

	ArrayList<CalculatorVO> selectAllDataByMemberId(String memberId);
	
	int selectFinalCalNo(String memberId);

	int insertTimeTable(ScheduleVO scheduleVO);

	int insert(CalculatorVO calculatorVO);

	int delete(String memberId);

	int update(CalculatorVO calculatorVO);

}
