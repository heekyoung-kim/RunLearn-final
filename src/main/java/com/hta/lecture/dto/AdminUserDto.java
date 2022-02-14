package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class AdminUserDto {

	private int no;
	private String name;
	private String tel;
	private String createdDate;
	private String updatedDate;
	private int point; 
	private String teacherYN;
	private String deletedYN;
}
