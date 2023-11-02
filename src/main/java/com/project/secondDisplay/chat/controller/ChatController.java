package com.project.secondDisplay.chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

@SessionAttributes("{loginUser}")
@Controller
public class ChatController {
	
	
	@GetMapping("/chat")
	public String forwardChat() {
		
		return "/chat/chat";
	}
	
}
