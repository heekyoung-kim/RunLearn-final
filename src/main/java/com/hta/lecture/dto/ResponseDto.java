package com.hta.lecture.dto;

import java.util.List;

public class ResponseDto<T> {

	private String status;
	private String error;
	private List<T> items;
	
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getError() {
		return error;
	}
	public void setError(String error) {
		this.error = error;
	}
	public List<T> getItems() {
		return items;
	}
	public void setItems(List<T> items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "ResponseDto [status=" + status + ", error=" + error + ", items=" + items + "]";
	}
	
	
}
