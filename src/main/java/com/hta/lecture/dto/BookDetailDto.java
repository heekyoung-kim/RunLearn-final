package com.hta.lecture.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@NoArgsConstructor
@Setter
@Getter
public class BookDetailDto {

	private int no;
	private String title;
	private String author;
	private String publisher;
	private int price;
	private int discountPrice;
	private Date pubDate;
	private int stock;
	private Date updatedDate;
	private Date createdDate;


	@Override
	public String toString() {
		return "BookDetailDto [no=" + no + ", title=" + title + ", author=" + author + ", publisher=" + publisher
				+ ", price=" + price + ", discountPrice=" + discountPrice + ", pubDate=" + pubDate + ", stock=" + stock
				+ ", updatedDate=" + updatedDate + ", createdDate=" + createdDate 
				+ "]";
	}
	
	
}
