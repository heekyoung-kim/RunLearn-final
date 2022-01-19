package com.hta.lecture.dto;

public class CartItemDto {

	private int itemNo;
	private int bookNo;
	private String title;
	private String publisher;
	private int price;
	private int discountPrice;
	
	public CartItemDto() {}

	public int getItemNo() {
		return itemNo;
	}

	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}

	public int getBookNo() {
		return bookNo;
	}

	public void setBookNo(int bookNo) {
		this.bookNo = bookNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPublisher() {
		return publisher;
	}

	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getDiscountPrice() {
		return discountPrice;
	}

	public void setDiscountPrice(int discountPrice) {
		this.discountPrice = discountPrice;
	}

	@Override
	public String toString() {
		return "CartItemDto [itemNo=" + itemNo + ", bookNo=" + bookNo + ", title=" + title + ", publisher=" + publisher
				+ ", price=" + price + ", discountPrice=" + discountPrice + "]";
	}
	
}
