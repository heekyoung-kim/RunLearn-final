package com.hta.lecture.vo;

import java.util.Date;

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
public class UserCoupon {

	private int userCouponNo;
	private int userNo;
	private int couponNo;
	private String useStatus;
	private Date useDate;
	private String periodStatus; 
	private Date pubDate;
	private Date periodDate;

}
