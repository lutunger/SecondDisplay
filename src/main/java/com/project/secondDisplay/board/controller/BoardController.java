package com.project.secondDisplay.board.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.secondDisplay.board.model.dto.Category;
import com.project.secondDisplay.board.model.dto.Goods;
import com.project.secondDisplay.board.model.service.BoardService;
import com.project.secondDisplay.user.model.dto.User;

@SessionAttributes({"loginUser"})
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping(value= {"/category/{categoryNo}"})
	public String selectGoodsList(@PathVariable("categoryNo") int categoryNo
								, Model model
								) {
		
		Map<String, Object> goods = service.selectGoodsList(categoryNo, 0);
		Category category = service.selectCategory(categoryNo);
		
		model.addAttribute("map", goods);
		model.addAttribute("category", category);
		
		return "/board/list";
	}
	
	@PostMapping("/category/{categoryNo}")
	@ResponseBody
	public Map<String, Object> selectGoodsListMore(@PathVariable("categoryNo") int categoryNo
										,@RequestParam(value="cp") int cp
										, Model model){
		
		
		Map<String, Object> goods = service.selectGoodsList(categoryNo, cp);
		
		return goods;
	}
	
	@GetMapping("/search")
	public String selectSearchList(@RequestParam(value="val") String val
									, Model model) {
		
		List<Goods> searchList = service.selectSearchList(val, 0);
		
		model.addAttribute("searchList", searchList);
		
		return "board/search";
	}
	
	@PostMapping("/search")
	@ResponseBody
	public List<Goods> selectSearchListMore(@RequestParam(value="val") String val
						, @RequestParam(value="cp", required=false, defaultValue = "1" ) int cp) {
		
		List<Goods> searchList = service.selectSearchList(val, cp);
		
		return searchList;
	}
	
	
	@GetMapping("/detail/{goodsNo}")
	public String goodsDetail(@PathVariable("goodsNo") int goodsNo
								,Model model) {
		
		service.updateViewCount(goodsNo);
		Goods goods = service.selectGoodsDetail(goodsNo);
		goods.statusNaming();
		model.addAttribute("goods", goods);
		
		return "/board/detail";
	}
	
	@GetMapping("/add")
	public String goodsAddForward() {
		return "/board/add";
	}
	
	@PostMapping("/add")
	public String goodsAdd(Goods goods
							, @SessionAttribute(value = "loginUser") User loginUser
							, @RequestParam(value="images", required=false) List<MultipartFile> images
							, HttpSession session
							, RedirectAttributes ra) throws IllegalStateException, IOException {
		
		goods.setUserNo(loginUser.getUserNo());
		
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int goodsNo = service.insertGoods(goods, images, webPath, filePath);
		
		String message = null;
		String path = "redirect:";
		if(goodsNo > 0) {
			message = "상품이 등록 되었습니다.";
			path += "/detail/" + goodsNo;
		}else {
			message = "상품 등록이 실패했습니다. 다시 확인해주세요";
			path += "/detail/" + goods.getGoodsNo();
		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	
	@GetMapping("/manage")
	public String goodsManage(@SessionAttribute(value = "loginUser") User loginUser
								, @RequestParam(value="cp", required = false, defaultValue = "1") int cp
								, Model model) {
		
		int goodsListCount = service.selectManageListCount(loginUser.getUserNo());
		List<Goods> goodsList = service.selectManageList(loginUser.getUserNo(), cp);
		
		model.addAttribute("goodsList", goodsList);
		model.addAttribute("goodsListCount", goodsListCount);
		
		return "/board/manage";
	}
	
	@GetMapping("/edit/{goodsNo}")
	public String goodsEdit(@SessionAttribute(value = "loginUser") User loginUser
							, @PathVariable(value="goodsNo") int goodsNo
							, Model model
							, RedirectAttributes ra) {
		Goods goods = new Goods();
		goods.setUserNo(loginUser.getUserNo());
		goods.setGoodsNo(goodsNo);
		Goods goodsTarget = service.selectEditGoods(goods);
		model.addAttribute("goods", goodsTarget);
		return "/board/edit";
	}
	
	@PostMapping("/edit")
	public String updateGoods(@SessionAttribute(value = "loginUser") User loginUser
								, @RequestParam(value="images", required=false) List<MultipartFile> images
								, @RequestParam(value="deleteList", required=false) String deleteList
								,Goods goods
								,RedirectAttributes ra
								, HttpSession session) throws IllegalStateException, IOException {
		
		goods.setUserNo(loginUser.getUserNo());
		
		String webPath = "/resources/images/board/";
		String filePath = session.getServletContext().getRealPath(webPath);
		
		int result = service.updateGoods(goods, images, webPath, filePath, deleteList);
		
		
		String message = null;
		String path = "redirect:/";
		if(result > 0) {
			path +=  "detail/" + goods.getGoodsNo();
			message ="수정성공";
		}else {
			path += "manage";
			message = "수정실패, 확인 후 다시 시도해주세요";
		}
		ra.addFlashAttribute("message", message);
		return path;
	}
	
	
	@GetMapping("/delete/{goodsNo}")
	public String goodsDelete(@SessionAttribute(value = "loginUser") User loginUser
							, @PathVariable(value="goodsNo") int goodsNo
							, RedirectAttributes ra) {
		Goods goods = new Goods();
		goods.setUserNo(loginUser.getUserNo());
		goods.setGoodsNo(goodsNo);
		int result = service.deleteGoods(goods);
		String message = null;
		if(result > 0) {
			message = "삭제 성공";
		}else {
			message = "삭제 실패, 다시 시도해주세요";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:/manage";
	}
	
	
	
}
