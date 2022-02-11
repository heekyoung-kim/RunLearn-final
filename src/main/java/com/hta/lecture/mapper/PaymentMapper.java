package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Payment;

@Mapper
public interface PaymentMapper {

	void deletePaymentByOrderNo(int OrderNo);
	void updatePayment(Payment payment);
	void insertPayment(Payment payment);
	List<Payment> paymentList(int orderNo);
}
