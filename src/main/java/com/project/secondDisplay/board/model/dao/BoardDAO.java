package com.project.secondDisplay.board.model.dao;

import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;

@Repository
public class BoardDAO {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public Category selectCategory(int categoryNo) {
		return sqlSession.selectOne("boardMapper.selectCategory", categoryNo);
	}

	public List<Goods> selectGoodsList(int categoryNo, int cp) {
		RowBounds rowBounds = new RowBounds(cp, 20);
		return sqlSession.selectList("boardMapper.selectGoodsList", categoryNo, rowBounds);
	}

	public int updateViewCount(int goodsNo) {
		return sqlSession.update("boardMapper.updateViewCount",goodsNo);
	}
	
	public Goods selectGoodsDetail(int goodsNo) {
		return sqlSession.selectOne("boardMapper.selectGoodsDetail", goodsNo);
	}

	public int insertGoods(Goods goods) {
		return sqlSession.insert("boardMapper.insertGoods", goods);
	}

	public int selectManageListCount(int userNo) {
		return sqlSession.selectOne("boardMapper.selectManageListCount", userNo);
	}
	
	public List<Goods> selectManageList(int userNo, int cp) {
		RowBounds rowBounds = new RowBounds((cp - 1) * 10, 10);
		List<Goods> goodsList = sqlSession.selectList("boardMapper.selectManageList", userNo, rowBounds);
		for (Goods goods : goodsList) {
			goods.statusNaming();
		}
		return goodsList;
	}

	public Goods selectEditGoods(Goods goods) {
		return sqlSession.selectOne("boardMapper.selectEditGoods", goods);
	}
	
	public int updateGoods(Goods goods) {
		return sqlSession.update("boardMapper.updateGoods", goods);
	}
	
	public int deleteTarget(Goods goods) {
		return sqlSession.delete("boardMapper.deleteTarget", goods);
	}




	
}
