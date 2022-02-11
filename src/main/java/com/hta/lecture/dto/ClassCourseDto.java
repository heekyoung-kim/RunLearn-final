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
public class ClassCourseDto {

	private int no;
	private String title;
	private String name;
	private int price;
	private int discountPrice;
	private String image;
	private int categoryNo;
	private String categoryName;
	private int categoryParNo;
	private String existCart;
	private String existWishlist;
	private String uploadfiles;
}
