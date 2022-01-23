package com.hta.lecture.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.lecture.service.UserService;
import com.hta.lecture.vo.User;

@Controller
public class UserController {

	@Autowired
	UserService userService;

}
