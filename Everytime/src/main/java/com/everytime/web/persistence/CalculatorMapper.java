package com.everytime.web.persistence;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.CalculatorVO;
import com.everytime.web.domain.ScheduleVO;

@Mapper
public interface CalculatorMapper {

	ArrayList<CalculatorVO> selectAllDataByMemberId(String memberId);
	
	int selectFinalCalNo(String memberId);

	int insertTimeTable(ScheduleVO scheduleVO);

	int insert(CalculatorVO calculatorVO);

	int delete(String memberId);

	int update(CalculatorVO calculatorVO);

}
