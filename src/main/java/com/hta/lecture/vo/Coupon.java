package com.hta.lecture.vo;


import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
public class Coupon {

	private int couponNo;
	private String name;
	private int discountRate;
	private int discountPrice;
	@JsonFormat(pattern = "yyyy년 M월 d일")	
	private int period; 
}
