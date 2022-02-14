package com.hta.lecture.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class AdminClassDto {
	
	private int no;
	private String image;
	private String title;
	private String teacher;
	private int price;
	private int income;
	private int student;
	private String status;
	private int reviewScore;
}
