package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.RegisterVO;


public interface BoardService {

	RegisterVO selectRegisterById(String memberId);
	
	List<PostVO> getAllPosts(int boardId);
	
}
