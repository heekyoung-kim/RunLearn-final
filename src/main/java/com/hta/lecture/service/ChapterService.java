package com.hta.lecture.service;

import java.util.List;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.dto.ChapterDto;
import com.hta.lecture.mapper.ChapterMapper;
import com.hta.lecture.vo.ClassDetail;

@Service
public class ChapterService {

	static final Logger logger = LogManager.getLogger(ChapterService.class);
	
	@Autowired
	private ChapterMapper chapterMapper;
	
	public List<ChapterDto> getChapterByClassNo(int no){
		List<ChapterDto> chapterDto = chapterMapper.getChapterByClassNo(no);
		
		return chapterDto;
	}
	
	public List<ClassDetail> getClassDetailByChapterNo(int no) {
		return chapterMapper.getClassDetailByChapterNo(no);
	}
	
	public ClassDetail getChapterInfoByClassDeatilNo(int no) {
		return chapterMapper.getChapterInfoByClassDeatilNo(no);
	}
		
}
