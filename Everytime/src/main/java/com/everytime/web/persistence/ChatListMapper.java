package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.ChatListVO;


@Mapper
public interface ChatListMapper {
	int insert(String chat_title);

	int selectByName(String room_id);

	List<ChatListVO> allRoom();

	int updateCount(@Param("room_id") String room_id, @Param("chat_count") int chat_count);

}