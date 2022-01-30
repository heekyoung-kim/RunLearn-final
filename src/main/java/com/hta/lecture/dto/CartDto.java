package com.hta.lecture.dto;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class CartDto {

	private int cartNo;
	private String classTitle;
	private String img;
	private String period;
	private int price;
	private int discountPrice;
}
