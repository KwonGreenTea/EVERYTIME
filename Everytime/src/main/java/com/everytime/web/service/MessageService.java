package com.everytime.web.service;

import java.util.Set;

import com.everytime.web.domain.MessageVO;

public interface MessageService {

	int sendMsg(MessageVO messageVO);

	Set<String> getMsgList(String memberId);

	MessageVO getAllDataByResponeId(String memberId, String responeId);
	
}
