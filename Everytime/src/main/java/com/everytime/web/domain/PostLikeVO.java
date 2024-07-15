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
public class PostLikeVO {

	
	
	private int postLikeNo;
	private int postId;
	private String memberId;
	
}
