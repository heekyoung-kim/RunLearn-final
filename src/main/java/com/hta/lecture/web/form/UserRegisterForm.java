package com.hta.lecture.web.form;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class UserRegisterForm {
	
	private int no;
	private String email;
	private String name;
	private String password;
	private String tel;
	private String loginType;
	private String img;
	
}
