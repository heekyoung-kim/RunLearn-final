package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class CouponDto {

	private int couponNo;
	private String couponName;
	private int	discountRate;
	private int	discountPrice;
	private int couponPeriod;
	
}
