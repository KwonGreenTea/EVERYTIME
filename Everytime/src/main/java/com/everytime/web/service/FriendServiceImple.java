package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.FriendVO;
import com.everytime.web.domain.RegisterVO;
import com.everytime.web.persistence.FriendMapper;
import com.everytime.web.persistence.RegisterMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j

public class FriendServiceImple implements FriendService{

	
	@Autowired
	private FriendMapper friendMapper;
	
	@Autowired
	private RegisterMapper registerMapper;
	
	@Override
	public int createFriend(String requestId, String responseId, String requestName, String responseName) {
		log.info("createFriend");
		return friendMapper.insert(requestId, responseId, requestName, responseName);
	}

	@Override
	public List<FriendVO> checkRequest(String requestId) {
		log.info("checkRequest");
		return friendMapper.checkRequest(requestId);
	}

	@Override
	public List<String> UserAccept(String requestId) {
		log.info("UserAccept");
		return friendMapper.UserAccept(requestId);
	}

	@Override
	public List<FriendVO> checkFriend(String requestId, String responseId) {
		log.info("checkFriend");
		return friendMapper.checkFriend(requestId, responseId);
	}
	
	@Override
	public int acceptFriend(String requestId, String responseId) {
		log.info("acceptFriend");
		return friendMapper.acceptFriend(requestId,responseId);
	}

	@Override
	public int deleteFriend(String requestId, String responseId) {
		log.info("refuseFriend");
		return friendMapper.deleteFriend(requestId, responseId);
	}

	@Override
	public FriendVO FriendAccept(String requestId, String responseId) {
		log.info("friendAccept");
		return friendMapper.FriendAccept(requestId, responseId);
	}
	
	@Override
	public RegisterVO getRegisterById(String memberId) {
		log.info("getRegisterById()");
		return registerMapper.selectByRegisterId(memberId);
	}

	@Override
	public int deleteUser(String memberId) {
		log.info("deleteUser()");
		return friendMapper.deleteUser(memberId);
	}

	
	
	

}
