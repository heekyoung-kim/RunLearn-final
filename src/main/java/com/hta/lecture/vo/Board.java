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
public class Board {

	private int boardNo;
	private String category;
	private String title;
	private String content;
	private String status;
	private Date registrationDate;
	private Date updateDate;
	private Date deleteDate;
	private int likeCnt;
	private int commentCnt;
}
