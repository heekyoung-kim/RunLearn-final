package com.hta.lecture.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.vo.OrderItem;

@Mapper
public interface OrderItemsMapper {
	
	void insertOrderItem(OrderItem orderItem);
	void deleteOrderitemsByOrderNo(int orderNo);
	void deleteOrderitemsByOrderNoItemsNo(OrderItem orderitems);
	List<OrderDto> getOrderItemsByOrderNo(int orderNo);
}
