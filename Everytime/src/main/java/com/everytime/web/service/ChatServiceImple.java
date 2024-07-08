package com.everytime.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ChatVO;
import com.everytime.web.persistence.ChatMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatServiceImple implements ChatService {
	@Autowired
	private ChatMapper chatMapper;

	@Override
	public int insert(ChatVO chatVO) {
		log.info("ChatServiceInsert()");
		return chatMapper.insert(chatVO);
	}
	
}
