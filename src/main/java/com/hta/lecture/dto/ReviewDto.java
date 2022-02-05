package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class ReviewDto {

	private int reviewNo;
	private String content;
	private String grade;
	private int userNo;
	private int classNo;
}
