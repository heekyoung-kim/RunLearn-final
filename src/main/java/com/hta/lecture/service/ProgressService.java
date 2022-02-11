package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.mapper.ProgressMapper;
import com.hta.lecture.vo.Progress;

@Service
@Transactional
public class ProgressService {

	@Autowired
	private ProgressMapper progressMapper;
	
	// 학습중인 강좌인지 확인
	public Progress checkProgressByUserNoClassNo(Progress progress) {
		Progress savedProgress = progressMapper.getProgressByUserNoClassNo(progress);
		return savedProgress;
	}
	
	// 결제취소시 삭제
	public void deleteProgressByUserNoClassNo(Progress progress) {
		progressMapper.deleteProgressByUserNoClassNo(progress);
	}
	
	// 결제시 추가
	public void insertPrgoressByUserNoClassNo(Progress progress) {
		progressMapper.insertProgress(progress);
	}
	
	// 학습시간, 완강강의수 변경.
	public void updateProgress(Progress progress) {
		progressMapper.updateProgress(progress);
	}
}
