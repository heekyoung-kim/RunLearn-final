package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.web.form.Criteria;

@Service
public class ClassService {

	static final Logger logger = LogManager.getLogger(ClassService.class);
	
	@Autowired
	private ClassMapper classMapper;
	
	public int getTotalRows(Criteria criteria) {
		logger.info("검색조건: " + criteria);
		return classMapper.getClassesTotalRows(criteria);
	}
	
	public List<ClassCourseDto> getAllCourseInfo(Criteria criteria){
		List<ClassCourseDto> classCourse = classMapper.getAllCourseInfo(criteria);
		return classCourse;
	}
	
	public List<Classes> getClassSearch(Criteria criteria){
		List<Classes> classSearch = classMapper.getClassSearch(criteria);
		
		return classSearch;
	}
	
	public int getClassesTotalRows(Criteria criteria) {
		return classMapper.getClassesTotalRows(criteria);
	}
	
	public Classes getClassDetail(int no) {
		return classMapper.getClassDetail(no);
	}
	
	public int countAllClassStudent(int no) {
		return classMapper.countAllClassStudent(no);
	}
}
