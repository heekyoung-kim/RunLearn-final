package com.hta.lecture.dto;

import java.util.Date;
import java.util.List;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.hta.lecture.vo.BoardComment;
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
public class BoardDetailDto {
	private int boardNo;
	private String title;
	private String name;
	private String content;
	private String status;	
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	private int classNo;
	private String classTitle;
	private int boardLikeCnt;
	private int commentLikeCnt;
	private List<BoardComment> comments;
	private Date registrationDate;
	private List<Tag> tags;

}
