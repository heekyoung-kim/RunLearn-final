package com.hta.lecture.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@NoArgsConstructor 
@Setter
@Getter
@ToString
public class Progress {
	// 수강중인 강좌.
	private int progressNo;
	private int userNo;
	private int classNo;
	private int progressEndCount; // 수강한 강의수
	private int progressStudyTime; // 총 수강시간
}
