package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.CourseVO;

public interface CourseService {

	List<CourseVO> selectCourse(String type , String keyword);
	

	
	
	
}
