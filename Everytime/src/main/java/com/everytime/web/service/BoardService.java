package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.domain.ReviewVO;


public interface BoardService {

	RegisterVO selectRegisterById(String memberId);
	
	List<PostVO> getAllPosts(int boardId);
	
	// 모든 데이터 불러오기
	List<ReviewVO> selectReview();
	
}
