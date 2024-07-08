package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.CourseVO;

public interface CourseService {

	List<CourseVO> courseName_search(String courseName);
	
	List<CourseVO> professor_search(String professor);
	
	
	
}
