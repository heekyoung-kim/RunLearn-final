package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.User;

@Mapper
public interface BookMapper {
	
	List<User> getAllBooks();
}
