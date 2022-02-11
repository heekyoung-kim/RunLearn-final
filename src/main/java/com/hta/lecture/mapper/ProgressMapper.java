package com.hta.lecture.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Progress;

@Mapper
public interface ProgressMapper {

	void insertProgress(Progress progress);						// 결제시 수강중 강좌 추가 
	void updateProgress(Progress progress);						// 수강중인 강의 학습시간, 학습완료강좌 수 수정	
	void deleteProgressByUserNoClassNo(Progress progress);		// 결제취소시 수강강좌 삭제
//	ProgressDto getProgressByUserNo(Progress progress);			// 수강중 강좌 조회. (마이페이지에서) => 나중에 progressDto만들어서 사용(class테이블과 조인해서 강의정보도 가져옴.)
	Progress getProgressByUserNoClassNo(Progress progress);		// 강의상세페이지에서 수강중인 강좌인지 확인하기 위해 조회.
}
