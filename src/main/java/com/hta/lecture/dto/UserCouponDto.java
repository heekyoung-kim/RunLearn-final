package com.hta.lecture.dto;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter
public class UserCouponDto {

	private int userCouponNo;
	private int userNo;
	private int couponNo;
	private int usePeriod;
	private String couponName;
	private int discountRate;
	private int discountPrice;
	private String useStatus;
	private Date useDate;
	private String periodStatus; 
	@JsonFormat(pattern = "yyyy년 M월 d일 HH:mm:ss")
	private Date pubDate;
	@JsonFormat(pattern = "yyyy년 M월 d일 HH:mm:ss")	
	private Date periodDate;
	
	// 남은 유효기간.
	public long getRemainDate() {
		Date period = this.getPeriodDate(); // 유효기간
		Date now = new Date(); // 현재날짜
		long remainDate; // 남은기간
		
		if(period.getTime() < now.getTime()) {
			remainDate = 0;
		}
		remainDate = (period.getTime() - now.getTime())/(24*60*60*1000); // 일수 계산.
		return remainDate;
	}
}


