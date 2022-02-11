package com.hta.lecture.vo;

public class ClassChapter {

	private int chaptersNo;
	private String chapterTitle;
	private String chapterContent;
	private int no;
	
	public ClassChapter() {}

	public int getChaptersNo() {
		return chaptersNo;
	}

	public void setChaptersNo(int chapterNo) {
		this.chaptersNo = chapterNo;
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
		return "ClassChapter [chapterNo=" + chaptersNo + ", chapterTitle=" + chapterTitle + ", chapterContent="
				+ chapterContent + ", no=" + no + "]";
	}
	
	
}
