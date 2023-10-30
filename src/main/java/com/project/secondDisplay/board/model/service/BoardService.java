package com.project.secondDisplay.board.model.service;

import java.util.Map;

import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;

public interface BoardService {
	
	Category selectCategory(int categoryNo);

	Map<String, Object> selectGoodsList(int categoryNo, int cp);

	Goods selectGoodsDetail(int goodsNo);


}
