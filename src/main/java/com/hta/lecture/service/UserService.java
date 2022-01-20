package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.exception.LoginErrorException;
import com.hta.lecture.mapper.UserMapper;
import com.hta.lecture.vo.User;

//Transactional
@Service
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	public User login(String email, String password) {
		User user = userMapper.getUserByEmail(email);
		if(user == null) {
			throw new LoginErrorException("회원정보가 존재하지 않습니다.");
		}
		if("Y".equals(user.getDeletedStatus())) {
			throw new LoginErrorException("탈퇴처리된 회원아이디입니다.");
		}
		if(!password.equals(user.getPassword())) {
			throw new LoginErrorException("비밀번호가 일치하지 않습니다.");
		}
		return user;
	}
}
