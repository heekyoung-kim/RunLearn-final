package com.hta.lecture.web.form;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UserCouponCriteria {
	
	private int page;
	private String userCouponOpt;
	private String userCouponValue;
	private int beginIndex;
	private int endIndex;

}
