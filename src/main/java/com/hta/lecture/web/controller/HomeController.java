package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.dto.ClassCourseDto;
import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.exception.LoginErrorException;
import com.hta.lecture.service.TeacherService;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Teacher;
import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.KakaoLoginForm;
import com.hta.lecture.web.form.UserRegisterForm;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class HomeController {
	
	private static final String KAKAO_LOGIN_TYPE = "kakao";
	
	@Autowired
	private UserService userService;

	@Autowired
	private TeacherService teacherService;
	
	
	
	@Autowired
	private ClassService classService;
	
	// 홈
	@RequestMapping("/")
	public String home(Model model) {
		
		List<ClassesDto> classDto = classService.getAllCourseData();
		
		model.addAttribute("classDto", classDto);
		
		return "home";
	}
	@RequestMapping("/hello")
	public String hello() {
		return "hello";	
	}

	// 로그아웃
	@GetMapping("/logout")
	public String logout() {
		SessionUtils.removeAttribute("LOGIN_USER");
		
		return "redirect:/";
	}
	
	// 회원가입 폼
	@GetMapping("/registerUser")
	public String registerForm() {
		return "register";
	}
	
	// 회원정보 수정.
	@PostMapping("/updateUser") 
	public String updateUser(User user) {
		userService.updateUser(user);
		return "profile";
	}
	
	// kakao로그인 요청을 처리한다. 
	@PostMapping("/kakao-login")
	public String loginWithKakao(KakaoLoginForm form){
		log.info("카카오 로그인 인증정보:"+ form);
		
		User user = User.builder()
					.email(form.getEmail())
					.name(form.getName())
					.img(form.getImg())
					.loginType(KAKAO_LOGIN_TYPE)
					.build();
		
		User savedUser = userService.loginWithKakao(user);
		if (savedUser != null) {

			if(savedUser.getDeletedStatus().equals("Y")) {
				/*	throw new RuntimeException("탈퇴된 회원입니다.");*/
				return"redirect:/?error=deleted";
			} else  {
				SessionUtils.addAttribute("LOGIN_USER", savedUser);
			}
			
		} else {
			SessionUtils.addAttribute("LOGIN_USER", user);
		}
		
		
		return "redirect:/";
	}
	// 강사신청페이지
	@GetMapping("/open-knowledge")
	public String openKnowledge() {
		return"openKnowledge";
	}
	// 강사등록
	@PostMapping("/addTeacher")
	public String addTeacher(Teacher teacher) {
		// 강사등록 서비스(유저정보의 강사여부 변경, 강사정보등록.)
		teacherService.insertTeacher(teacher);
		
		return"redirect:/";
	}
}
