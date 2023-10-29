package com.project.secondDisplay.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.project.secondDisplay.user.model.service.CheckService;

@Controller
@RequestMapping("/check")
public class CheckController {
	
	@Autowired
	private CheckService service;
	
	@GetMapping("/id")
	@ResponseBody
	public int checkId(String id) {
		return service.checkId(id);
	}
	
	@GetMapping("/nickname")
	@ResponseBody
	public int checkNickname(String nickname) {
		return service.checkNickname(nickname);
	}
	
}
