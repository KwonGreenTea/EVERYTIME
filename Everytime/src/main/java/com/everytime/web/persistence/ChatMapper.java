package com.everytime.web.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.ChatVO;


@Mapper
public interface ChatMapper {
	int insert(ChatVO chatVO);
}