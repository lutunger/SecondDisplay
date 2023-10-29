package com.project.secondDisplay.user.model.service;

import com.project.secondDisplay.user.model.dto.User;

public interface MyPageService {

	int changeNickname(User inputUser);

	int changePw(String currentPw, String changePw, int userNo);

	int secession(String userPw, int userNo);
	
	
	
}
