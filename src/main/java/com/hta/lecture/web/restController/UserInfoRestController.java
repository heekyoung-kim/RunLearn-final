package com.hta.lecture.web.restController;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class UserInfoRestController {
	
	@Autowired
	UserService userService;
	
	@PostMapping("/addUserInfo")
	public ResponseDto<?> updateUserInfo(User updateUser){
		ResponseDto<?> response = new ResponseDto<>();
		try {
			response.setStatus("OK");
			User changeUser = (User)SessionUtils.getAttribute("LOGIN_USER");
			
			log.info("변경할 회원정보:"+updateUser);
			
			changeUser.setName(updateUser.getName());
			changeUser.setIntro(updateUser.getIntro());
			
			userService.updateUser(changeUser);
			
			return response;
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	// 비밀번호 발급
	@PostMapping("/updatePwd")
	public ResponseDto<?> updatePwd(User updateUser){
		ResponseDto<?> response = new ResponseDto<>();
		try {
			response.setStatus("OK");
			User changeUser = (User)SessionUtils.getAttribute("LOGIN_USER");
			
			log.info("변경할 회원정보:"+updateUser);
			//비밀번호 암호화
			changeUser.setPassword(DigestUtils.sha256Hex(updateUser.getPassword()));
			
			userService.updateUser(changeUser);
			
			return response;
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	// 새비밀번호로 변경.
	@PostMapping("/updateNewPwd")
	public ResponseDto<?> updateNewPwd(User updateUser){
		ResponseDto<?> response = new ResponseDto<>();
		try {
			response.setStatus("OK");
			User changeUser = (User)SessionUtils.getAttribute("LOGIN_USER");
			log.info("변경할 회원정보:"+ updateUser);
		
			// 입력한 현재비밀번호와 유저정보의 현재비밀번호 비교.

			if(DigestUtils.sha256Hex(updateUser.getOrignPwd()).equals(changeUser.getPassword())) {
				//비밀번호 암호화
				changeUser.setPassword(DigestUtils.sha256Hex(updateUser.getPassword()));
				userService.updateUser(changeUser);

			}else {
				throw new RuntimeException("현재비밀번호와 입력하신 비밀번호가 일치하지 않습니다.");
			}
			
			return response; 
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
	// 탈퇴하기
	@PostMapping("/deleteUserByUser")
	public ResponseDto<?> deleteUser(User user){
		ResponseDto<?> response = new ResponseDto<>();
		try {
			response.setStatus("OK");
			User userInfo = (User)SessionUtils.getAttribute("LOGIN_USER");
			
			if(DigestUtils.sha256Hex(user.getPassword()).equals(userInfo.getPassword())) {
				userInfo.setDeletedStatus("Y");
				userService.updateUser(userInfo);
				
			}else {
				throw new RuntimeException("현재비밀번호와 입력하신 비밀번호가 일치하지 않습니다.");
			}
			
			return response; 
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
	
}
