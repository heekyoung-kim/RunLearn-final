package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.vo.Category;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.ClassCriteria;

@Mapper
public interface ClassMapper {
	
	List<ClassCourseDto> getAllCourseInfo(ClassCriteria criteria);
	
	List<ClassDetailDto> getClassSearch(ClassCriteria criteria);
	
	Classes getClassDetail(int no);
	
	int getClassesTotalRows(ClassCriteria criteria);
	
	// 모든 카테고리 리스트를 불러옴
	List<Category> getAllClassCategories();
	
	// 최상위 카테고리 리스트를 불러옴
	List<Category> getTopClassCategories();
	
	// 카테고리 번호로 카테고리 리스트 정보를 조회(계층형 메뉴 관련)
	List<Category> getAllSubCategories(int no);
	
	// 카테고리 번호로 해당 카테고리 전체 강의상세정보를 조회
	List<ClassDetailDto> getClassByCategory(String category);
	
	// 회원번호로 해당 지식공유자가 게시한 강의 수를 확인
	int getClassCountByNo(int no);
	
	// 강의를 수강하는 학생의 숫자를 가져옴
	int countAllClassStudent(int no);
	
	List<Classes> getAllClassByNo(int no);
	
}
