package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.vo.Category;
import com.hta.lecture.vo.ClassFiles;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.ClassCriteria;

@Service
public class ClassService {

	static final Logger logger = LogManager.getLogger(ClassService.class);
	
	@Autowired
	private ClassMapper classMapper;
	
	public int getTotalRows(ClassCriteria criteria) {
		logger.info("검색조건: " + criteria);
		return classMapper.getClassesTotalRows(criteria);
	}
	
	public int getClassCountByNo(int no) {
		return classMapper.getClassCountByNo(no);
	}
	
	public List<ClassCourseDto> getAllCourseInfo(ClassCriteria criteria){
		List<ClassCourseDto> classCourse = classMapper.getAllCourseInfo(criteria);
		return classCourse;
	}
	
	public List<ClassDetailDto> getClassSearch(ClassCriteria criteria){
		List<ClassDetailDto> classSearch = classMapper.getClassSearch(criteria);
		
		return classSearch;
	}
	
	public int getClassesTotalRows(ClassCriteria criteria) {
		return classMapper.getClassesTotalRows(criteria);
	}
	
	public Classes getClassDetail(int no) {
		return classMapper.getClassDetail(no);
	}
	
	// 강의 카테고리 리스트를 가져온다
	public List<Category> getAllClassCategories() {
		List<Category> categoryList = classMapper.getAllClassCategories();
				
		return categoryList;
	}
	
	// 최상위 강의 카테고리 리스트를 가져온다
	public List<Category> getTopClassCategories() {
		List<Category> categoryList = classMapper.getTopClassCategories();
		
		return categoryList;
	}
	
	public List<Category> getAllSubCategories(int no) {		
		List<Category> category = classMapper.getAllSubCategories(no); 
		return category;
	}
	
	public List<ClassDetailDto> getClassByCategory(String category) {
		List<ClassDetailDto> categoryList = classMapper.getClassByCategory(category);
		return categoryList;
	}
	
	// 강의를 수강하는 학생의 숫자를 가져온다
	public int countAllClassStudent(int no) {
		return classMapper.countAllClassStudent(no);
	}
	
	public List<Classes> getAllClassByNo(int no) {
		List<Classes> classes = classMapper.getAllClassByNo(no);
		
		return classes;
	}
	
	public int getTeacherNoByUserNo(int no) {
		return classMapper.getTeacherNoByUserNo(no);
	}
  
	// 새 강의 만들기
		public void addNewClass(Classes classes, List<ClassFiles> classFiles) {
			classMapper.insertClass(classes);
			
			for (ClassFiles files : classFiles) {
				files.setNo(classes.getNo());
				classMapper.insertClassFile(files);
			} 	
	
		}

}
