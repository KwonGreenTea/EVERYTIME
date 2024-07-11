package com.everytime.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.RegisterVO;
import com.everytime.web.persistence.RegisterMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class RegisterServiceImple implements RegisterService {
	@Autowired
	private RegisterMapper registerMapper;
	
	@Override
		public int createRegister(RegisterVO registerVO) {
			log.info("createRegister");
			return registerMapper.insert(registerVO);
	}
	
	@Override
	public RegisterVO getRegisterById(String memberId) {
		log.info("getRegisterById()");
		return registerMapper.selectByRegisterId(memberId);
	}
	
	@Override
	public List<Integer> getAllId() {
		log.info("getAllId()");
		return registerMapper.selectIdList();
	}
	
	@Override
	public int checkId(String memberId) {
		int result = registerMapper.checkId(memberId);
		System.out.println("result: " + result);
		return result;
	}
	
	@Override
	public int updateRegister(RegisterVO registerVO) {
		log.info("updateRegister()");
		return registerMapper.update(registerVO);
	}
	
	@Override
	public int deleteRegister(String memberId) {
		log.info("deleteRegister()");
	    return registerMapper.delete(memberId);
	}
	
	@Override
	public boolean unregister(String memberId, String password) {
		RegisterVO registerVO = getRegisterById(memberId);
		if(registerVO != null && registerVO.getPassword().equals(password)) {
			return deleteRegister(memberId) > 0;
		}
		return false;
	}

	@Override
	public int updatePassword(RegisterVO registerVO) {
		log.info("updatePassword()");
		return registerMapper.updatePassword(registerVO);
	}

	@Override
	public int updateEmail(RegisterVO registerVO) {
		log.info("updateEmail()");
		return registerMapper.updateEmail(registerVO);
	}

	@Override
	public int updateNickname(RegisterVO registerVO) {
		log.info("updateNickname()");
		return registerMapper.updateNickname(registerVO);
	}

	@Override
	public int verifyPw(RegisterVO registerVO) {
		// log.info("verifyPw()");
		return registerMapper.verifyPw(registerVO);
	}
	
	@Override
	public int updatePassword(String memberId, String password) {
		log.info("updatePassword()");
		return registerMapper.updatePassword(memberId, password);
	}

	@Override
	public int updateEmail(String memberId, String email) {
		log.info("updateEmail()");
		return registerMapper.updateEmail(memberId, email);
	}

	@Override
	public int updateNickname(String memberId, String nickname) {
		log.info("updateNickname()");
		return registerMapper.updateNickname(memberId, nickname);
	}

	@Override
	public String getNameById(String memberId) {
		log.info("getNameById()");
		return registerMapper.getNameById(memberId);
	}
	
	@Override
	public int checkEmail(String email) {
		int result = registerMapper.checkEmail(email);
		log.info("checkEmail()");
		return result;
	}
	
	@Override
	public String getMemberIdByEmail(String email) {
		log.info("getMemberIdByEmail()");
		return registerMapper.getMemberIdByEmail(email);
	}
}
