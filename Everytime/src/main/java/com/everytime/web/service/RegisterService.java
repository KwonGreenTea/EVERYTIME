package com.everytime.web.service;

import java.util.List;

import com.everytime.web.domain.RegisterVO;

public interface RegisterService {
	int createRegister(RegisterVO registerVO);
	RegisterVO getRegisterById(String memberId);
	List<Integer> getAllId();
	int updateRegister(RegisterVO registerVO);
	int deleteRegister(String memberId);
	boolean unregister(String memberId, String password);
	
	int updatePassword(RegisterVO registerVO);
	int updateEmail(RegisterVO registerVO);
	int updateNickname(RegisterVO registerVO);
	int checkId(String memberId);
	int verifyPw(RegisterVO registerVO);
	int updatePassword(String memberId, String password);
	int updateEmail(String memberId, String email);
	int updateNickname(String memberId, String nickname);
	
	String getNameById(String memberId);
}
