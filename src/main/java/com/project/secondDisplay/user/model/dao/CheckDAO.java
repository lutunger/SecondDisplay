package com.project.secondDisplay.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CheckDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public int checkId(String id) {
		return sqlSession.selectOne("checkMapper.checkId", id);
	}

	public int checkNickname(String nickname) {
		return sqlSession.selectOne("checkMapper.checkNickname", nickname);
	}
	
}
