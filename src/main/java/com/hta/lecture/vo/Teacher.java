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
	private String email;
	private String name;
	private String tel;
	private String hopeCategory;
	private String intro;
	private String introLink;
	private int income;
	private String img;
}
