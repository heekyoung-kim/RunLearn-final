package com.hta.lecture.web.form;

public class CurriculumForm {

	private int chapterNo;
	private String chapterTitle;
	private String chapterContent;
	private int no;
	private int detailNo;
	private String detailTitle;
	private String detailContent;
	private String detailFree;
	
	public CurriculumForm() {}

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChapterNo(int chapterNo) {
		this.chapterNo = chapterNo;
	}

	public String getChapterTitle() {
		return chapterTitle;
	}

	public void setChapterTitle(String chapterTitle) {
		this.chapterTitle = chapterTitle;
	}

	public String getChapterContent() {
		return chapterContent;
	}

	public void setChapterContent(String chapterContent) {
		this.chapterContent = chapterContent;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	@Override
	public String toString() {
		return "CurriculumForm [chapterNo=" + chapterNo + ", chapterTitle=" + chapterTitle + ", chapterContent="
				+ chapterContent + ", no=" + no + ", detailNo=" + detailNo + ", detailTitle=" + detailTitle
				+ ", detailContent=" + detailContent + ", detailFree=" + detailFree + "]";
	}
	
	
}
