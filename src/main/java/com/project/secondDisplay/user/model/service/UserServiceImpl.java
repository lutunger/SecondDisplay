package com.project.secondDisplay.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.secondDisplay.user.model.dao.UserDAO;
import com.project.secondDisplay.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;

	@Override
	public User login(User inputUser) {
		
		User loginUser = dao.login(inputUser);
		
		if(loginUser != null) {
			if(inputUser.getUserPw().equals(loginUser.getUserPw())) {
				loginUser.setUserPw(null);
			}else {
				loginUser = null;
			}
		}
		
		return loginUser;
	}

	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}

	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(User inputUser) {
		
		int result = dao.signUp(inputUser);
		
		return result;
	}
	
	
	
	
	
}
