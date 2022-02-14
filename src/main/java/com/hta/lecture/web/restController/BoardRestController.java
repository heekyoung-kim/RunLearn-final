package com.hta.lecture.web.restController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.BoardService;
import com.hta.lecture.vo.Board;
import com.hta.lecture.vo.BoardComment;
import com.hta.lecture.vo.Tag;
import com.hta.lecture.web.form.BoardCriteria;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class BoardRestController {
	
	@Autowired
	private BoardService boardService;
	
	@PostMapping("/addBoard")
	public ResponseDto<?> addBoard(BoardDto board) {
	
		ResponseDto<?> response = new ResponseDto<>();
		
		Board addboard = Board.builder()
						.title(board.getTitle())
						.content(board.getContent())
						.category(board.getCategory())
						.status(board.getStatus())
						.build();
		
		log.info("카테고리:"+ addboard.getCategory());
		List<String> tagNames = board.getTagName();
		
		List<Tag> tags = new ArrayList<Tag>();
		
		for(String tagName : tagNames) {
			if(!tagName.isEmpty()) {
				Tag tag = new Tag();
				tag.setTagName(tagName);
				tags.add(tag);
			}
		}		
		try {
			boardService.addBoard(addboard, tags);
			response.setStatus("OK");
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
		
	}
	
	@PostMapping("/addComment")
	public ResponseDto<?> addComment(BoardComment boardComment) {
		ResponseDto<?> response = new ResponseDto<>();
		
		boardService.addComment(boardComment);
		
		return response;
	}

	@PostMapping("/addRecomment")
	public ResponseDto<?> addRecomment(BoardComment boardComment) {
		ResponseDto<?> response = new ResponseDto<>();
		
		boardService.addRecomment(boardComment);
		
		return response;
	}
}
