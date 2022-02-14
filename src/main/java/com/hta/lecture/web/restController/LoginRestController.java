package com.hta.lecture.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

@RestController
@RequestMapping("/rest")
public class LoginRestController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/login")
	public ResponseDto<?> login(String email, String password) {
		ResponseDto<?> response = new ResponseDto<>();
		try {
			// 로그인기능이 예외없이 처리되면 ok정보 전달, 세션저장.
			User user = userService.login(email, password);
			
			response.setStatus("OK");
			SessionUtils.addAttribute("LOGIN_USER", user);
			return response;
			
		} catch(RuntimeException e) {
			// 예외가 일어나면 fail과 오류메시지 전달.
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
}
