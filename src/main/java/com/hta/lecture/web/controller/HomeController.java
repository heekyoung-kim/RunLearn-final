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
import com.hta.lecture.web.form.KakaoLoginForm;
import com.hta.lecture.web.form.UserRegisterForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	private static final String KAKAO_LOGIN_TYPE = "kakao";
	
	@Autowired
	private UserService userService;
	
	// 홈
	@RequestMapping("/")
	public String home() {
		
		return "home.jsp";
	}
	@RequestMapping("/hello")
	public String hello() {
		return "hello";	
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		
		return "redirect:/";
	}
	
	// 회원가입 폼
	@GetMapping("/registerUser")
	public String registerForm() {
		return "register.jsp";
	}
	
	// 회원정보 수정.
	@PostMapping("/updateUser") 
	public String updateUser(User user) {
		userService.updateUser(user);
		return "profile.jsp";
	}
	
	// kakao로그인 요청을 처리한다. 
	@PostMapping("/kakao-login")
	public String loginWithKakao(KakaoLoginForm form){
		log.info("카카오 로그인 인증정보:"+ form);
		
		User user = User.builder()
					.email(form.getEmail())
					.name(form.getName())
					.img(form.getImg())
					.loginType(KAKAO_LOGIN_TYPE)
					.build();
		
		User savedUser = userService.loginWithKakao(user);
		
		// 저장된 회원정보가 없으면 전달받은 회원정보를 세션에 저장, 있으면 기존 정보 저장.
		if(savedUser != null) {
			SessionUtils.addAttribute("LOGIN_USER", savedUser);
		}else {
			SessionUtils.addAttribute("LOGIN_USER", user);
		}
		
		return "redirect:/";
	}
	
	@GetMapping("/open-knowledge")
	public String openKnowledge() {
		return"openKnowledge";
	}
}
