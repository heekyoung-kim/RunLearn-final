package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.vo.Classes;

@Mapper
public interface ClassMapper {

	List<Classes> getAllClasses();
	
	List<ClassCourseDto> getAllCourseInfo();
	
	int countAllClassStudent(int no);
}
