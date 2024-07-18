package com.everytime.web.persistence;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.everytime.web.domain.MessageVO;

@Mapper
public interface MessageMapper {
	int sendMsg(MessageVO messageVO);

	List<String> getResponseId(@Param("memberId") String memberId);

	List<String> getRequestId(@Param("memberId") String memberId);

	MessageVO getAllDataByResponeId(@Param("messageRequest") String memberId, @Param("messageResponse") String responeId);
}
