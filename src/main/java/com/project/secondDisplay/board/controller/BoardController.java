package com.project.secondDisplay.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/list")
@Controller
public class BoardController {
	
	@RequestMapping("")
	public String forwardList() {
		return "/board/list";
	}
	
}
