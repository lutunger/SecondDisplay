package com.project.secondDisplay.chat.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.secondDisplay.chat.model.dto.Room;

@Repository
public class ChatDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Room> selectRoomList(int userNo) {
		return sqlSession.selectList("chatMapper.selectRoomList", userNo);
	}
	
}
