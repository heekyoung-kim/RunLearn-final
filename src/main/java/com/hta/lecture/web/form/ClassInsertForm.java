package com.hta.lecture.web.form;




import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class ClassInsertForm {
	
	private int no;
	private String title;
	private String content;
	private String difficultly;
	private int categoryNo;
	private int teacherNo;
	private int price;
	private int discountPrice;
	private List<MultipartFile> uploadFiles;
	
	public ClassInsertForm () {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getDifficultly() {
		return difficultly;
	}

	public void setDifficultly(String difficultly) {
		this.difficultly = difficultly;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
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

	public int getTeacherNo() {
		return teacherNo;
	}

	public void setTeacherNo(int teacherNo) {
		this.teacherNo = teacherNo;
	}

	public List<MultipartFile> getUploadFiles() {
		return uploadFiles;
	}

	public void setUploadFiles(List<MultipartFile> uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	@Override
	public String toString() {
		return "ClassInsertForm [no=" + no + ", title=" + title + ", content=" + content + ", difficultly="
				+ difficultly + ", categoryNo=" + categoryNo + ", teacherNo=" + teacherNo + ", price=" + price
				+ ", discountPrice=" + discountPrice + ", uploadFiles=" + uploadFiles + "]";
	}
}
