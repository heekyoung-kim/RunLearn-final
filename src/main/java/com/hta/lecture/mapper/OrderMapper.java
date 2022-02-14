package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.vo.Order;

@Mapper
public interface OrderMapper {

	void deleteOrderByOrderNo(int orderNo);			// 주문번호로 삭제
	void deleteOrderByOrderItemNo(int orderitemNo);	// 주문아이템 번호로 주문아이템 중 일부 아이템 삭제.
	void updateOrder(Order order);					// 주문상태 update (환불신청, 환불완료로 변경시 사용.)
	void insertOrder(Order order);					// 주문정보 저장.(결제후)
	List<OrderDto> getOrderListByUserNo(int userNo);			// 주문정보 조회.(주문결제내역)
	
}
