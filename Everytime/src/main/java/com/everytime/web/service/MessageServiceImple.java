package com.everytime.web.service;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.MessageVO;
import com.everytime.web.persistence.MessageMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class MessageServiceImple implements MessageService{

	@Autowired
	private MessageMapper messageMapper;

	@Override
	public int sendMsg(MessageVO messageVO) {
		log.info("sendMsg()");
		return messageMapper.sendMsg(messageVO);
	}

	@Override
	public Set<String> getMsgList(String memberId) {
		log.info("getData()");
		List<String> responseIdList = messageMapper.getResponseId(memberId);
		List<String> requestIdList = messageMapper.getRequestId(memberId);
		
		Set<String> msgList = new HashSet<>(responseIdList);
		msgList.addAll(requestIdList);
		
		return msgList;
	}

	@Override
	public MessageVO getAllDataByResponeId(String memberId, String responeId) {
		return messageMapper.getAllDataByResponeId(memberId, responeId);
	}
	

}
