package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@Setter
@Getter
@ToString
public class CartDto {

	private int cartNo;
	private int classNo;
	private String classTitle;
	private String img; 
	private String period;
	private int price;
	private int discountPrice;
}
