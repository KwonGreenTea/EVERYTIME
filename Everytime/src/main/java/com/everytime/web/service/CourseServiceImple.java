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
	public List<CourseVO> courseName_search(String courseName) {
		log.info("courseName_search");
		log.info(courseName);
		return courseMapper.courseName_search(courseName) ;
	}

	@Override
	public List<CourseVO> professor_search(String professor) {
		log.info("professor_search");
		return courseMapper.professor_search(professor);
	}

}
