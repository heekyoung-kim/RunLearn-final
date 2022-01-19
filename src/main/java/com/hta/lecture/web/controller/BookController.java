package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.service.BookService;
import com.hta.lecture.vo.User;

@CrossOrigin(origins ="http://localhost:8080")
@RestController
@RequestMapping("/api/book")
public class BookController {

	@Autowired
	private BookService bookService;
	
	@GetMapping
	public List<User> books(){
		return bookService.getAllBooks();
	}
}
