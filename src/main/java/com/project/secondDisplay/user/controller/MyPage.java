package com.project.secondDisplay.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.secondDisplay.user.model.dto.User;
import com.project.secondDisplay.user.model.service.MyPageService;

@SessionAttributes({"loginUser"})
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
		
		inputUser.setUserId(loginUser.getUserId());
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
	
	@PostMapping("/password")
	public String changePassward(String currentPw, String changePw,
								@SessionAttribute("loginUser") User loginUser,
								RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		
		int result = service.changePw(currentPw, changePw, userNo);
		String message = null;
		
		if(result > 0) {
			message = "비밀번호가 변경 되었습니다.";
		}else {
			message = "현재 비밀번호가 일치하지 않습니다.";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:password";
	}
	
	@GetMapping("/secession")
	public String forwradSecession() {
		return "/myPage/myPage-secession";
	}
	
	@PostMapping("secession")
	public String secession(String userPw
							,@SessionAttribute("loginUser") User loginUser
							,SessionStatus status
							,HttpServletResponse resp
							,RedirectAttributes ra) {
		
		int userNo = loginUser.getUserNo();
		
		int result = service.secession(userPw, userNo);
		
		String path = "redirect:";
		String message = null;
		
		if(result > 0) {
			message = "탈퇴 되었습니다.";
			path+="/";
			status.setComplete();
			Cookie cookie = new Cookie("saveId", "");
			cookie.setMaxAge(0);
			cookie.setPath("/");
			resp.addCookie(cookie); 
		}
		else {
			message = "현재 비밀번호가 일치하지 않습니다.";
			path += "secession";
		}
		
		ra.addFlashAttribute("message", message);
		
		return path;
		
	}
	
}