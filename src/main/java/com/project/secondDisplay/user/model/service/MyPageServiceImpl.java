package com.project.secondDisplay.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.secondDisplay.user.model.dao.MyPageDAO;
import com.project.secondDisplay.user.model.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Autowired
	private BCryptPasswordEncoder bcrypt;
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int changeNickname(User inputUser) {
		return dao.updateNickname(inputUser);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int changePw(String currentPw, String changePw, int userNo) {
		
		String encPw = dao.selectEncPw(userNo);
		
		if(bcrypt.matches(currentPw, encPw)) {
			
			return dao.changePw(bcrypt.encode(changePw), userNo);
		}
		
		return 0;
	}
	
	@Transactional(rollbackFor = Exception.class)
	@Override
	public int secession(String userPw, int userNo) {
		
		String encPw = dao.selectEncPw(userNo);
		
		if(bcrypt.matches(userPw, encPw)) {
			return dao.secession(userNo);
		}
		
		return 0;
	}
	
}





