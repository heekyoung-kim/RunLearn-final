package com.hta.lecture.dto;

import java.util.List;

import com.hta.lecture.vo.ClassDetail;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class ChapterDto {

	private int no;
	private String title;
	private String content;
	private int classNo;
	private List<ClassDetail> classDetail;

}