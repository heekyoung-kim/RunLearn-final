package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.mapper.TeacherMapper;
import com.hta.lecture.mapper.UserMapper;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Teacher;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@Transactional
public class TeacherService {
	
	@Autowired
	TeacherMapper teacherMapper;

	@Autowired
	UserMapper userMapper;
	
	// 강사등록.
	public void insertTeacher(Teacher teacher) {
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		// 강사정보 등록.
		teacher.setUserNo(user.getNo());
		teacherMapper.insertTeacher(teacher);
		
		// 강사여부 변경
		user.setTeacherStatus("Y");
		userMapper.updateUser(user);
	
	}
	
}
