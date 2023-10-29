package com.project.secondDisplay.user.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.secondDisplay.user.model.dao.CheckDAO;

@Service
public class CheckServiceImpl implements CheckService{
	
	@Autowired
	private CheckDAO dao;
	
	@Override
	public int checkNickname(String nickname) {
		return dao.checkNickname(nickname);
	}
	
	@Override
	public int checkId(String id) {
		return dao.checkId(id);
	}


}
