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
public class User{

	private int no;
	private String email;
	private String orignPwd; //비밀번호변경시 현재비밀번호 확인용.
	private String password;
	private String name;
	private String tel;
	private int point;
	private String intro;
	private String img; 
	private String loginType;
	private String teacherStatus;
	private String managerStatus;
	private String deletedStatus;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date updatedDate;

}
