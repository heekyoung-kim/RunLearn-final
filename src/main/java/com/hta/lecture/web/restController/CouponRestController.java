package com.hta.lecture.web.restController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.service.AdminService;
import com.hta.lecture.vo.Coupon;

@RestController
@RequestMapping("/rest")
public class CouponRestController {
	
	@Autowired
	private AdminService adminService;

	@PostMapping("/addCoupon")
	public ResponseDto<?> addCoupon(Coupon coupon) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
				coupon = Coupon.builder()
				.name(coupon.getName())
				.discountRate(coupon.getDiscountRate())
				.discountPrice(coupon.getDiscountPrice())
				.period(coupon.getPeriod())
				.build();
				
		try {
			adminService.addCoupon(coupon);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/deleteCoupon")
	public ResponseDto<?> deleteCoupon(int couponNo) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		try {
			adminService.deleteCoupon(couponNo);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/addUserCoupon")
	public ResponseDto<?> addUserCoupon(@RequestParam(name ="userNo") String userNo,
			@RequestParam(name = "couponNo") int couponNo) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		UserCouponDto userCoupon= new UserCouponDto();
		String[] userNoList = userNo.split(" ");
		
		
		try {
			for(String userNos : userNoList) {
				userCoupon.setUserNo(Integer.parseInt(userNos));
				userCoupon.setCouponNo(couponNo);
				adminService.addUserCoupon(userCoupon);
			}
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/deleteUserCoupon")
	public ResponseDto<?> deleteUserCoupon(@RequestParam(name ="userCoupon") String userCoupon) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		String[] userCouponList = userCoupon.split(" ");
		
		
		try {
			
			for(String userCoupons : userCouponList) {
			
				String[] userCouponDetail = userCoupons.split(",");
				adminService.deleteUserCoupon(Integer.parseInt(userCouponDetail[0]), Integer.parseInt(userCouponDetail[1]));
			}
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	
}
