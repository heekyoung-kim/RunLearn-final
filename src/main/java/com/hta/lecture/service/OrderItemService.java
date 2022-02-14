package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.mapper.OrderItemsMapper;
import com.hta.lecture.vo.OrderItem;

@Service
@Transactional
public class OrderItemService {

	@Autowired
	private OrderItemsMapper orderItemMapper;
	
	// 주문 아이템 상세정보들 저장.
	public void insertOrderItem(OrderItem orderItem) {
		orderItemMapper.insertOrderItem(orderItem);
	}
	// 주문 아이템 정보 가져오기.
	public List<OrderDto> getOrderItemsByOrderNo(int orderNo){
		List<OrderDto> orderItems = orderItemMapper.getOrderItemsByOrderNo(orderNo);
		return orderItems;
	}
}
 