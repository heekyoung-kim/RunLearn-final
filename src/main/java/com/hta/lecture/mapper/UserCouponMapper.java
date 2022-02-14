package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.vo.UserCoupon;

@Mapper
public interface UserCouponMapper {

	void addCoupon(UserCoupon userCoupon);  // 쿠폰 추가.
	List<UserCouponDto> getCouponByUserNo(int no);		// 보유쿠폰조회
	void updateUseCouponStatus(UserCoupon userCoupon);  // 쿠폰사용.
	int totalUseCouponCntByUserNo(int no); // 총 보유쿠폰갯수 조회
	int totalNoUseCouponCntByUserNo(int no); // 총 보유쿠폰갯수 조회
}
