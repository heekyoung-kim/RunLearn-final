package com.hta.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.MonthIncomeDto;
import com.hta.lecture.dto.ReviewDto;
import com.hta.lecture.web.form.ClassCriteria;

@Mapper
public interface AdminMapper {
	
	
	// 전체 강의 수 출력
	int getTotalClassCount();
	
	// 이번달 전체 강의의 매출
	//int getThisMonthTotalIncome();
	
	
	// 수강률 기간별 학생수
	// int getClassRateBySection();
	
	
	// 전체 강의 리스트
	List<ClassListDto> getAllClass();
	
	// 전체 회원 수 출력
	int getTotalUserCount();
	
	// 전체 결제 건수 출력
	int getTotalOrderCount();
	
	// 개설 제출된 강의의 수
	int getSubmitClassCount();
	
	// 리뷰 평점
	double getAvgReview();
	
	// 총 수익
	int getTotalIncome();
	
	// 이번달 총 수익
	int getIncomeForThisMonth();
	
	// 개발 카테고리 이번달 총 수익
	String getDeveloperIncomeForThisMonth();
	
	// 보안 카테고리 이번달 총 수익
	String getSecurityIncomeForThisMonth();
	
	// 데이터 사이언스 카테고리 이번달 총 수익
	String getDataScienceIncomeForThisMonth();
	  
	List<MonthIncomeDto> getMonthIncome();
	
	// 쿠폰 총 데이터 갯수 조회
	int getCouponTotalRows();
	
	List<CouponDto> getAllCoupon();
	
	// 유저 총 데이터 갯수 조회
	//int getUsersTotalRows(ClassCriteria criteria);
	
	//List<ClassCourseDto> getAllCourseInfo(ClassCriteria criteria);
}
