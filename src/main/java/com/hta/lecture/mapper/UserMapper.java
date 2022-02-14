package com.hta.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.UserRegisterForm;

@Mapper
public interface UserMapper {

	//User getUser(Map<String, Object> map);
	User getUserByNo(int no);				// 회원번호로 유저정보 조회.
	User getUserByEmail(String email);		// 회원가입시 이메일 중복조회
	User getUserByTel(String tel);			// 회원가입시 tel중복 조회
	void addUser(User user);				// 회원가입
	void updateUser(User user);				// 회원정보 수정, 회원 탈퇴여부수정(탈퇴처리)
	
}
 