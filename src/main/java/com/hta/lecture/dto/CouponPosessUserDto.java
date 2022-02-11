package com.hta.lecture.dto;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class CouponPosessUserDto {

	private int userNo;
	private String userName;
	private String userEmail;
	private List<UserCouponDto> couponList;
}
