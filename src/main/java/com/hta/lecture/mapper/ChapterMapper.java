package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.ChapterDto;
import com.hta.lecture.vo.ClassDetail;

@Mapper
public interface ChapterMapper {
	
	List<ChapterDto> getChapterByClassNo(int no);
	
	List<ClassDetail> getClassDetailByChapterNo(int no);
	
	ClassDetail getChapterInfoByClassDeatilNo(int no);
	
}