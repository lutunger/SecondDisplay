package com.project.secondDisplay.chat.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.secondDisplay.chat.model.dto.Room;
import com.project.secondDisplay.chat.model.service.ChatService;
import com.project.secondDisplay.user.model.dto.User;

@SessionAttributes("{loginUser}")
@Controller
public class ChatController {
	
	@Autowired
	private ChatService service;
	
	@GetMapping("/chat")
	public String forwardChat(@SessionAttribute("loginUser") User loginUser, Model model) {
		
		List<Room> roomList = service.selectRoomList(loginUser.getUserNo());
		model.addAttribute("roomList", roomList);
		
		return "/chat/chat";
	}
	
	@PostMapping("/chat/enter")
	public String chatEnter(@SessionAttribute("loginUser") User loginUser
							, int user2No
							, int goodsNo
							, RedirectAttributes ra) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("goodsNo", goodsNo);
		map.put("user1No", loginUser.getUserNo());
		map.put("user2No", user2No);
		
		int roomNo = service.checkRoomNo(map);
		
		if(roomNo == 0) {
			roomNo = service.createRoom(map);
		}
		
		ra.addFlashAttribute("roomNo", roomNo);
		
		return "redirect:/chat";
	}
	
	
	
	
}
