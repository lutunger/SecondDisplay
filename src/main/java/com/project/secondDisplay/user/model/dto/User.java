package com.project.secondDisplay.user.model.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Getter
@Setter
@ToString
public class User {
	private int userNo;
	private String userId;
	private String userPw;
	private String nickname;
	private String status;
	private String enrollDate;
}
