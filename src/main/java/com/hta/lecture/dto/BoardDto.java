package com.hta.lecture.dto;

import java.util.Date;
import java.util.List;

import com.hta.lecture.vo.Tag;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
	
	@Builder
	@AllArgsConstructor
	@NoArgsConstructor
	@ToString
	@Setter
	@Getter
	public class BoardDto {
		private int boardNo;
		private int userNo;
		private String category;
		private String title;
		private String name;
		private String content;
		private String commentContent;
		private String classTitle;
		private String status;		
		private Date createdDate;
		private int likeCnt;
		private int commentCnt;
		private List<String> tagName;
	
	}	
	
	
	
	
	
	


