package com.project.secondDisplay.main.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.project.secondDisplay.board.model.service.BoardService;
@Controller
public class HomeController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		
		Map<String, Object> goods = boardService.selectGoodsList(300);
		
		model.addAttribute("map", goods);
		
		return "common/home";
	}
	
}
