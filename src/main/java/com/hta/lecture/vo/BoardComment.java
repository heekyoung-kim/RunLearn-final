package com.hta.lecture.vo;

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
public class BoardComment {
	private int commentNo;
	private int commentSubNo;
	private String commentContent;
	private Date registrationDate;
	private int commentLikeCnt;
	private int commentCnt;
	private int boardNo;
	private int userNo;	
}
