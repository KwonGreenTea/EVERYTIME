package com.everytime.web.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
public class InquiryVO {
	private int inquiryId;
	private String inquiryBoard;
	private String inquiryFile;
	private String email;
	private String memberId;
	private String inquiryCheck;
}
