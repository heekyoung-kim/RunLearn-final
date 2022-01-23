package com.hta.lecture.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.UserService;
import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.UserRegisterForm;

@RestController
@RequestMapping("/rest")
public class RegisterRestController {

	private static final String NORMAL_LOGIN_TYPE = "NORMAL";
	
	@Autowired
	UserService userService;
	
	// 일반 비동기(AJAX) 회원가입
	@PostMapping("/register")
	public ResponseDto<?> registerUser(UserRegisterForm form, RedirectAttributes redirectAttributes) {
		ResponseDto<?> response = new ResponseDto<>();
		User user = User.builder()
				.email(form.getEmail())
				.password(form.getPassword())
				.name(form.getName())
				.tel(form.getTel())
				.loginType(NORMAL_LOGIN_TYPE)
				.build();
		try {
			userService.registerUser(user);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
}
