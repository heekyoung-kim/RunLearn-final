package com.hta.lecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	@GetMapping("/")
	public String home(Model model) {
		model.addAttribute("message", "홈페이지 방문을 환영합니다.");
		
		return "home";	// prefix="/WEB-INF/views/" viewName="home" suffix=".jsp"
	}
}
