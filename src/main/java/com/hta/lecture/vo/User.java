package com.hta.lecture.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
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
public class User {

	private int no;
	private String email;
	private String password;
	private String name;
	private String tel;
	private int point;
	private String intro;
	private String img;
	private String teacherStatus;
	private String managerStatus;
	private String deletedStatus;
	private Date createdDate;
	private Date deletedDate;
}
