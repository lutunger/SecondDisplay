package com.project.secondDisplay.board.model.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;

public interface BoardService {
	
	Category selectCategory(int categoryNo);

	Map<String, Object> selectGoodsList(int categoryNo, int cp);

	void updateViewCount(int goodsNo);
		
	Goods selectGoodsDetail(int goodsNo);
	
	int insertGoods(Goods goods, List<MultipartFile> images, String webPath, String filePath) throws IllegalStateException, IOException;
	
	int selectManageListCount(int userNo);
	
	List<Goods> selectManageList(int userNo, int cp);

	Goods selectEditGoods(Goods goods);

	int updateGoods(Goods goods, List<MultipartFile> images, String webPath, String filePath, String deleteList) throws IllegalStateException, IOException;
	
	int deleteGoods(Goods goods);







}
