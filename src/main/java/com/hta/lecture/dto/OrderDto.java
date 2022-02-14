package com.hta.lecture.dto;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;


@NoArgsConstructor
@Setter
@Getter
public class OrderDto {
	
	private int orderNo;			// 주문번호
	private int orderItemNo;		// 주문상품번호
	private Date orderDate;			// 주문날짜
	private String orderState;		// 주문상태
	private String orderClassName;	// 주문명(강의명)
	private String orderClassDetailName; // 상세 강의이름.
	private int orderPrice; 		// 결제금액
	private int discountPrice; 		// 할인금액
	private int sumPrice; 			// 총합금액
	private int useUserCouponNo;	// 사용 쿠폰번호 (사용자쿠폰테이블의 사용자 쿠폰넘버)
	private int useCouponName;		// 사용 쿠폰이름.
	private int usePoint;			// 사용포인트
	private String payMethod;       // 결제방법
	private String classImg;		// 강의 이미지.
	private int	classNo;			// 강의번호.
	private int orderDetailPrice;	// 강의별 결제금액.
	
}
