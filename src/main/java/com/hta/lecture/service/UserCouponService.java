package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.mapper.UserCouponMapper;
import com.hta.lecture.vo.UserCoupon;

@Service
@Transactional
public class UserCouponService {

	@Autowired
	private UserCouponMapper userCouponMapper;
	
	// 쿠폰추가.
	public void addCouponByUserNoUserCoupon(UserCoupon userCoupon) {
		userCouponMapper.addCoupon(userCoupon);
	}
	
	// 쿠폰조회
	public List<UserCouponDto> getUserCouponsByUserNo(int userNo){
		
		List<UserCouponDto> coupons = userCouponMapper.getCouponByUserNo(userNo);
		
		return coupons;
	}

	// 쿠폰 사용여부 수정.
	public void updateUseCoupon(UserCoupon userCoupon) {
		userCouponMapper.updateUseCouponStatus(userCoupon);
	}
	
	// 총 보유쿠폰갯수조회
	public int totalCouponCntByUserNo(int userNo) {
		int totalCoupon = userCouponMapper.totalCouponCntByUserNo(userNo);
		return totalCoupon;
	}
	
}
