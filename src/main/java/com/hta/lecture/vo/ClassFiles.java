package com.hta.lecture.vo;

public class ClassFiles {
	
	private int no;
	private String uploadFiles;

	public ClassFiles() {}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getUploadFiles() {
		return uploadFiles;
	}
	
	public void setUploadFiles(String uploadFiles) {
		this.uploadFiles = uploadFiles;
	}

	@Override
	public String toString() {
		return "ClassFiles [no=" + no + ", uploadFiles=" + uploadFiles + "]";
	}

	
}
