package com.hta.lecture.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.AdminService;
import com.hta.lecture.vo.Coupon;

@RestController
@RequestMapping("/rest")
public class CouponRestController {
	
	@Autowired
	private AdminService adminService;

	@PostMapping("/addCoupon")
	public ResponseDto<?> addCoupon(CouponDto coupon) {
		
		ResponseDto<?> response = new ResponseDto<>();
		try {
			
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}

	}
}
