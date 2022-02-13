package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class AdminReviewDto {
	
	private int no;
	private String content;
	private String grade;
	private String userName;
	private String className;
}	
