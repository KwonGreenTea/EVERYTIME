package com.everytime.web.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class MessageVO {
	
	private int messageNo;
	private String messageRequest;
	private String messageResponse;
	private String content;
	private String messageCreatedDate;
	
	private String nickname;
	private String postAnonymous;
}
