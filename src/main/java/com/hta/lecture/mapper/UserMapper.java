package com.hta.lecture.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.UserRegisterForm;

@Mapper
public interface UserMapper {

	//User getUser(Map<String, Object> map);
	User getUserByNo(int no);
	User getUserByEmail(String email);
	User getUserByTel(String tel);
	void addUser(User user);
	void updateUser(User user);
}
 