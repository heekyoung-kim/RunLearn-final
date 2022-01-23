package com.hta.lecture.service;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.exception.LoginErrorException;
import com.hta.lecture.mapper.UserMapper;
import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.UserRegisterForm;

@Service
@Transactional
public class UserService {
	
	@Autowired
	private UserMapper userMapper;
	
	// 카카오 로그인
	public User loginWithKakao(User user) {
		User savedUser = userMapper.getUserByEmail(user.getEmail());
		if(savedUser == null) {
			userMapper.addUser(user);
		}
		return savedUser;
	}
	// 일반 로그인
	public User login(String email, String password) {
		User savedUser = userMapper.getUserByEmail(email);
		if(savedUser == null) {
			throw new RuntimeException("아이디를 확인해주세요.");
		}
		if(!"NORMAL".equals(savedUser.getLoginType())) {
			throw new RuntimeException("사이트에 가입된 사용자가 아닙니다.");
		}
		if("Y".equals(savedUser.getDeletedStatus())) {
			throw new RuntimeException("탈퇴처리된 회원아이디입니다.");
		}
		if(!password.equals(savedUser.getPassword())) {
			throw new RuntimeException("비밀번호가 일치하지 않습니다.");
		}
		return savedUser;
	}
	// 일반 회원가입
	public User registerUser(User user) {
		// 기존에 가입된 정보인지 확인.
		User usercheck = userMapper.getUserByEmail(user.getEmail());
		if(usercheck != null) {
			throw new RuntimeException("이미 가입한 이메일입니다.");
		}
		if(user.getTel().equals(usercheck.getTel())) {
			throw new RuntimeException("이미 존재하는 전화번호입니다.");
		}
		userMapper.addUser(user);
		
		return user;
	}
	// 회원정보 수정
	public void updateUser(User user) {
		User usercheck = userMapper.getUserByEmail(user.getEmail());
		if(usercheck != null) {
			throw new RuntimeException("이미 가입한 이메일입니다.");
		}
		userMapper.updateUser(user);
	}
}
