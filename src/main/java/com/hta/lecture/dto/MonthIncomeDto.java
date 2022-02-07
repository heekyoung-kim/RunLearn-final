package com.hta.lecture.dto;

import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class MonthIncomeDto {
	
	private String payMonth; 
	private int totalPrice;

}
