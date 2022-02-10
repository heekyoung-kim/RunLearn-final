package com.hta.lecture.web.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class CouponCriteria {
	
	private int page;
	private String couponOpt;
	private String couponValue;
	private int beginIndex;
	private int endIndex;
}
