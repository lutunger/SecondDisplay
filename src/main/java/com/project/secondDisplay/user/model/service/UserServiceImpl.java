package com.project.secondDisplay.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.secondDisplay.user.model.dao.UserDAO;
import com.project.secondDisplay.user.model.dto.User;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Override
	public User login(User inputUser) {
		User loginUser = dao.login(inputUser);
		if(loginUser != null) {
			if(bcrypt.matches(inputUser.getUserPw(), loginUser.getUserPw())) {
				loginUser.setUserPw(null);
			}else {
				loginUser = null;
			}
		}
		return loginUser;
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int signUp(User inputUser) {
		String encPw = bcrypt.encode(inputUser.getUserPw());
		inputUser.setUserPw(encPw);
		int result = dao.signUp(inputUser);
		return result;
	}


	
	
}
