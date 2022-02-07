package com.hta.lecture.web.form;

import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@ToString
@Setter
@Getter
public class BoardCriteria {

	private String category;
	private String status;
	private String search;
	private String content;
	private String sort;
	private List<String> tags;
}
