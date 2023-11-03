package com.project.secondDisplay.chat.model.service;

import java.util.List;

import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.dto.Room;

public interface ChatService {

	List<Room> selectRoomList(int userNo);
	
	int insertMessage(Message msg);


}
