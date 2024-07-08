package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.ChatListVO;

public interface ChatListService {
	int createRoom(String chat_title);
	int roomCount(String room_id);
	List<ChatListVO> allRoom();
	int roomCountChange(String room_id, int chat_count);
}
