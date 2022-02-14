package com.hta.lecture.dto;

import org.springframework.beans.factory.annotation.Autowired;

import com.hta.lecture.web.form.ProfitByCategory;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class AdminPageDto {
	
	private String developerIncomeForThisMonth; 
	private String securityIncomeForThisMonth; 
	private String dataScienceIncomeForThisMonth;
	
	private int totalIncome;
	private int getIncomeForThisMonth;
	
	private int totalClassCount;
	private double totalClassGradeAvr;
	
	private int thisMonthTotalIncome;
	private int totalIncomeByCategory;
	
	private int totalClassRate;
	private int classRateBySection;
	
	private int totalUserCount;
	
	private int totalOrderCount;
	
	private int submitClassCount;
	private int stopClassCount;
	
	private int noAnswerCount;
}
