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
public class ScheduleVO {

	private String memberId;
	private String courseName;
	private String professor;
	private String weeks;
	private int startHour;
	private int startMinute;
	private int endHour;
	private int endMinute;
	private String courseRoom;
	
}
