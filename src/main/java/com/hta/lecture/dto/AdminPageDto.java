package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class AdminPageDto {
	
	private int totalIncome;
	
	private int totalClassCount;
	private double totalClassGradeAvr;
	
	private int thisMonthTotalIncome;
	private int totalIncomeByCategory;
	
	private int totalClassRate;
	private int classRateBySection;
	
	private int totalUserCount;
	
	private int totalOrderCount;
	
	private int submitClassCount;
}
