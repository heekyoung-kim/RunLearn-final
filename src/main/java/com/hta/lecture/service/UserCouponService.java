package com.hta.lecture.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.mapper.CouponMapper;
import com.hta.lecture.mapper.UserCouponMapper;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Coupon;
import com.hta.lecture.vo.User;
import com.hta.lecture.vo.UserCoupon;

@Service
@Transactional
public class UserCouponService {

	@Autowired
	private UserCouponMapper userCouponMapper;
	
	@Autowired
	private CouponMapper couponMapper;
	
	
	// 쿠폰추가.
	public void addCouponByUserNoUserCoupon(int couponNo, int userNo) {
		
		//쿠폰정보 조회
		Coupon coupon = couponMapper.getCoupon(couponNo);
		int couponPeriod = coupon.getPeriod();
		
		// 만료일자 구하기.
		Date now = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(now);
		cal.add(Calendar.DATE, couponPeriod); // 현재 날짜에 만료기한(일) 더하기.
		
		Date period = cal.getTime();
		
		// 만료기한, 쿠폰번호, 유저번호 저장.
		UserCoupon userCoupon = UserCoupon.builder()
								.userCouponNo(couponNo)
								.periodDate(period)
								.userNo(userNo)
								.build();
		// insert
		userCouponMapper.addCoupon(userCoupon);
	}
	
	// 쿠폰조회
	public List<UserCouponDto> getUserCouponsByUserNo(int userNo){
		
		List<UserCouponDto> coupons = userCouponMapper.getCouponByUserNo(userNo);
		
		return coupons;
	}

	// 쿠폰 사용여부 수정.
	public void updateUseCouponStatues(UserCoupon userCoupon) {
		userCouponMapper.updateUseCouponStatus(userCoupon);
	}
	
	// 총 보유쿠폰갯수조회
	public int totalUseCouponCntByUserNo(int userNo) {
		int totalUseCoupon = userCouponMapper.totalUseCouponCntByUserNo(userNo);
		return totalUseCoupon;
	}
	
	public int totalNoUseCouponCntByUserNo(int userNo) {
		int totalNoUseCoupon = userCouponMapper.totalNoUseCouponCntByUserNo(userNo);
		return totalNoUseCoupon;
	}
	
}