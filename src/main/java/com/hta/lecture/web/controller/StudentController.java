package com.hta.lecture.web.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.dto.ChapterDto;
import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.service.ChapterService;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.vo.ClassDetail;
import com.hta.lecture.vo.Classes;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/")
public class StudentController {
	
	static final Logger logger = LogManager.getLogger(StudentController.class);
	
	@Autowired
	ClassService classService;
	
	@Autowired
	ChapterService chapterService;
	
	
	
	@GetMapping("/my-course")
	public String insturctorMyPage(@RequestParam(name = "no") int no, Model model) {
		
		log.info("조회할 회원 번호: " + no);
		int classCount = classService.getClassCountByNo(no);
		List<Classes> classesList = classService.getAllClassToStudentByUserNo(no);
		
		model.addAttribute("classCount", classCount);
		model.addAttribute("classesList", classesList);
		
		return "student-mypage/mystudy/my-course";
	}
	
	@GetMapping("course/{no}/dashboard")
	public String courseDetail(@PathVariable(name = "no") int no, Model model) {
		
		log.info("조회한 강의번호:" + no);
		
		// 강의번호로 강의정보를 불러온다.
		ClassesDto classes = classService.getClassDetail(no);
		
		// 강의번호로 해당 강의의 챕터 리스트를 불러온다
		List<ChapterDto> chapterList = chapterService.getChapterByClassNo(no);
		
		// 챕터 리스트를 하나씩 꺼낸다
		for(ChapterDto chapter : chapterList) {	
			// 챕터번호를 가져와서 해당 번호와 일치하는 classDetail정보를 불러온다.
			List<ClassDetail> classDetail = chapterService.getClassDetailByChapterNo(chapter.getNo());
			// classDetail 정보를 chapter 정보에 담는다.
			chapter.setClassDetail(classDetail);
			
			log.info("챕터 정보: " + classDetail);
		}
		
		model.addAttribute("classes", classes);
		model.addAttribute("chapterList", chapterList);
		
		return "courses/dashboard";
	}
	
	@GetMapping("course/{no}/curriculum/{chapterNo}")
	public String curriculum(@PathVariable(name = "no") int no, @PathVariable(name = "chapterNo") int chapterNo, Model model) {
		
		ClassDetail classDetail = chapterService.getChapterInfoByClassDeatilNo(chapterNo);
		
		model.addAttribute("classDetail", classDetail);
		
		return "courses/lecture/curriculum";
	}
}
