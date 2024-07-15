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
public class FileVO {
	private int boardId;
	private int postId;
	// 이미지 파일 관련 VO
	private String postPath;
	private String postRealName;
	private String postChgName;
	private String postExtension;
}