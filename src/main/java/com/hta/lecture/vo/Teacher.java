package com.hta.lecture.vo;

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
public class Teacher {

	private int no;
	private int userNo;
	private String teacherEmail;
	private String teacherName;
	private String teacherTel;
	private String hopeCategory;
	private String teacherIntro;
	private String introLink;
	private int income;
	private String img;
}
