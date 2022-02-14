package com.hta.lecture.web.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.MonthIncomeDto;
import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.AdminService;

@RestController
@RequestMapping("/rest")
public class AdminRestController {
	
	@Autowired
	AdminService adminService;
	
	@GetMapping("/admin")
	public List<MonthIncomeDto> MonthIncome(@RequestParam(name = "monthIncome") List<MonthIncomeDto> monthIncome){
		
		monthIncome = adminService .getMonthIncome();
		return monthIncome;
	}
	
	@PostMapping("/stopClass")
	public ResponseDto<?> stopClass(@RequestParam(name ="stopClass") String stopClass) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		String[] stopClassList = stopClass.split(" ");
		
		
		try {
			
			for(String stopClassNo: stopClassList) {
				adminService.stopClass(Integer.parseInt(stopClassNo));
			}
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/deleteReview")
	public ResponseDto<?> deleteReview(@RequestParam(name ="deleteReview") String deleteReview) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		String[] deleteReviews = deleteReview.split(" ");
		
		
		try {
			
			for(String deleteReviewNo: deleteReviews) {
				adminService.deleteReview(Integer.parseInt(deleteReviewNo));
			}
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/openClass")
	public ResponseDto<?> openClass(@RequestParam(name ="openClass") String openClass) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		String[] openClassList = openClass.split(" ");
		
		
		try {
			
			for(String openClassNo: openClassList) {
				adminService.openClass(Integer.parseInt(openClassNo));
			}
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	@PostMapping("/restoreUserByAdmin")
	public ResponseDto<?> restoreUser(int userNo) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		try {
			adminService.restoreUser(userNo);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	@PostMapping("/deleteUser")
	public ResponseDto<?> deleteUser(int userNo) {
		
		ResponseDto<?> response = new ResponseDto<>();
		
		
		try {
			adminService.deleteUser(userNo);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}

}
