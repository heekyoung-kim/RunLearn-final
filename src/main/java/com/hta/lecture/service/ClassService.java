package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.vo.Classes;

@Service
public class ClassService {

	static final Logger logger = LogManager.getLogger(BookService.class);
	
	@Autowired
	private ClassMapper classMapper;
	
	public List<Classes> getAllClasses(){
		List<Classes> classes = classMapper.getAllClasses();
		return classes;
	}
	
	public List<ClassCourseDto> getAllCourseInfo(){
		List<ClassCourseDto> classCourse = classMapper.getAllCourseInfo();
		return classCourse;
	}
	
	public int countAllClassStudent(int no) {
		return classMapper.countAllClassStudent(no);
	}
}
