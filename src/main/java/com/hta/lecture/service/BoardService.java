package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.mapper.BoardMapper;

@Service
public class BoardService {

		@Autowired
		private BoardMapper boardMapper;
		
		
}
