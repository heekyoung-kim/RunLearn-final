package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.mapper.OrderMapper;
import com.hta.lecture.vo.Order;

@Service
@Transactional
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	public void insertOrderService(Order order) {
		orderMapper.insertOrder(order);
	}

}
 