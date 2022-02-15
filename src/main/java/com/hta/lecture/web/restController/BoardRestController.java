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
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Board;
import com.hta.lecture.vo.BoardComment;
import com.hta.lecture.vo.Tag;
import com.hta.lecture.vo.User;
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
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		Board addboard = Board.builder()
						.userNo(user.getNo())
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
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		ResponseDto<?> response = new ResponseDto<>();
		boardComment.setUserNo(user.getNo());
		boardService.addComment(boardComment);
		
		return response;
	}

	@PostMapping("/addRecomment")
	public ResponseDto<?> addRecomment(BoardComment boardComment) {
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		ResponseDto<?> response = new ResponseDto<>();
		boardComment.setUserNo(user.getNo());
		boardService.addRecomment(boardComment);
		
		return response;
	}
	// 게시글 수정
	//@PostMapping("/updateBoard")
	//public ResponseDto<?> updateBoard(B)
	
	//게시글 삭제
		@PostMapping("/deleteBoard")
		public ResponseDto<?> deleteBoard(int boardNo) {
			ResponseDto<?> response = new ResponseDto<>();
			try {
				response.setStatus("OK");
				boardService.deleteBoard(boardNo);
				return response;
			} catch (RuntimeException e) {
				response.setStatus("FAIL");
				response.setError(e.getMessage());
				return response;
			}
		}

	
	// 답변 수정
	
	
	// 답변 삭제
	
	
	// 대댓글 수정
	
	
	
	// 대댓글 삭제
	
	
	// 상태 수정
	
	
	// (좋아요)
}
