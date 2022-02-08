package com.hta.lecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/instructor")
public class TeacherController {
	
	@GetMapping("")
	public String insturctorMyPage() {
		return "teacher-mypage/home/teacherDashboard";
	}
	@GetMapping("/profile")
	public String profile() {
		return "teacher-mypage/home/teacherProfile";
	}
	@GetMapping("/courses")
	public String cources() {
		return "teacher-mypage/myclass/courses";
	}
	@GetMapping("/incomes")
	public String incomes() {
		return "teacher-mypage/myclass/incomes";
	}
	@GetMapping("/news")
	public String news() {
		return "teacher-mypage/myclass/news";
	}
	@GetMapping("/questions")
	public String questions() {
		return "teacher-mypage/myclass/questions";
	}
	@GetMapping("/reviews")
	public String reviews() {
		return "teacher-mypage/myclass/reviews";
	}
	
	
}
