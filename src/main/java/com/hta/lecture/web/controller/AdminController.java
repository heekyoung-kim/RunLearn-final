package com.hta.lecture.web.controller;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.dto.AdminBoardDto;
import com.hta.lecture.dto.AdminClassDto;
import com.hta.lecture.dto.AdminPageDto;
import com.hta.lecture.dto.AdminReviewDto;
import com.hta.lecture.dto.AdminUserDto;
import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassPagination;
import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.CouponPagination;
import com.hta.lecture.dto.CouponPosessUserDto;
import com.hta.lecture.dto.MonthIncomeDto;
import com.hta.lecture.dto.Pagination;
import com.hta.lecture.dto.UserCouponPagination;
import com.hta.lecture.service.AdminService;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.web.form.ClassCriteria;
import com.hta.lecture.web.form.CouponCriteria;
import com.hta.lecture.web.form.Criteria;
import com.hta.lecture.web.form.UserCouponCriteria;



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
		adminPage.setStopClassCount(adminService.getStopClassCount());
		
		adminPage.setGetIncomeForThisMonth(adminService.getIncomeForThisMonth());

		adminPage.setDeveloperIncomeForThisMonth(adminService.getDeveloperIncomeForThisMonth());
		adminPage.setSecurityIncomeForThisMonth(adminService.getSecurityIncomeForThisMonth());
		adminPage.setDataScienceIncomeForThisMonth(adminService.getDataScienceIncomeForThisMonth());
		adminPage.setNoAnswerCount(adminService.getNoAnswerCount());
		
		List<AdminBoardDto> noAnswer = adminService.getNoAnswerList();
		
		model.addAttribute("adminPage",adminPage);
		model.addAttribute("noAnswer",noAnswer);
		
		return "/admin/adminPage";
	}
	
	
	
	@GetMapping("/admin/adminClass")
	public String adminClassList(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			Criteria criteria, Model model) {

		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int classRecords = adminService.getClassTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page,classRecords);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<AdminClassDto> classes = adminService.getAdminClass(criteria);
		
		model.addAttribute("classes", classes);		
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", criteria);
		
		return "/admin/adminClass";	
		}
	
	@GetMapping("/admin/adminUser")
	public String adminUserList(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			Criteria criteria, Model model) {
		
		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteria);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int userRecords = adminService.getUserTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page,userRecords);
		
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		// 요청한 페이지에 대한 조회범위를 criteria에 저장
		logger.info("검색조건 및 값 :" + criteria);
		
		List<AdminUserDto> users = adminService.getAdminUser(criteria);
		
		model.addAttribute("users", users);		
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", criteria);
		
		return "/admin/adminUser"; // 
	}
	
	@GetMapping("/admin/adminReview")
	public String adminReviewList(@RequestParam(name = "page", required = false, defaultValue = "1") int page,
			Criteria criteria, Model model) {
		
		logger.info("요청 페이지번호 : " + page);
		logger.info("검색조건 및 값 :" + criteria);
		
		// 검색조건에 해당하는 총 데이터 갯수 조회
		int reviewRecords = adminService.getClassTotalRows(criteria);
		// 현재 페이지번호와 총 데이터 갯수를 전달해서 페이징 처리에 필요한 정보를 제공하는 Pagination객체 생성
		Pagination pagination = new Pagination(page,reviewRecords);
				
		criteria.setBeginIndex(pagination.getBegin());
		criteria.setEndIndex(pagination.getEnd());
		
		List<AdminReviewDto> reviews = adminService.getAdminReview(criteria);
		
		model.addAttribute("reviews", reviews);	
		model.addAttribute("pagination", pagination);
		model.addAttribute("criteria", criteria);
		
		return "/admin/adminReview"; // 
	}
	
	
	
}
