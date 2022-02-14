package com.hta.lecture.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.service.ClassService;
import com.hta.lecture.vo.Classes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class StudentController {
	
	static final Logger logger = LogManager.getLogger(ClassController.class);
	
	@Autowired
	ClassService classService;
	
	@GetMapping("/my-course")
	public String insturctorMyPage(@RequestParam(name = "no") int no, Model model) {
		
		log.info("조회할 회원 번호: " + no);
		int classCount = classService.getClassCountByNo(no);
		List<Classes> classesList = classService.getAllClassToStudentByUserNo(no);
		
		model.addAttribute("classCount", classCount);
		model.addAttribute("classesList", classesList);
		
		return "student-mypage/mystudy/my-course";
	}
	
}
