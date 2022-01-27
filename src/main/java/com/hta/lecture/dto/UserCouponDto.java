package com.hta.lecture.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter
public class UserCouponDto {

	private int userCouponNo;
	private int couponNo;
	private String useStatus;
	private Date useDate;
	private String periodStatus;
	private Date pubDate;
}


