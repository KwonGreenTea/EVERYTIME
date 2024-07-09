package com.everytime.web.domain;

import java.util.Date;

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
public class PostVO {
	private int postId;
	private int boardId;
	private int memberId;
	private String postTitle;
	private String postContent;
	private Date postCreatedDate;
	private int postLikeCount;
	private int postScrapCount;
	private String postAnonymous;
}