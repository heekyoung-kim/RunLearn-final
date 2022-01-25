package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.vo.Category;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.Criteria;

@Mapper
public interface ClassMapper {
	
	List<ClassCourseDto> getAllCourseInfo(Criteria criteria);
	
	List<Classes> getClassSearch(Criteria criteria);
	
	Classes getClassDetail(int no);
	
	int getClassesTotalRows(Criteria criteria);
	
	// 카테고리 리스트를 불러옴
	List<Category> getAllClassCategories();
	
	// 카테고리 번호로 카테고리 정보를 조회
	List<Category> getAllSubCategories(int no);
	
	// 강의를 수강하는 학생의 숫자를 가져옴
	int countAllClassStudent(int no);
	
	
}
