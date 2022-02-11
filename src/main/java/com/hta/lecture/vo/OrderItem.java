package com.hta.lecture.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Builder
@AllArgsConstructor
@NoArgsConstructor
@Setter
@Getter
@ToString
public class OrderItem {
	
	private int orderItemNo;
	private int orderNo;
	private int classNo;
	private int orderDetailPrice; // 강의별 결제금액.
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date orderItemDeletedDate;  //수강마감일.
	private String deletedStatus;
}
 