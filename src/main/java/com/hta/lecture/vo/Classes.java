package com.hta.lecture.vo;

import java.util.Date;

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
public class Classes {

	private int no;
	private String title;
	private String content;
	private String difficultly;
	private String image;
	private String video;
	private int income;
	private int period;
	private int price;
	private int discountPrice;
	private String permission;
	private String filter;
	private String status;
	private Date applicationDate;
	private Date openDate;
	private Date updatedDate;
	private Date deletedDate;
	private int totalCount;
	private int totalTime;
	private String isDeleted;
	private int teacherNo;
	private int categoryNo;
}
