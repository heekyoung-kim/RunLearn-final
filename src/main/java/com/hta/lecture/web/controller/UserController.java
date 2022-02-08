package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.service.UserCouponService;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	UserCouponService userCouponService;
	
	@GetMapping("/dashboard")
	public String studentMyPage() {
		return "student-mypage/home/dashboard";
	}
	
	@GetMapping("/wishlist")
	public String wishlist() {
		return "student-mypage/myclass/wishlist";
	}
	
	@GetMapping("/couponBox")
	public String couponBox(Model model) {
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		List<UserCouponDto> coupons = userCouponService.getUserCouponsByUserNo(user.getNo());
		int totalUseCoupons = 0;
		int totalNotUseCoupons = 0;

		// 사용가능 / 사용완료 총 개수.
		for(UserCouponDto coupon : coupons ){
			if(coupon.getUseStatus() == "Y") {
				totalUseCoupons++;
			}else {
				totalNotUseCoupons++;
			}
		}
		
		model.addAttribute("totalNotUseCoupons", totalNotUseCoupons);
		model.addAttribute("totalUseCoupons", totalUseCoupons);
		model.addAttribute("coupons", coupons);
		return "student-mypage/myclass/coupons";
	}
	
	@GetMapping("/point")
	public String point() {
		return "student-mypage/myclass/my-points";
	}
	
	@GetMapping("/orders")
	public String orders() {
		return "student-mypage/myclass/orders";
	}
	

	
}
 