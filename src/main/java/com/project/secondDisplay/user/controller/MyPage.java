package com.project.secondDisplay.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.secondDisplay.user.model.dto.User;
import com.project.secondDisplay.user.model.service.MyPageService;

@SessionAttributes({"loginMember"})
@RequestMapping("/myPage")
@Controller
public class MyPage {
	
	@Autowired
	private MyPageService service;
	
	@GetMapping("/nickname")
	public String forwardNicknamePage() {
		return "/myPage/myPage-nickname";
	}
	
	@PostMapping("/nickname")
	public String changeNickname(User inputUser,
								@SessionAttribute("loginUser") User loginUser,
								RedirectAttributes ra) {
		
		int result = service.changeNickname(inputUser);
			
		String message = null;
		
		if(result > 0) {
			message = "회원 정보가 수정되었습니다.";
			
			loginUser.setNickname( inputUser.getNickname() );
		}else {
			message = "회원 정보 수정 실패";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:nickname";
	}
	
	
	@GetMapping("/password")
	public String forwardPasswordPage() {
		return "/myPage/myPage-password";
	}
	
	@GetMapping("/secession")
	public String forwradSecession() {
		return "/myPage/myPage-secession";
	}
	
	
	
}
