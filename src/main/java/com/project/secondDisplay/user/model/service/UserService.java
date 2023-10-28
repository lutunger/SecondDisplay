package com.project.secondDisplay.user.model.service;

import com.project.secondDisplay.user.model.dto.User;

public interface UserService {
	
	User login(User inputUser);

	int checkId(String id);

	int checkNickname(String nickname);

	int signUp(User inputUser);
	
}
