package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.mapper.AdminMapper;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.vo.Category;

@Service
public class AdminService {

	static final Logger logger = LogManager.getLogger(ClassService.class);
	
	@Autowired
	private AdminMapper adminMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	// 총 강의 수
	public int getTotalClassCount() {
		return adminMapper.getTotalClassCount();
	}
	
	// 총 유저 수
	public int getTotalUserCount() {
		return adminMapper.getTotalUserCount();
	}
	
	// 총 주문 결제 건수 
	public int getTotalOrderCount() {
		return adminMapper.getTotalOrderCount();
	}
	

	public int getTotalClassGrade() {
		return adminMapper.getTotalClassGrade();
	}
	

	// 강의 전체 리스트를 가져온다
	public List<ClassListDto> getAllClass(){
		List<ClassListDto> categoryList = classMapper.getAllClass();
		return categoryList;
	}
	
	// 강의 전체 리스트를 가져온다
	public int getIncomeAvr(){
		int avr=0;
		List<ClassListDto> categoryList = classMapper.getAllClass();
		
		for(ClassListDto classes : categoryList) {
			avr+=classes.getIncome();
		}
		
		return avr;
	}

	
}
