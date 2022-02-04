package com.hta.lecture.vo;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class UserCoupon {

	private int userCouponNo;
	private int couponNo;
	private String useStatus;
	private Date useDate;
	private String periodStatus; 
	private Date pubDate;

}
