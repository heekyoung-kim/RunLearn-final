package com.hta.lecture.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class Order {
	
	private int orderNo;
	private int userNo;
	private String payUserName;
	private int sumPrice;		// 총합 
	private int discountPrice;  // 할인
	private int totalPrice;	// 최종결제금액
	private String tel;
	private String email;
	private Date orderDate;
	private int usePoint;
	private String orderStatus;
	private Date refundStauts;
	private int refundPrice;
	private int refundFee;
	private int useCouponNo; // 유저가 사용한 유저쿠폰테이블의 유저쿠폰넘버
	
}

