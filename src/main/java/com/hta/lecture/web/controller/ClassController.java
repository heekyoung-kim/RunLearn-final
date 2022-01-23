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
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.Pagination;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/course")
public class ClassController {
	
	static final Logger logger = LogManager.getLogger(ClassController.class);
	
	@Autowired
	ClassService classService;
	
	@GetMapping
	public String list(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			Criteria criteria, Model model) {
		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteria);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = classService.getTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		logger.info("검색조건 및 값 :" + criteria);

		// 검색조건(opt, value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<ClassCourseDto> classes = classService.getAllCourseInfo(criteria);
		
		model.addAttribute("classes", classes);		
		model.addAttribute("pagination", pagination);
		
		return "/courses/list";
	}
	
	// depth1 페이지 이동
	@GetMapping("/it-programming")
	public String depth1(Model model){
		

		
		return "/courses/list";
	}
	
	// 상세페이지 이동
	@GetMapping("/{no}")
	public String detail(@PathVariable(name = "no") int no, Model model){
		
		log.info("조회할 강의번호: " + no);
		Classes classes = classService.getClassDetail(no);
		
		model.addAttribute("classes", classes);
		
		return "/courses/detail";
	}
}
