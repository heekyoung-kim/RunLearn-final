package com.hta.lecture.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Board;

@Mapper
public interface BoardMapper {

	Board getBoardListByCategory(String category);
	
}
