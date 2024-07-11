package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReview(ReviewVO reviewVO);
	
	List<ReviewVO> selectReviewByCourseId(int courseId);
	
	List<ReviewVO> selectReview();
	
	int updateReviewLike(int reviewId);
	
	List<ReviewVO> selectTopLikeReviewByCourseId(int courseId);
	
}
