package com.hta.lecture.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.service.CartService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {
	
	@Autowired
	private CartService cartService;
	
	@GetMapping("/carts")
	public String cart(Model model) {
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		if(user == null) {
		   return "home";
		}
		
		List<CartDto> carts = cartService.getCartItemsByNo(user.getNo());
		//logger.info("카트리스트 값:" + carts);
		
		model.addAttribute("carts", carts);
		return "/order/carts";
	}
	
}
 