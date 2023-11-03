package com.project.secondDisplay.chat.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.secondDisplay.chat.model.dao.ChatDAO;
import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.dto.Room;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;
	
	@Override
	public List<Room> selectRoomList(int userNo) {
		return dao.selectRoomList(userNo);
	}


	@Override
	public int insertMessage(Message msg) {
		return 0;
	}
	
	
	
}
