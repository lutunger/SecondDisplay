package com.project.secondDisplay.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.secondDisplay.user.model.dao.MyPageDAO;
import com.project.secondDisplay.user.model.dto.User;

@Service
public class MyPageServiceImpl implements MyPageService{
	
	@Autowired
	private MyPageDAO dao;
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int changeNickname(User inputUser) {
		return dao.updateNickname(inputUser);
	}
	
	
	
}
