package com.project.secondDisplay.chat.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.secondDisplay.chat.model.dao.ChatDAO;
import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.dto.Room;
import com.project.secondDisplay.common.Util;

@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatDAO dao;
	
	@Override
	public List<Room> selectRoomList(int userNo) {
		return dao.selectRoomList(userNo);
	}

	@Override
	public int checkRoomNo(Map<String, Integer> map) {
		return dao.checkRoomNo(map);
	}

	@Override
	public int createRoom(Map<String, Integer> map) {
		return dao.createRoom(map);
	}

	@Override
	public int insertMessage(Message msg) {
		msg.setMessage(Util.XSSHandling(msg.getMessage()));
		return dao.insertMessage(msg);
	}

	@Override
	public List<Message> selectMessageList(Map<String, Object> paramMap) {
        List<Message> messageList = dao.selectMessageList(  Integer.parseInt( String.valueOf(paramMap.get("chatRoomNo") )));
        return messageList;
	}
	
	
	
}
