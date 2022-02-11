package com.hta.lecture.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

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
public class Board {

	private int boardNo;
	private String category;
	private String title;
	private String content;
	private String status;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date updateDate;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date deleteDate;
	private int boardLikeCnt;
	private int commentCnt;
	private int classNo;
	private int userNo;
}
