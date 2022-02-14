package com.hta.lecture.vo;

public class ClassDetail {
	
	private int detailNo;
	private String detailTitle;
	private String detailContent;
	private String detailFree;
	private int chapterNo;
	
	public ClassDetail() {}

	public ClassDetail(int detailNo, String detailTitle, String detailContent, String detailFree, int chapterNo) {
		super();
		this.detailNo = detailNo;
		this.detailTitle = detailTitle;
		this.detailContent = detailContent;
		this.detailFree = detailFree;
		this.chapterNo = chapterNo;
	}

	public int getDetailNo() {
		return detailNo;
	}

	public void setDetailNo(int detailNo) {
		this.detailNo = detailNo;
	}

	public String getDetailTitle() {
		return detailTitle;
	}

	public void setDetailTitle(String detailTitle) {
		this.detailTitle = detailTitle;
	}

	public String getDetailContent() {
		return detailContent;
	}

	public void setDetailContent(String detailContent) {
		this.detailContent = detailContent;
	}

	public String getDetailFree() {
		return detailFree;
	}

	public void setDetailFree(String detailFree) {
		this.detailFree = detailFree;
	}

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(int chapterNo) {
		this.chapterNo = chapterNo;
	}

	@Override
	public String toString() {
		return "ClassDetail [detailNo=" + detailNo + ", detailTitle=" + detailTitle + ", detailContent=" + detailContent
				+ ", detailFree=" + detailFree + ", chapterNo=" + chapterNo + "]";
	}
}
