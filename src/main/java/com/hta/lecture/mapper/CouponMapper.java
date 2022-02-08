package com.hta.lecture.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Coupon;

@Mapper
public interface CouponMapper {
	
	void couponDelete(int couponNo); // 쿠폰삭제
	Coupon getCoupon(int couponNo);  // 쿠폰 조회.
	
}
 