package com.hta.lecture.service;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.mapper.ClassMapper;
import com.hta.lecture.mapper.OrderItemsMapper;
import com.hta.lecture.mapper.OrderMapper;
import com.hta.lecture.mapper.PaymentMapper;
import com.hta.lecture.mapper.ProgressMapper;
import com.hta.lecture.mapper.UserCouponMapper;
import com.hta.lecture.mapper.UserMapper;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.vo.Order;
import com.hta.lecture.vo.OrderItem;
import com.hta.lecture.vo.Payment;
import com.hta.lecture.vo.Progress;
import com.hta.lecture.vo.User;
import com.hta.lecture.vo.UserCoupon;

import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
@Transactional
public class OrderService {
	
	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private UserCouponMapper userCouponMapper;
	
	@Autowired
	private UserMapper userMapper;
	
	@Autowired
	private ClassMapper classMapper;
	
	@Autowired
	private OrderItemsMapper orderItemsMapper;
	
	@Autowired
	private ProgressMapper progressMapper;
	
	@Autowired
	private PaymentMapper paymentMapper;
	
	
	public void insertOrderService(Order order) {
		orderMapper.insertOrder(order);
	}
	// 주문, 결제내역 조회.	
	public List<OrderDto> getOrderListByUserNo() {
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		return  orderMapper.getOrderListByUserNo(user.getNo());
	}
	
	public void saveOrder(Order order, Payment payment) {
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		// 1. order 저장
		// orderNo, userNo, PayUserName,sumPrice,discountPrice,totalPrice,tel,email,usePoint,useCouponNo
		// - usecoupon
		// 	 - if (userCouponNo이 마이너스 1보다 크다면)  final_user_coupon_tb에서 사용여부 'Y'로 변경 update UserCoupon
		// - usepoint
		// 	 - user_point에서 뺀 값 update User
		order.setUserNo(user.getNo()); 
		
		orderMapper.insertOrder(order);
		log.info("주문정보입력후:"+order);

		// 쿠폰 사용여부 변경
		if(order.getUseCouponNo() > -1) {
			UserCoupon userCoupon = UserCoupon.builder()
									.userCouponNo(order.getUseCouponNo())
									.build();
			userCouponMapper.updateUseCouponStatus(userCoupon);
			
			log.info("쿠폰차감완료");
		}
		// 포인트 사용시 포인트 삭감.
		if(order.getUsePoint() != 0) {
			user.setPoint(user.getPoint() - order.getUsePoint());
			userMapper.updateUser(user);

			log.info("포인트차감완료");
		}
		
		// user 번호로 카트에 담긴 classNo들 구하기.
		List<CartDto> carts = cartMapper.getCartByUserNo(user.getNo());

		
		for( CartDto cart : carts) {
			// 강의정보 구하기.
			ClassesDto classInfo = classMapper.getClassDetail(cart.getClassNo());
			
			// 2. orderItem 저장.
			// orderNo, classNo, orderDetailPrice
			// - classNo들을 for문으로 돌려가며 저장.
			// - class별 가격 구해서 가격(할인가격인지 아닌지 조건)-(할인금액/classNos.size) 구매금액에 저장.
			
			// 강의별 구매금액 저장. -> 강사수익 조회 시 필요.
			int paymentAmount = 0;
			if(classInfo.getDiscountPrice() == 0) {
				paymentAmount = classInfo.getPrice()-(order.getDiscountPrice()/carts.size());
			}
			paymentAmount = classInfo.getDiscountPrice()-(order.getDiscountPrice()/carts.size());
			
			// 수강기한 계산 후 orderItem에 저장.
			int classPeriod = classInfo.getPeriod();
			Date studyPeriod = null; 
			
			if(classPeriod != 0) {
				Date now = new Date();
				Calendar cal = Calendar.getInstance();
				cal.setTime(now);
				cal.add(Calendar.MONTH,classPeriod); // 수강기한 더하기
				studyPeriod = cal.getTime();
			}
			
			OrderItem orderItem = OrderItem.builder()
									.orderNo(order.getOrderNo())
									.classNo(cart.getClassNo()).orderDetailPrice(paymentAmount)
									.orderItemDeletedDate(studyPeriod)
									.build();
			orderItemsMapper.insertOrderItem(orderItem);
			
			log.info("주문아이템 저장완료");
			
			// 3. 수강중 강좌에 classNo, userNo 저장
			Progress progress = Progress.builder().userNo(user.getNo()).classNo(cart.getClassNo()).build();
			progressMapper.insertProgress(progress);

			log.info("수강강좌 저장완료");
		}
		
		// 4. payment 결재내역 저장
		
		payment.setOrderNo(order.getOrderNo());
		paymentMapper.insertPayment(payment);

		log.info("결재정보 저장완료");
		
		// 5. 카트삭제.
		cartMapper.deleteCartByUserNo(user.getNo());

		log.info("카트삭제완료");
	}
}
 