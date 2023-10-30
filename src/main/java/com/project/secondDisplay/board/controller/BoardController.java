package com.project.secondDisplay.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.secondDisplay.board.model.service.BoardService;

@SessionAttributes({"loginUser"})
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping(value= {"/category/{categoryNo}"})
	public String selectGoodsList(@PathVariable("categoryNo") int categoryNo
								, Model model
								) {
		
		Map<String, Object> goods = service.selectGoodsList(categoryNo);
		
		model.addAttribute("map", goods);
		return "/board/list";
	}
	
	@PostMapping("/category/{categoryNo}")
	@ResponseBody
	public Map<String, Object> selectGoodsListMore(@PathVariable("categoryNo") int categoryNo
										,@RequestParam(value="cp") int cp
										, Model model){
		
		
		Map<String, Object> goods = service.selectGoodsList(categoryNo);
		
		return goods;
	}
	
	@GetMapping("/detail/{goodsNo}")
	public String goodsDetail(@PathVariable("goodsNo") int goodsNo
								,Model model) {
		
		
		
		return "/board/detail";
	}
	
}
