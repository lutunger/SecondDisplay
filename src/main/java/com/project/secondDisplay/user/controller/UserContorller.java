package com.project.secondDisplay.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.project.secondDisplay.user.model.dto.User;
import com.project.secondDisplay.user.model.service.UserService;

@SessionAttributes({"loginUser"})
@Controller
public class UserContorller {
	
	@Autowired
	private UserService service;
	
	@PostMapping("/login")
	public String login(User inputUser) {
		
		
		User loginUser = service.login(inputUser);
		
		System.out.println(loginUser);
		
		String path = "redirect:/";
		
		return path;
	}
	
}
