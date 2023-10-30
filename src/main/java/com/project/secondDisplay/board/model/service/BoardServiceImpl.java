package com.project.secondDisplay.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.secondDisplay.board.model.dao.BoardDAO;
import com.project.secondDisplay.board.model.dto.Goods;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public Map<String, Object> selectGoodsList(String categoryName) {
		
		List<Goods> goodsList = dao.selectGoodsList(1);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsList", goodsList);
		
		return map;
	}

}
