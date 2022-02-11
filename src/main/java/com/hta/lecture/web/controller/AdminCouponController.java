package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.CouponPagination;
import com.hta.lecture.dto.CouponPosessUserDto;
import com.hta.lecture.dto.UserCouponPagination;
import com.hta.lecture.service.AdminService;
import com.hta.lecture.web.form.CouponCriteria;
import com.hta.lecture.web.form.UserCouponCriteria;

@Controller
public class AdminCouponController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/admin/coupon")
	public String adminCouponList(@RequestParam(name = "couponPage", required = false, defaultValue = "1") int couponPage,
			@RequestParam(name = "userCouponPage", required = false, defaultValue = "1") int userCouponPage,
			CouponCriteria criteria, UserCouponCriteria userCriteria, Model model) {
		
		
		int couponRecords = adminService.getCouponTotalRows(criteria);
		CouponPagination couponPagination = new CouponPagination(couponPage,couponRecords);
		
		int userCouponRecords = adminService.getCouponUsersTotalRows(userCriteria);
		UserCouponPagination userCouponPagination = new UserCouponPagination(userCouponPage,userCouponRecords);
		
		criteria.setBeginIndex(couponPagination.getBegin());
		criteria.setEndIndex(couponPagination.getEnd());
		
		userCriteria.setBeginIndex(userCouponPagination.getBegin());
		userCriteria.setEndIndex(userCouponPagination.getEnd());
		
		List<CouponDto> coupons = adminService.getAllCoupon(criteria);
		List<CouponPosessUserDto> couponPosessUser = adminService.getCouponPosessUserList(userCriteria);
		
		model.addAttribute("coupons", coupons);
		model.addAttribute("couponPagination", couponPagination);
		model.addAttribute("couponUsers", couponPosessUser);		
		model.addAttribute("userCouponPagination", userCouponPagination);		
		
		return "/admin/adminCoupon"; 
	}

}
