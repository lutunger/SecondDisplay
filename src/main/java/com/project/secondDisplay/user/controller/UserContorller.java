package com.project.secondDisplay.user.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.secondDisplay.user.model.dto.User;
import com.project.secondDisplay.user.model.service.UserService;

@SessionAttributes({"loginUser"})
@Controller
public class UserContorller {
	
	@Autowired
	private UserService service;
	
	@PostMapping("/login")
	public String login(User inputUser, Model model
						, @RequestHeader(value="referer") String referer
						, @RequestParam(value="saveId", required=false) String saveId
						, HttpServletResponse resp
						, RedirectAttributes ra) {
		
		User loginUser = service.login(inputUser);
		
		String path = "redirect:";
		if(loginUser != null) {
			path += "/";
			model.addAttribute("loginUser", loginUser);
			Cookie cookie = new Cookie("saveId", loginUser.getUserId());
			
			if(saveId != null) {
				cookie.setMaxAge(60 * 60 * 24 * 30);
			}else {
				cookie.setMaxAge(0);
			}
			
			cookie.setPath("/");
			resp.addCookie(cookie);
		}else {
			path += referer;
			ra.addFlashAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
		}
		
		return path;
	}
	
	@GetMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();
		return "redirect:/";
	}
	
	

	
	@PostMapping("/signUp")
	public String signUp(User inputUser
						, RedirectAttributes ra) {
		
		int result = service.signUp(inputUser);
		String message = null;
		
		if(result > 0) {
			message = inputUser.getNickname() + "님의 가입을 환영합니다.";
			
		} else {
			message = "죄송합니다 잠시후 다시 시도해주세요";
		}
		
		ra.addFlashAttribute("message", message);
		
		return "redirect:/";
	}
	
	@GetMapping(value = {"/myPage", "/myPage/nickname"})
	public String forwardMyPage() {
		return "/myPage/myPage-change";
	}
	
	
	
}
