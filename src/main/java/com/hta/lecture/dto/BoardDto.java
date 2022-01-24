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
	public class BoardDto {
		
		private String category;
		private String title;
		private String name;
		private String content;
		private String resolveStatus;
		private String recruitmentStatus;		
		private Date registrationDate;
		private int likeCnt;
		private int commentCnt;
		private String tagName;
	
	}	
	
	
	
	
	
	


