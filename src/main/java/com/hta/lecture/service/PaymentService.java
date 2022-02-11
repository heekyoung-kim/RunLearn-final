package com.hta.lecture.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.mapper.PaymentMapper;
import com.hta.lecture.vo.Payment;

@Service
@Transactional
public class PaymentService {
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	public void insertPayment(Payment payment) {
		paymentMapper.insertPayment(payment);
	}

}
 