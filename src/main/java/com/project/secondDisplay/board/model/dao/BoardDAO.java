package com.project.secondDisplay.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.secondDisplay.board.model.dto.Goods;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;

	public List<Goods> selectGoodsList(int i) {
		
		RowBounds rowBounds = new RowBounds(0, 20);
		return sqlSession.selectList("boardMapper.selectGoodsList", null, rowBounds);
	}
	
	
	
}
