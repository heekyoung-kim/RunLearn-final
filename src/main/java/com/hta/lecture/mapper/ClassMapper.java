package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.Criteria;

@Mapper
public interface ClassMapper {
	
	List<ClassCourseDto> getAllCourseInfo(Criteria criteria);
	
	List<Classes> getClassSearch(Criteria criteria);
	
	Classes getClassDetail(int no);
	
	int getClassesTotalRows(Criteria criteria);
	
	int countAllClassStudent(int no);
	
	
}
