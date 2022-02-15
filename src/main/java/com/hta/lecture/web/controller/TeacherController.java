package com.hta.lecture.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.service.ClassService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/instructor")
public class TeacherController {
	
	static final Logger logger = LogManager.getLogger(ClassController.class);
	
	@Autowired
	ClassService classService;
	
	@GetMapping("{no}")
	public String insturctorMyPage(@PathVariable(name = "no") int no, Model model) {
		
		log.info("조회할 회원 번호: " + no);
		int classCount = classService.getClassCountByNo(no);
		
		model.addAttribute("classCount", classCount);
		
		return "teacher-mypage/home/teacherDashboard";
	}
	@GetMapping("/profile")
	public String profile() {
		return "teacher-mypage/home/teacherProfile";
	}
	@GetMapping("/courses/{no}")
	public String cources(@PathVariable(name = "no") int no, Model model) {
		
		log.info("회원 번호 조회: " + no);
		List<ClassesDto> classes = classService.getAllClassByNo(no);
		
		model.addAttribute("classes", classes);
		
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
