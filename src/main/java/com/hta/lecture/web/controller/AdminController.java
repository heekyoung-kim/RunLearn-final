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

import com.hta.lecture.dto.AdminPageDto;
import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.ClassPagination;
import com.hta.lecture.service.AdminService;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.web.form.ClassCriteria;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class AdminController {

	static final Logger logger = LogManager.getLogger(AdminController.class);
	
	@Autowired
	AdminService adminService;
	
	@Autowired
	ClassService classService;
	
	@GetMapping("/admin")
	public String adminPage(Model model){
		
		AdminPageDto adminPage = new AdminPageDto();
		
		adminPage.setTotalUserCount(adminService.getTotalUserCount());
		adminPage.setTotalClassCount(adminService.getTotalClassCount());
		adminPage.setTotalOrderCount(adminService.getTotalOrderCount());
		adminPage.setTotalIncome(adminService.getTotalIncome());
		adminPage.setTotalClassGradeAvr(adminService.getGradeAvr());
		adminPage.setSubmitClassCount(adminService.getSubmitClassCount());
		
		model.addAttribute("adminPage",adminPage);
		
		return "/admin/adminPage";
	}
	
	@GetMapping("/admin/classList")
	public String adminClassList(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			ClassCriteria criteria, Model model) {

		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteria);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int totalRecords = classService.getTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		ClassPagination pagination = new ClassPagination(page, totalRecords);
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		logger.info("검색조건 및 값 :" + criteria);

		// 검색조건(value)과 조회범위(beginIndex, endIndex)가 포함된 Criteria를 서비스에 전달해서 데이터 조회
		List<ClassCourseDto> classes = classService.getAllCourseInfo(criteria);
		
		model.addAttribute("classes", classes);		
		model.addAttribute("pagination", pagination);
		
		return "/admin/classList"; // classList.jsp
	}
	
	
}
