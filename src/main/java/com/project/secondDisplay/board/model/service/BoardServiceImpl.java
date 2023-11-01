package com.project.secondDisplay.board.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.project.secondDisplay.board.model.dao.BoardDAO;
import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;

@Service
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	private BoardDAO dao;
	
	@Override
	public Category selectCategory(int categoryNo) {
		return dao.selectCategory(categoryNo);
	}

	@Override
	public Map<String, Object> selectGoodsList(int categoryNo, int cp) {
		
		List<Goods> goodsList = dao.selectGoodsList(categoryNo, cp);
		
		Map<String, Object> map = new HashMap<>();
		map.put("goodsList", goodsList);
		
		return map;
	}

	@Override
	public Goods selectGoodsDetail(int goodsNo) {
		return dao.selectGoodsDetail(goodsNo);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int insertGoods(Goods goods) {
		return dao.insertGoods(goods);
	}

	@Override
	public int selectManageListCount(int userNo) {
		return dao.selectManageListCount(userNo);
	}

	@Override
	public List<Goods> selectManageList(int userNo, int cp) {
		return dao.selectManageList(userNo, cp);
	}
	
	
	@Override
	public Goods selectEditGoods(Goods goods) {
		return dao.selectEditGoods(goods);
	}
	
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int updateGoods(Goods goods) {
		return dao.updateGoods(goods);
	}

	@Transactional(rollbackFor = {Exception.class})
	@Override
	public int deleteGoods(Goods goods) {
		return dao.deleteTarget(goods);
	}
	
	
}
