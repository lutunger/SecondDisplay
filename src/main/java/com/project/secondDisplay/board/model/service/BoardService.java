package com.project.secondDisplay.board.model.service;

import java.util.Map;

import com.project.secondDisplay.board.model.dto.Goods;

public interface BoardService {

	Map<String, Object> selectGoodsList(int categoryNo);

	Goods selectGoodsDetail(int goodsNo);

}
