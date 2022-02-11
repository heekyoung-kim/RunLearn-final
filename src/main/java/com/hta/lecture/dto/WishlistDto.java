package com.hta.lecture.dto;

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
public class WishlistDto {

	private int wishNo;
	private int userNo;
	private int classNo;
	private String title;
	private String teacherName;
	private int price; 
	private int discountPrice;
	private String image;
	private String difficulty;
	private String category;
	
}
