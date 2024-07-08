package com.everytime.web.persistence;

import org.apache.ibatis.annotations.Mapper;

import com.everytime.web.domain.InquiryVO;

@Mapper
public interface InquiryMapper {
	int insert(InquiryVO inquiryVO);
}
