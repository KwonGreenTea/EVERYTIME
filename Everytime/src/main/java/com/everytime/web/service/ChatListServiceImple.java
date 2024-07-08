package com.everytime.web.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.ChatListVO;
import com.everytime.web.persistence.ChatListMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ChatListServiceImple implements ChatListService {
	@Autowired
	private ChatListMapper chatListMapper;

	@Override
	public int createRoom(String chat_title) {
		log.info("createRoom");
		return chatListMapper.insert(chat_title);
	}

	@Override
	public int roomCount(String room_id) {
		return chatListMapper.selectByName(room_id);
	}

	@Override
	public List<ChatListVO> allRoom() {
		return chatListMapper.allRoom();
	}

	@Override
	public int roomCountChange(String room_id, int chat_count) {
		return chatListMapper.updateCount(room_id, chat_count);
	}
	
}
