package com.project.secondDisplay.chat.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

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
	
    // 채팅방 입장(없으면 생성)
//    @GetMapping("/chatting/enter")
//    @ResponseBody
//    public int chattingEnter(int targetNo, @SessionAttribute("loginUser") User loginUser) {
//     
//        Map<String, Integer> map = new HashMap<String, Integer>();
//        
//        map.put("targetNo", targetNo);
//        map.put("loginMemberNo", loginUser.getUserNo());
//        
//        int roomNo = service.checkRoomNo(map);
//        
//        if(roomNo == 0) {
//            roomNo = service.createRoom(map);
//        }
//        
//        return roomNo;
//    }
//	
//    // 채팅방 목록 조회
//    @GetMapping(value="/chatting/roomList", produces="application/json; charset=UTF-8")
//    @ResponseBody
//    public List<ChattingRoom> selectRoomList(@SessionAttribute("loginMember") Member loginMember) {
//    	return service.selectRoomList(loginMember.getMemberNo());
//    }
//    
//    
//    // 채팅 읽음 표시
//    @PutMapping("/chatting/updateReadFlag")
//    @ResponseBody
//    public int updateReadFlag(@RequestBody Map<String, Object> paramMap) {
//        return service.updateReadFlag(paramMap);
//    }
//    
//    @GetMapping(value="/chatting/selectMessage", produces="application/json; charset=UTF-8")
//    @ResponseBody
//    public List<Message> selectMessageList(@RequestParam Map<String, Object> paramMap) {
//        return service.selectMessageList(paramMap);
//    }
//    
}
