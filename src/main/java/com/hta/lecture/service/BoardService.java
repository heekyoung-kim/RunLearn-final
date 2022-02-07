package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.mapper.BoardMapper;
import com.hta.lecture.vo.Board;
import com.hta.lecture.vo.Tag;
import com.hta.lecture.web.form.BoardCriteria;
import com.hta.lecture.web.form.Criteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BoardService {

	@Autowired
	private BoardMapper boardMapper;
	
	public List<BoardDto> getBoardListByCriteria(BoardCriteria criteria){
		List<BoardDto> boards = boardMapper.getBoardByCriteria(criteria);
		return boards;
	}

	public void addBoard(Board board, List<Tag> tags){
		
		// selectkey값을 이용했기 때문에 추가 전과 후의 board_no값이 달라진다.
		// 추가를 실행한 경우 log.info로 boardNo값이 생긴 것을 볼 수 있다.
		
		log.info("board 정보 추가 전:" + board);
		boardMapper.addBoard(board);
		log.info("board 정보 추가 후:" + board);
		
		// 여러 tag들을 내포된for문으로 꺼내서 하나씩 insert해주기.
		// + boardNo값은 selectkey값으로 받아온 값을 꺼내서 추가해준다.
		for(Tag tag : tags) {
			tag.setBoardNo(board.getBoardNo());
			boardMapper.addTag(tag);  
			}
		}
	}
	
	
		

