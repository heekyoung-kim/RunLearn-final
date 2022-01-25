package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.service.BoardService;
import com.hta.lecture.vo.Board;
import com.hta.lecture.web.form.BoardCriteria;

@Controller
@RequestMapping("/community")
public class BoardController {

	@Autowired
	BoardService boardService;
	
	
	@GetMapping("/questions")
	public String qnaCriteriaList(BoardCriteria criteria, Model model) {
		criteria.setCategory("질문");
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		model.addAttribute("boardLists", boards);
		
		return "community/list/questions";
	}
	
	@GetMapping("/chats")
	public String freeList(BoardCriteria criteria, Model model) {
		criteria.setCategory("질문");
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		
		model.addAttribute("boardLists", boards);
		
		return "community/list/chats";
	} 

	@GetMapping("/studies")
	public String studyList(BoardCriteria criteria, Model model) {
		criteria.setCategory("질문");
		List<BoardDto> boards = boardService.getBoardListByCriteria(criteria);
		
		model.addAttribute("boardLists", boards);
		
		return "community/list/studies";
	}
	
	@GetMapping("/questions/likeCount")
	public String likecnt(int no) {
		// likecount 테이블에 글번호(매개),유저번호(세션) 저장.
		// 글번호(매개)로 board테이블에서 글정보 가져와서 글의 좋아요수 +1해서 db에 저장.
		
		return"redirect: community/list/questions/"+no;
	}
	
//	@GetMapping("/list.do")
//	public String list(String category, String status) {
//		BoardCriteria criteria = new BoardCriteria();
//		criteria.setCategory(category);	// 질문, 자유주제, 스터디
//		criteria.setStatus(status);	// null, 해결, 미해결, 모집중, 모집완료
//		return "";
//}
	
}
