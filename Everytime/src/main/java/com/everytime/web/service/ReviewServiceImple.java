package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.CourseVO;
import com.everytime.web.domain.ReviewVO;
import com.everytime.web.persistence.CourseMapper;
import com.everytime.web.persistence.ReviewMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReviewServiceImple implements ReviewService {

	@Autowired ReviewMapper reviewMapper;
	
	@Autowired CourseMapper courseMapper;
	
	@Override
	public int insertReview(ReviewVO reviewVO) {
		log.info("createReview");
		 int result = reviewMapper.insertReview(reviewVO);
		 return result ;
	}

	@Override
	public List<ReviewVO> selectAllReview(int courseId) {
		log.info("getAllReview");
		return reviewMapper.selectList(courseId);
	}

	@Override
	public CourseVO getCourseById(int courseId) {
		log.info("getCourseById");
		return courseMapper.selectOne(courseId);
	}



}
