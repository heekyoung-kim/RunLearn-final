package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.vo.Category;
import com.hta.lecture.vo.ClassChapter;
import com.hta.lecture.vo.ClassDetail;
import com.hta.lecture.vo.ClassFiles;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.ClassCriteria;

@Mapper
public interface ClassMapper {
	
	List<ClassCourseDto> getAllCourseInfo(ClassCriteria criteria);
	
	List<ClassDetailDto> getClassSearch(ClassCriteria criteria);
	
	ClassesDto getClassDetail(int no);
	
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
	
	// 강사번호를 가져옴
	Classes getTeacherByNo(int teacherNo);
  
	// 회원번호로 해당 회원(지식공유자)의 전체 강의 정보를 조회
	List<ClassesDto> getAllClassByNo(int no);
    
	// 회원번호로 해당 회원(지식공유자)의 강사번호를 조회
	int getTeacherNoByUserNo(int no);
	
	// 강의만들기
	void insertClass(Classes classes);
	// 첨부파일 
	void insertClassFile(ClassFiles classFiles);
	List<ClassFiles> getClassFilesByClassNo(int No);

	// 섹션만들기
	void insertChapter(ClassChapter classChpater);
	
	// 커리큘럼 만들기
	void insertDetail(ClassDetail classDetail);
	
	// 강의번호로 섹션값 가져오기
	int getChapterByClassNo(int no);
	
	// 챕터번호로 디테일값 가져오기
	int getChapterDetailByNo(int chapterNo);

	// 회원번호로 해당 회원이 수강하는 모든 강의 조회
	List<Classes> getAllClassToStudentByUserNo(int no);
	
	List<ClassesDto> getAllCourseData();
	
}
