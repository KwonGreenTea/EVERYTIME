package com.everytime.web.service;

import java.util.List;
import com.everytime.web.domain.CourseVO;
import com.everytime.web.domain.ReviewVO;

public interface ReviewService {

	// 리뷰 데이터 삽입하기
	int insertReview(ReviewVO reviewVO);

	// 특정 강의의 데이터 출력하기 // 개요, 강의 평
	List<ReviewVO> selectReviewByCourseId(int courseId);

	// 모든 데이터 불러오기
	List<ReviewVO> selectReview();
	
	CourseVO getCourseById(int courseId);
	
	int updateReviewLike(int reviewId);
}
