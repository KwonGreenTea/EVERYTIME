package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.CourseVO;
import com.everytime.web.persistence.CourseMapper;


import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class CourseServiceImple implements CourseService{
	
	@Autowired
	private CourseMapper courseMapper;
	
	
	@Override
	public List<CourseVO> selectCourse(String type , String keyword) {
		log.info("selectCourse()");
		log.info(keyword);
		return courseMapper.selectCourse(type,keyword) ;
	}


}
