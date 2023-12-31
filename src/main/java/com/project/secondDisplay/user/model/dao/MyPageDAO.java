package com.project.secondDisplay.user.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.secondDisplay.user.model.dto.User;

@Repository
public class MyPageDAO {
	
	@Autowired
    private SqlSessionTemplate sqlSession;
	
	public int updateNickname(User inputUser) {
		return sqlSession.update("myPageMapper.updateNickname", inputUser);
	}


	public int changePw(String changePw, int userNo) {
		
		User user = new User();
		user.setUserNo(userNo);
		user.setUserPw(changePw);
		
		return sqlSession.update("myPageMapper.changePw", user);
	}

	public int secession(int userNo) {
		return sqlSession.update("myPageMapper.secession", userNo);
	}
	
	public String selectEncPw(int userNo) {
		return sqlSession.selectOne("myPageMapper.selectEncPw", userNo);
	}

}
