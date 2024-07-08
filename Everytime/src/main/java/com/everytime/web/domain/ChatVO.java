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
public class ChatVO {

	private int chat_id;
	private int room_id;
	private String nickname;
	private String chat_content;
	private Date chat_time;
}