package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.vo.Classes;

@Controller
@RequestMapping("/course")
public class ClassController {
	
	@Autowired
	ClassService classService;
	
	@GetMapping("/it-programming")
	public String coures(Model model){
		
		List<Classes> classes = classService.getAllClasses();
		List<ClassCourseDto> classCourse = classService.getAllCourseInfo();
		
		model.addAttribute("message", "강의 데이터를 출력하는 페이지입니다.");
		model.addAttribute("classes", classes);
		model.addAttribute("classCourse", classCourse);
		
		return "/courses/course";
	}
}
