package com.hta.lecture.vo;

public class ClassChapter {

	private int chapterNo;
	private String chapterTitle;
	private String chapterContent;
	private int no;
	
	public ClassChapter() {}

	public int getChapterNo() {
		return chapterNo;
	}

	public void setChaptersNo(int chapterNo) {
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

	@Override
	public String toString() {
		return "ClassChapter [chapterNo=" + chapterNo + ", chapterTitle=" + chapterTitle + ", chapterContent="
				+ chapterContent + ", no=" + no + "]";
	}
	
	
}
