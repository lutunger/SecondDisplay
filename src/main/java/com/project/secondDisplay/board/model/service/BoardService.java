package com.project.secondDisplay.board.model.service;

import java.util.List;
import java.util.Map;

import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;

public interface BoardService {
	
	Category selectCategory(int categoryNo);

	Map<String, Object> selectGoodsList(int categoryNo, int cp);

	void updateViewCount(int goodsNo);
	
	Goods selectGoodsDetail(int goodsNo);
	
	int insertGoods(Goods goods);

	int selectManageListCount(int userNo);
	
	List<Goods> selectManageList(int userNo, int cp);

	Goods selectEditGoods(Goods goods);

	int updateGoods(Goods goods);
	
	int deleteGoods(Goods goods);






}
