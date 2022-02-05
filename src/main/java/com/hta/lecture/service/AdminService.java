package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.ReviewDto;
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
	
	
	// 개설 제출된 강의의 수
	public int getSubmitClassCount(){
		return  adminMapper.getSubmitClassCount();
	}
	
	// 강의 수익 합을 가져온다
	public int getTotalIncome(){
		int total=0;
		List<ClassListDto> categoryList = adminMapper.getAllClass();
		
		for(ClassListDto classes : categoryList) {
			total+=classes.getIncome();
		}
		
		return total;
	}
	
	
	// 강의 평점 평균을 가져온다
	public double getGradeAvr() {
		
		int avr = 0;
		List<ReviewDto> reviewList = adminMapper.getTotalReview();
		int reviewCount = adminMapper.getTotalReviewCount();
		
		for(ReviewDto reviews : reviewList) {
			avr+= Integer.parseInt(reviews.getGrade());
		}
		return (double)avr/reviewCount;
	}

	
}
