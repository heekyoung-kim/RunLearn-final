package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hta.lecture.dto.BoardDetailDto;
import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.BoardService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Board;
import com.hta.lecture.vo.User;
import com.hta.lecture.web.form.BoardCriteria;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/community")
public class BoardController {
	@Autowired
	BoardService boardService;
	
	@GetMapping("/questions")
	public String qnaCriteriaList(BoardCriteria criteria, Model model) {
		criteria.setCategory("질문답변");
		//status에서 아무값도 안들어갈때 공백으로 들어가기 떄문에, 값이 안나온다. 그래서 공백이 들어갈경우 null값으로 넣어주도록 StringUtils.hasText 써준다.
		if (!StringUtils.hasText(criteria.getStatus())) {
			criteria.setStatus(null);
		}
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		model.addAttribute("boardLists", boards);
		
		return "community/list/questions";
	}
	
	@GetMapping("/chats")
	public String freeList(BoardCriteria criteria, Model model) {
		criteria.setCategory("자유주제");
		//status에서 아무값도 안들어갈때 공백으로 들어가기 떄문에, 값이 안나온다. 그래서 공백이 들어갈경우 null값으로 넣어주도록 StringUtils.hasText 써준다.
		if (!StringUtils.hasText(criteria.getStatus())) {
			criteria.setStatus(null);
		}
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		
		model.addAttribute("boardLists", boards);
		
		return "community/list/chats";
	} 

	@GetMapping("/studies")
	public String studyList(BoardCriteria criteria, Model model) {
		criteria.setCategory("스터디");
		//status에서 아무값도 안들어갈때 공백으로 들어가기 떄문에, 값이 안나온다. 그래서 공백이 들어갈경우 null값으로 넣어주도록 StringUtils.hasText 써준다.
		if (!StringUtils.hasText(criteria.getStatus())) {
			criteria.setStatus(null);
		}
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		
		model.addAttribute("boardLists", boards);
		
		return "community/list/studies";
	}
	

	// 게시글상세페이지 이동
	@GetMapping("/detail")
	public String detail(int boardNo, Model model) {
		
		BoardDetailDto dto = boardService.getBoardDetailDto(boardNo);
		model.addAttribute("dto", dto);
		
		return "/community/detail"; //detail.jsp
	}
	
	
	
	
	
	
	
	//@GetMapping("/questions/likeCount")
	//public String likecnt(int no) {
	// likecount 테이블에 글번호(매개),유저번호(세션) 저장.
	// 글번호(매개)로 board테이블에서 글정보 가져와서 글의 좋아요수 +1해서 db에 저장.		
	//return"redirect: community/list/questions/"+no;
	//}
}
