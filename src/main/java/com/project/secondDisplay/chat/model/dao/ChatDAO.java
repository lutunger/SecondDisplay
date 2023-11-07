package com.project.secondDisplay.chat.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.secondDisplay.chat.model.dto.Message;
import com.project.secondDisplay.chat.model.dto.Room;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Room> selectRoomList(int userNo) {
		return sqlSession.selectList("chatMapper.selectRoomList", userNo);
	}

	public int checkRoomNo(Map<String, Integer> map) {
		
		int result = sqlSession.selectOne("chatMapper.checkRoomNo", map);
		
		return result;
	}

	public int createRoom(Map<String, Integer> map) {
		int result = sqlSession.insert("chatMapper.createRoom", map);
		int roomNo = 0;
		if(result > 0) {
				roomNo = map.get("roomNo");
		}
		return roomNo;
	}

	public int insertMessage(Message msg) {
		return sqlSession.insert("chatMapper.insertMessage", msg);
	}
	
	
	
}
