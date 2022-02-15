package com.hta.lecture.web.controller;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.client.RestTemplate;

import com.hta.lecture.dto.PayReadyResponseDto;
import com.hta.lecture.kakaopay.ApproveResponse;
import com.hta.lecture.kakaopay.ReadyResponse;
import com.hta.lecture.dto.CartDto;
import com.hta.lecture.dto.ClassesDto;
import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.kakaopay.KakaoPayService;
import com.hta.lecture.service.CartService;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.service.OrderItemService;
import com.hta.lecture.service.OrderService;
import com.hta.lecture.service.PaymentService;
import com.hta.lecture.service.ProgressService;
import com.hta.lecture.service.UserCouponService;
import com.hta.lecture.service.UserService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Carts;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.vo.Order;
import com.hta.lecture.vo.OrderItem;
import com.hta.lecture.vo.Payment;
import com.hta.lecture.vo.Progress;
import com.hta.lecture.vo.User;
import com.hta.lecture.vo.UserCoupon;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@SessionAttributes({"tid","order"})
public class OrderController {
	
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserCouponService usercouponService;
	
	@Autowired
	private ProgressService progressService;

	@Autowired
	private ClassService classService;
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private OrderItemService orderItemService;
	
	@Autowired
	private PaymentService paymentService;
	
	@Autowired
	private KakaoPayService kakaopayService;
	
	// 카트조회 및 할인(쿠폰, 포인트)적용하기.
	@GetMapping("/carts")
	public String cart(Model model) {
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
		   return "redirect:/";
		}
		int couponTotal = usercouponService.totalNoUseCouponCntByUserNo(user.getNo());
		List<UserCouponDto> userCoupons = usercouponService.getUserCouponsByUserNo(user.getNo());
		List<CartDto> carts = cartService.getCartItemsByNo(user.getNo());
		//logger.info("카트리스트 값:" + carts);
		
		//최종결제금액 계산.
		int totalPrice = 0;
		for(CartDto cartDto : carts) {
			int discountPrice = cartDto.getDiscountPrice(); 
			int price = cartDto.getPrice();                  
			// 할인가격이 없는 경우, 일반가격 /  있는 경우, 할인가격을 더함.
			if(discountPrice == 0) {
				totalPrice += price;
			}
			totalPrice += discountPrice;
		}
		
		model.addAttribute("couponTotal", couponTotal);
		model.addAttribute("coupons", userCoupons); // 보유쿠폰 조회.
		model.addAttribute("cartTotalPrice", totalPrice); //최종가격
		model.addAttribute("carts", carts); // 카트에 담긴 강의조회
		
		return "/order/carts";
	}
	
	// 카카오페이결제 요청
	@GetMapping("/order/pay")
	public @ResponseBody ReadyResponse payReady(@RequestParam(name = "total_amount") int totalAmount, Order order, Model model) {
		
		log.info("주문정보:"+order);
		log.info("주문가격:"+totalAmount);
		// 카카오 결제 준비하기	
		ReadyResponse readyResponse = kakaopayService.payReady(totalAmount);
		// 결재고유 번호(tid)를 세션에 저장
		model.addAttribute("tid", readyResponse.getTid());
		log.info("결재고유 번호: " + readyResponse.getTid());		
		// Order정보를 모델에 저장
		model.addAttribute("order",order);
		
		return readyResponse;
	}
	
	@GetMapping("/order/pay/completed")
	public String payCompleted(@RequestParam("pg_token") String pgToken, @ModelAttribute("tid") String tid, @ModelAttribute("order") Order order,  Model model) {
		
		log.info("결제승인 요청을 인증하는 토큰: " + pgToken);
		log.info("주문정보: " + order);		
		log.info("결재고유 번호: " + tid);
		
		// 카카오 결재 요청하기
		ApproveResponse approveResponse = kakaopayService.payApprove(tid, pgToken);	
		
		// 5. payment 저장
		//	orderNo, payMathod, 주문명.
		// - 카카오 페이로 넘겨받은 값을 저장.
		
		Payment payment = Payment.builder() 
				.paymentClassName(approveResponse.getItem_name())
				.payMathod(approveResponse.getPayment_method_type())
				.payCode(tid)
				.build();
		
		orderService.saveOrder(order,payment);
		
		return "redirect:/orders";
	}
	
	@GetMapping("/order/pay/cancel")
	public String payCancel() {
		return "redirect:/carts";
	}
	
/*	
	// 주문정보 저장하기
	@PostMapping("/orderItems")
	public String order(Order order, Payment payment) {
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		// 1. order 저장
		// orderNo, userNo, PayUserName,sumPrice,discountPrice,totalPrice,tel,email,usePoint,useCouponNo
		// - usecoupon
		// 	 - if (userCouponNo이 마이너스 1보다 크다면)  final_user_coupon_tb에서 사용여부 'Y'로 변경 update UserCoupon
		// - usepoint
		// 	 - user_point에서 뺀 값 update User
		  
		orderService.insertOrderService(order);
		// 쿠폰 사용여부 변경
		if(order.getUseCouponNo() > -1) {
			UserCoupon userCoupon = UserCoupon.builder()
									.userCouponNo(order.getUseCouponNo())
									.build();
			usercouponService.updateUseCouponStatues(userCoupon);
		}
		// 포인트 사용시 포인트 삭감.
		if(order.getUsePoint() != 0) {
			user.setPoint(user.getPoint() - order.getUsePoint());
			userService.updateUser(user);
		}
		
		// user 번호로 카트에 담긴 classNo들 구하기.
		List<CartDto> carts = cartService.getCartItemsByNo(user.getNo());
		
		for( CartDto cart : carts) {
			// 강의정보 구하기.
			ClassesDto classInfo = classService.getClassDetail(cart.getClassNo());
			
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
			orderItemService.insertOrderItem(orderItem);
			
			
			// 3. 수강중 강좌에 classNo, userNo 저장
			Progress progress = Progress.builder().userNo(user.getNo()).classNo(cart.getClassNo()).build();
			progressService.insertPrgoressByUserNoClassNo(progress);
		}
		
		// 4. payment 저장
		//	orderNo, payMathod, 주문명.
		// - 카카오 페이로 넘겨받은 값을 저장.
		// -
		payment.setOrderNo(order.getOrderNo());
		paymentService.insertPayment(payment);
		
		// 5. 카트삭제.
		cartService.deleteCartByUserNo(user.getNo());
		
		return "/orders"; // 결제내역조회페이지로 이동.
	}
*/
}
 