package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.mapper.BoardMapper;
import com.hta.lecture.vo.Board;
import com.hta.lecture.web.form.Criteria;

@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public List<Board> CategoryList(Criteria criteria){
		List<Board> boards = boardMapper.getBoardByCriteria(criteria);
		
		return boards;
	}
		
}
