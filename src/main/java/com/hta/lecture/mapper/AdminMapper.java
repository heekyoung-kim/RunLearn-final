package com.hta.lecture.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.AdminBoardDto;
import com.hta.lecture.dto.AdminClassDto;
import com.hta.lecture.dto.AdminReviewDto;
import com.hta.lecture.dto.AdminUserDto;
import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.CouponPosessUserDto;
import com.hta.lecture.dto.MonthIncomeDto;
import com.hta.lecture.dto.ReviewDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.vo.Coupon;
import com.hta.lecture.web.form.ClassCriteria;
import com.hta.lecture.web.form.CouponCriteria;
import com.hta.lecture.web.form.Criteria;
import com.hta.lecture.web.form.UserCouponCriteria;

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
	//  중지 된 강의의 수
	int getStopClassCount();
	
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
	
	List<CouponDto> getAllCoupon(CouponCriteria criteria);
	int getCouponTotalRows (CouponCriteria criteria);
	
	List<AdminClassDto> getAdminClass(Criteria criteria);
	int getClassTotalRows (Criteria criteria);
	
	List<AdminUserDto> getAdminUser(Criteria criteria);
	int getUserTotalRows (Criteria criteria);
	
	List<AdminReviewDto> getAdminReview(Criteria criteria);
	int getReviewTotalRows (Criteria criteria);
	
	List<CouponPosessUserDto> getCouponPosessUsers(UserCouponCriteria userCriteria);
	int getCouponUsersTotalRows(UserCouponCriteria userCriteria);
	
	void addCoupon(Coupon coupon);
	void deleteCoupon(int couponNo);
	
	void addUserCoupon(int userNo,int couponNo);
	void deleteUserCoupon(int userNo, int couponNo);
	
	void openClass(int classNo);
	void stopClass(int classNo);
	
	void restoreUser(int userNo);
	void deleteUser(int userNo);
	
	void deleteReview(int reviewNo);
	
	List<AdminBoardDto> getNoAnswerList();
	int getNoAnswerCount();
}
