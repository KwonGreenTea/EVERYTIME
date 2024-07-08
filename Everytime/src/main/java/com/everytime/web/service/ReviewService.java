package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.CourseVO;
import com.everytime.web.domain.ReviewVO;

public interface ReviewService {

	// 리뷰 데이터 삽입하기
	int insertReview(ReviewVO reviewVO);

	// 데이터 출력하기 // 개요, 강의 평
	List<ReviewVO> selectAllReview(int courseId);

	CourseVO getCourseById(int courseId);
}
