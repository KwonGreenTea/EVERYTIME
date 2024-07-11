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
	public List<ReviewVO> selectReviewByCourseId(int courseId) {
		log.info("selectReviewByCourseId");
		return reviewMapper.selectReviewByCourseId(courseId);
	}

	
	@Override
	public List<ReviewVO> selectReview() {
		log.info("selectReview");
		return reviewMapper.selectReview();
	}
	
	@Override
	public CourseVO getCourseById(int courseId) {
		log.info("getCourseById");
		return courseMapper.selectOne(courseId);
	}


	@Override
	public int updateReviewLike(int reviewId) {
		log.info("updateReviewLike");
		return reviewMapper.updateReviewLike(reviewId);
	}


	@Override
	public int updateCourseRate(int courseId, int courseRate) {
		log.info("updateCourseRate");
		return courseMapper.updateCourseRate(courseId, courseRate);
	}


	@Override
	public List<ReviewVO> selectTopLikeReviewByCourseId(int courseId) {
		log.info("selectTopReviewByLike");
		return reviewMapper.selectTopLikeReviewByCourseId(courseId);
	}


	@Override
	public List<ReviewVO> selectRateFilterdReview(int courseId, int courseRate) {
		log.info("selectRateFilterdReview");
		return reviewMapper.rateFilterdReview(courseId, courseRate);
	}


	@Override
	public List<ReviewVO> selectSortFilterReview(int courseId, String sortCondition) {
		log.info("selectSortFilterReview()");
		return reviewMapper.sortFilterReview(courseId, sortCondition);
	}


	

	



}
