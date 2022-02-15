package com.hta.lecture.service;

import java.util.Iterator;
import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.AdminBoardDto;
import com.hta.lecture.dto.AdminClassDto;
import com.hta.lecture.dto.AdminPageDto;
import com.hta.lecture.dto.AdminReviewDto;
import com.hta.lecture.dto.AdminUserDto;
import com.hta.lecture.dto.ClassDetailDto;
import com.hta.lecture.dto.ClassListDto;
import com.hta.lecture.dto.CouponDto;
import com.hta.lecture.dto.CouponPosessUserDto;
import com.hta.lecture.dto.MonthIncomeDto;
import com.hta.lecture.dto.ReviewDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.mapper.AdminMapper;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.mapper.UserCouponMapper;
import com.hta.lecture.vo.Category;
import com.hta.lecture.vo.Coupon;
import com.hta.lecture.web.form.CouponCriteria;
import com.hta.lecture.web.form.Criteria;
import com.hta.lecture.web.form.ProfitByCategory;
import com.hta.lecture.web.form.UserCouponCriteria;

@Service
public class AdminService {

	static final Logger logger = LogManager.getLogger(ClassService.class);
	
	@Autowired
	private AdminMapper adminMapper;
	
	
	@Autowired
	private UserCouponMapper userCouponMapper;
	
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

	
	// 개설 제출된 강의의 수
	public int getSubmitClassCount(){
		return  adminMapper.getSubmitClassCount();
	}
	
	// 개설 제출된 강의의 수
	public int getStopClassCount(){
		return  adminMapper.getStopClassCount();
	}
	
	// 강의 수익 합을 가져온다
	public int getTotalIncome(){
		
		return adminMapper.getTotalIncome();
	}
	
	// 이번달 수익 합을 가져온다
	public int getIncomeForThisMonth(){
		
		return adminMapper.getIncomeForThisMonth();
	}
	
	
	// 강의 평점 평균을 가져온다
	public double getGradeAvr() {
		
		return adminMapper.getAvgReview();
	}
	
	// 카테고리별 평균을 가져온다
	public String getDeveloperIncomeForThisMonth() {
		return adminMapper.getDeveloperIncomeForThisMonth();
	}
	
	public String getSecurityIncomeForThisMonth() {
		return adminMapper.getSecurityIncomeForThisMonth();
	}
	
	public String getDataScienceIncomeForThisMonth() {
		return adminMapper.getDataScienceIncomeForThisMonth();
	}
	
	
	public List<MonthIncomeDto> getMonthIncome(){
		List<MonthIncomeDto> monthIncomeList = adminMapper.getMonthIncome();
		return monthIncomeList;
	}
	
	public List<CouponDto> getAllCoupon(CouponCriteria criteria){
		List<CouponDto> getAllCoupon = adminMapper.getAllCoupon(criteria);
		
		return getAllCoupon;
	}
	
	
	public int getCouponTotalRows (CouponCriteria criteria) {
		return adminMapper.getCouponTotalRows(criteria);
	}
	
	
	public List<CouponPosessUserDto> getCouponPosessUserList(UserCouponCriteria userCriteria){
		
		List<CouponPosessUserDto> getCouponPosessUserList = adminMapper.getCouponPosessUsers(userCriteria);
		
		for(CouponPosessUserDto userList : getCouponPosessUserList) {
			
			userList.setCouponList(userCouponMapper
											.getCouponByUserNo(userList.getUserNo()));
			
		}
		
		return getCouponPosessUserList;
	}
	
	public List<AdminBoardDto> getNoAnswerList(){
		
		List<AdminBoardDto> noAnswer = adminMapper.getNoAnswerList();
		return noAnswer;
	}
	public int getNoAnswerCount() {
		return adminMapper.getNoAnswerCount();
	}
	
	
	public int getCouponUsersTotalRows(UserCouponCriteria userCriteria) {
		return adminMapper.getCouponUsersTotalRows(userCriteria);
	}
	
	public void addCoupon(Coupon coupon) {
		adminMapper.addCoupon(coupon);
	}
	
	public void deleteCoupon(int couponNo) {
		adminMapper.deleteCoupon(couponNo);
	}
	
	public void addUserCoupon(int userNo, int couponNo) {
		adminMapper.addUserCoupon(userNo,couponNo);
	}
	
	public void deleteUserCoupon(int userNo, int couponNo) {
		adminMapper.deleteUserCoupon(userNo, couponNo);
	}
	
	public List<AdminClassDto> getAdminClass(Criteria criteria){
		return adminMapper.getAdminClass(criteria);
	}
	public int getClassTotalRows (Criteria criteria) {
		return adminMapper.getClassTotalRows(criteria);
	}
	
	public List<AdminUserDto> getAdminUser(Criteria criteria){
		return adminMapper.getAdminUser(criteria);
	}
	public int getUserTotalRows (Criteria criteria) {
		return adminMapper.getUserTotalRows(criteria);
	}
	
	public List<AdminReviewDto> getAdminReview(Criteria criteria){
		return adminMapper.getAdminReview(criteria);
	}
	public int getReviewTotalRows (Criteria criteria) {
		return adminMapper.getReviewTotalRows(criteria);
	}
	
	public void openClass(int classNo) {
		adminMapper.openClass(classNo);
	}
	public void stopClass(int classNo) {
		adminMapper.stopClass(classNo);
	}
	public void restoreUser(int userNo) {
		adminMapper.restoreUser(userNo);
	}
	public void deleteUser(int userNo) {
		adminMapper.deleteUser(userNo);
	}
	
	public void deleteReview(int reviewNo) {
		adminMapper.deleteReview(reviewNo);
	}
}
