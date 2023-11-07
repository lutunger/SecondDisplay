package com.project.secondDisplay.chat.model.service;

import java.util.List;
import java.util.Map;

import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.dto.Room;

public interface ChatService {

	List<Room> selectRoomList(int userNo);

	int checkRoomNo(Map<String, Integer> map);

	int createRoom(Map<String, Integer> map);

	int insertMessage(Message msg);

}
