package com.hta.lecture.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.UserRegisterForm;

@RestController
@RequestMapping("/rest")
public class RegisterRestController {

	private static final String NORMAL_LOGIN_TYPE = "NORMAL";
	
	@Autowired
	UserService userService;
	
	// 일반 비동기(AJAX) 회원가입
	@PostMapping("/registerUser")
	public ResponseDto<?> registerUser(UserRegisterForm form) {
		ResponseDto<?> response = new ResponseDto<>();
		User user = User.builder()
				.email(form.getEmail())
				.password(form.getPassword())
				.name(form.getName())
				.loginType(NORMAL_LOGIN_TYPE)
				.build();
		try {
			userService.registerUser(user);
			response.setStatus("OK");
			User registerUser = userService.getUserByEmail(form.getEmail());
			SessionUtils.addAttribute("LOGIN_USER", registerUser);
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage()); 
			return response;
		}
	}
}
