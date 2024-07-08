package com.everytime.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.everytime.web.domain.InquiryVO;
import com.everytime.web.persistence.InquiryMapper;

import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class InquiryServiceImple implements InquiryService {
	@Autowired
	private InquiryMapper inquiryMapper;
	
	@Override
	public int createInquiry(InquiryVO inquiryVO) {
		log.info("crateInquiry");
		return inquiryMapper.insert(inquiryVO);
	}
	
}
