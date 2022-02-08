package com.hta.lecture.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Coupon {

	private int couponNo;
	private String name;
	private int discountRate;
	private int discountPrice;
	@JsonFormat(pattern = "yyyy년 M월 d일")	
	private Date period; 
}
