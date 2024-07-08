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
public class CourseVO {
	
	private String courseId;
	private String major;
	private String field;
	private String courseName;
	private String professor;
	private int grade;
	private String courseTime;
	private String courseRoom;
	private String courseRate;
	
	

}
