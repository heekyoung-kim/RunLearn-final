package com.hta.lecture.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.service.BoardService;

@Controller
@RequestMapping("community")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	@GetMapping("/questions")
	public String qnaList() {
		return "qnaList";
	}
	
	@GetMapping("/chats")
	public String freeList() {
		return "freeList";
	}

	@GetMapping("/studies")
	public String studyList() {
		return "studyList";
	}
	
	
}
