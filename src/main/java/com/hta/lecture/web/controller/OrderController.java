package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.service.CartService;
import com.hta.lecture.service.UserCouponService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private UserCouponService usercouponService;
	
	
	@GetMapping("/carts")
	public String cart(Model model) {
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
		   return "redirect:/";
		}
		int couponTotal = usercouponService.totalCouponCntByUserNo(user.getNo());
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
	

}
 