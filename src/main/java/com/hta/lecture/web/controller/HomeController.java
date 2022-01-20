package com.hta.lecture.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.exception.LoginErrorException;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

@Controller
@RequestMapping("/test")
public class HomeController {

	@Autowired
	UserService userService;
	
	@GetMapping("/home")
	public String home(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		
		return "home";	// prefix="/WEB-INF/views/" viewName="home" suffix=".jsp"
	}

	@GetMapping("/login")
	public String loginform() {
		
		return "loginform";	
	}
	
	@PostMapping("/login")
	public String login(String email, String password, Model model) {
		if(!StringUtils.hasText(email) || !StringUtils.hasText(password)) {
			throw new LoginErrorException("아이디와 비밀번호는 필수 입력값입니다.");
		}
		User user = userService.login(email, password);
		SessionUtils.addAttribute("LOGIN_USER", user);
		
		return "redirect:home";
	}
	
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		
		return "redirect:home";
	}
}
