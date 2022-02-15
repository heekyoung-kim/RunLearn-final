package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.hta.lecture.dto.OrderDto;
import com.hta.lecture.dto.UserCouponDto;
import com.hta.lecture.dto.WishlistDto;
import com.hta.lecture.service.ClassService;
import com.hta.lecture.service.OrderItemService;
import com.hta.lecture.service.OrderService;
import com.hta.lecture.service.UserCouponService;
import com.hta.lecture.service.UserService;
import com.hta.lecture.service.WishlistService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Classes;
import com.hta.lecture.vo.OrderItem;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class UserInfoController {

	@Autowired
	UserService userService;
	
	@Autowired
	UserCouponService userCouponService;
	
	@Autowired
	WishlistService wishlistService;
	
	@Autowired
	OrderService orderService;
	
	@Autowired
	OrderItemService orderItemService;
	
	@Autowired
	ClassService classService;
	
	
	@GetMapping("/dashboard")
	public String studentMyPage(Model model) {
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
			return "home";
		}
		List<Classes> classesList = classService.getAllClassToStudentByUserNo(user.getNo());
		model.addAttribute("classesList", classesList);
		
		return "student-mypage/home/dashboard";
		
	}
	
	@GetMapping("/profile")
	public String profile() {
		if(SessionUtils.getAttribute("LOGIN_USER") == null) {
			return "home";
		}
		return "student-mypage/home/profile";
	}
	
	@GetMapping("/wishlist")
	public String wishlist(Model model) {
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
			return "home";
		}
		List<WishlistDto> wishlist =  wishlistService.getWishListByUserNo(user.getNo());
		model.addAttribute("wishlists", wishlist); 
		return "student-mypage/myclass/wishlist";
	}
	
	@GetMapping("/couponBox")
	public String couponBox(Model model) {
		
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
			return "home";
		}
		List<UserCouponDto> coupons = userCouponService.getUserCouponsByUserNo(user.getNo());

		// 사용가능 / 사용완료 총 개수.
		int couponUseTotal = userCouponService.totalUseCouponCntByUserNo(user.getNo());
		int couponNoUseTotal = userCouponService.totalNoUseCouponCntByUserNo(user.getNo());
		
		model.addAttribute("totalNotUseCoupons", couponNoUseTotal);
		model.addAttribute("totalUseCoupons", couponUseTotal);
		model.addAttribute("coupons", coupons);
		return "student-mypage/myclass/coupons";
	}
	
	@GetMapping("/point")
	public String point() {
		if(SessionUtils.getAttribute("LOGIN_USER") == null) {
			return "home";
		}
		return "student-mypage/myclass/my-points";
	}
	
	@GetMapping("/orders")
	public String orders(Model model) {
		if(SessionUtils.getAttribute("LOGIN_USER") == null) {
			return "home";
		}
		
		List<OrderDto> orders = orderService.getOrderListByUserNo();
		model.addAttribute("orders", orders);
		
		return "student-mypage/myclass/orders";
	}
	
	@GetMapping("/orders/detail/{no}")
	public String ordersDetail(@PathVariable(name = "no")int orderNo, Model model) {
		if(SessionUtils.getAttribute("LOGIN_USER") == null) {
			return "home";
		}
		
		List<OrderDto> orderItems = orderItemService.getOrderItemsByOrderNo(orderNo);
		model.addAttribute("orderItems", orderItems);
		
		log.info("주문아이템정보", orderItems);
		
		return "student-mypage/myclass/ordersDetail";
	}
	
	
	
}
 