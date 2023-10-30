package com.project.secondDisplay.board.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.secondDisplay.board.model.service.BoardService;

@SessionAttributes({"loginUser"})
@RequestMapping("/list")
@Controller
public class BoardController {
	
	@Autowired
	private BoardService service;
	
	@GetMapping(value= {"/{categoryName}"})
	public String selectGoodsList(@PathVariable("categoryName") String categoryName
								, Model model
								) {
		
		
		Map<String, Object> goods = service.selectGoodsList(categoryName);
		
		model.addAttribute("map", goods);
		
		return "/board/list";
	}
	
}
