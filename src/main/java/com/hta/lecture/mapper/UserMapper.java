package com.hta.lecture.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.User;

@Mapper
public interface UserMapper {

	//User getUser(Map<String, Object> map);
	//User getUserByNo(int no);
	User getUserByEmail(String email);
	//void updateUser(User user);
}
