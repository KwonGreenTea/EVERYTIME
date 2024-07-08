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

public class ReviewVO {

	private int courseId;
	private String professor;
	private String review;
	private String semester;
	private int project;
	private int team;
	private int grade;
	private int attend;
	private int exam;
	private int courseRate;
	private int reviewLike;

	
}
