package com.project.secondDisplay.user.model.service;

import com.project.secondDisplay.user.model.dto.User;

public interface CheckService {
	
	int checkNickname(String nickname);

	int checkId(String id);

}
