package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.BoardDetailDto;
import com.hta.lecture.dto.BoardDto;
import com.hta.lecture.vo.Board;
import com.hta.lecture.vo.BoardComment;
import com.hta.lecture.vo.Tag;
import com.hta.lecture.web.form.BoardCriteria;
import com.hta.lecture.web.form.Criteria;

@Mapper
public interface BoardMapper {

// 글 조회
	Board getBoardByNo(int boardNo);
	
// 게시판리스트조회, 모달게시글 추가	
	List<BoardDto> getBoardByCriteria(BoardCriteria criteria);
	void addBoard(Board board);
	void addTag(Tag tag);
	
// 게시글 조회,태그조회,댓글조회	
	BoardDetailDto getBoardDetailDto(int boardNo);
	List<Tag> getBoardTags(int boardNo);
	List<BoardComment> getBoardComments(int boardNo);
	
// 게시글 수정, 삭제
	void updateBoard(Board board);
	void deleteBoard(int boardNo);

// 태그 수정
	void updateTag(int boardNo); 

// 댓글, 대댓글 추가
	void addComment(BoardComment boardComment);
	void addRecomment(BoardComment boardComment);
	
	
// 댓글, 대댓글 수정, 삭제
	void updateComment();
	void deleteComment();
	
// 좋아요 
	
}

