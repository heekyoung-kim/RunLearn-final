package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.ReviewDto;

@Mapper
public interface AdminMapper {
	
	
	// 전체 강의 수 출력
	int getTotalClassCount();
	// 전체 강의의 평점
	int getTotalClassGrade();
	
	// 이번달 전체 강의의 매출
	//int getThisMonthTotalIncome();
	
	
	// 수강률 기간별 학생수
	// int getClassRateBySection();
	
	// 전체 리뷰수
	int getTotalReviewCount();
	
	// 전체 강의 리스트
	List<ClassListDto> getAllClass();
	
	List<ReviewDto> getTotalReview();
	
	// 전체 회원 수 출력
	int getTotalUserCount();
	
	// 전체 결제 건수 출력
	int getTotalOrderCount();
	
	// 개설 제출된 강의의 수
	int getSubmitClassCount();
}
