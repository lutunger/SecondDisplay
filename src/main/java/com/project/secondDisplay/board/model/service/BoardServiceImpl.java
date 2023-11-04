package com.project.secondDisplay.board.model.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.project.secondDisplay.board.model.dao.BoardDAO;
import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;
import com.project.secondDisplay.board.model.dto.GoodsImg;
import com.project.secondDisplay.board.model.exception.FileUploadException;
import com.project.secondDisplay.board.model.exception.ImageDeleteException;
import com.project.secondDisplay.common.Util;

@Service
public class BoardServiceImpl implements BoardService {

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
	public void updateViewCount(int goodsNo) {
		dao.updateViewCount(goodsNo);
	}

	@Override
	public Goods selectGoodsDetail(int goodsNo) {
		return dao.selectGoodsDetail(goodsNo);
	}

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int insertGoods(Goods goods, List<MultipartFile> images, String webPath, String filePath)
			throws IllegalStateException, IOException {

		goods.setGoodsDescr(Util.XSSHandling(goods.getGoodsDescr()));
		goods.setGoodsTitle(Util.XSSHandling(goods.getGoodsTitle()));

		int goodsNo = dao.insertGoods(goods);

		if (goodsNo > 0) {

			List<GoodsImg> uploadList = new ArrayList<GoodsImg>();

			for (int i = 0; i < images.size(); i++) {

				if (images.get(i).getSize() > 0) {

					GoodsImg img = new GoodsImg();

					img.setGoodsNo(goodsNo);

					img.setFileOrder(i);

					String fileName = Util.fileRename(images.get(i).getOriginalFilename());

					img.setFileName(fileName);

					img.setFilePath(webPath + fileName);

					uploadList.add(img);
				}
			}

			if (!uploadList.isEmpty()) {
				int result = dao.insertImgList(uploadList);

				if (result == uploadList.size()) {

					for (int i = 0; i < uploadList.size(); i++) {

						int index = uploadList.get(i).getFileOrder();

						images.get(index).transferTo(new File(filePath + uploadList.get(i).getFileName()));

					}

				} else {
					throw new FileUploadException();
				}

			}

		}

		return goodsNo;

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

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int updateGoods(Goods goods, List<MultipartFile> images, String webPath, String filePath, String deleteList)
			throws IllegalStateException, IOException {

		goods.setGoodsDescr(Util.XSSHandling(goods.getGoodsDescr()));
		goods.setGoodsTitle(Util.XSSHandling(goods.getGoodsTitle()));

		int result = dao.updateGoods(goods);

		System.out.println(images);

		if (result > 0) {

			if (!deleteList.equals("")) {

				Map<String, Object> deleteMap = new HashMap<>();
				deleteMap.put("goodsNo", goods.getGoodsNo());
				deleteMap.put("deleteList", deleteList);

				result = dao.imageDelete(deleteMap);

				if (result == 0) {
					throw new ImageDeleteException();
				}

			}

			List<GoodsImg> uploadList = new ArrayList<>();

			for (int i = 0; i < images.size(); i++) {

				if (images.get(i).getSize() > 0) {

					GoodsImg img = new GoodsImg();

					img.setGoodsNo(goods.getGoodsNo());

					img.setFileOrder(i);

					String fileName = Util.fileRename(images.get(i).getOriginalFilename());

					img.setFileName(fileName);

					img.setFilePath(webPath + fileName);

					uploadList.add(img);

					result = dao.imageUpdate(img);

					if (result == 0) {
						result = dao.ImageInsert(img);
					}
				}
			}

			if (!uploadList.isEmpty()) {

				for (int i = 0; i < uploadList.size(); i++) {

					int index = uploadList.get(i).getFileOrder();

					images.get(index).transferTo(new File(filePath + uploadList.get(i).getFileName()));

				}

			}

		}

		return result;

	}

	@Transactional(rollbackFor = { Exception.class })
	@Override
	public int deleteGoods(Goods goods) {
		return dao.deleteTarget(goods);
	}

}
