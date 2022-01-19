package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.mapper.BookMapper;
import com.hta.lecture.vo.User;

@Service
public class BookService {
	
	@Autowired
	private BookMapper bookMapper;
	
	public List<User> getAllBooks(){
		List<User> books = bookMapper.getAllBooks();
		return books;
	}
}
