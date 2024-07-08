package com.everytime.web.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.CalculatorVO;
import com.everytime.web.domain.ScheduleVO;
import com.everytime.web.persistence.CalculatorMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CalculatorServiceImple implements CalculatorService {
	
	@Autowired
	CalculatorMapper calculatorMapper;
	
	@Override
	public ArrayList<CalculatorVO> selectAllDataByMemberId(String memberId) {
		log.info("selectAllDataByMemberId()");
		return calculatorMapper.selectAllDataByMemberId(memberId);
	}
	
	@Override
	public int selectFinalCalNo(String memberId) {
		log.info("selectFinalCalNo()");
		return calculatorMapper.selectFinalCalNo(memberId);
	}

	@Override
	public int insertTimeTable(ScheduleVO scheduleVO) {
		log.info("insertTimeTable()");
		return calculatorMapper.insertTimeTable(scheduleVO);
	}

	@Override
	public int insert(CalculatorVO calculatorVO) {
		log.info("insert()");
		return calculatorMapper.insert(calculatorVO);
	}

	@Override
	public int delete(String memberId) {
		log.info("delete()");
		return calculatorMapper.delete(memberId);
	}

	@Override
	public int update(CalculatorVO calculatorVO) {
		log.info("update()");
		return calculatorMapper.update(calculatorVO);
	}

}
