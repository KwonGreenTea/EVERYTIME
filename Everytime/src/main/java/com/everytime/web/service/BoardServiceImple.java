package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.PostVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.persistence.PostMapper;
import com.everytime.web.persistence.RegisterMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class BoardServiceImple implements BoardService {

	@Autowired
	PostMapper postMapper;

	@Autowired
	RegisterMapper registerMapper;

	@Override
	public RegisterVO selectRegisterById(String memberId) {
		log.info("selectRegisterById");

		return registerMapper.selectByRegisterId(memberId);
	}

	@Override
	public List<PostVO> getAllPosts(int boardId) {
		log.info("getAllPosts()");
		return postMapper.selectPostList(boardId);
	}

}
