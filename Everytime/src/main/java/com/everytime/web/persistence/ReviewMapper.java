package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.everytime.web.domain.ReviewVO;

@Mapper
public interface ReviewMapper {

	int insertReview(ReviewVO reviewVO);
	List<ReviewVO> selectList(int courseId);
	
	
}
