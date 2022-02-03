package com.hta.lecture.web.restController;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.UserService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/api")
public class CartsRestController {

	private UserService userService;
	
	@GetMapping("/carts")
	public ResponseDto<?> addCarts(int no) {
		ResponseDto<?> response = new ResponseDto<>();
		
		
		return response;
	}
}
 