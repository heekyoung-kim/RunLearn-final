package com.hta.lecture.vo;

import java.util.Date;

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
public class Payment {
	private int orderNo;
	private String payCode;
	private String paymentClassName;
	private String payMathod;
	private Date paymentDate;
}
