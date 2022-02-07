package com.hta.lecture.web.restController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.CartService;
import com.hta.lecture.service.UserService;
import com.hta.lecture.service.WishlistService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Carts;
import com.hta.lecture.vo.User;
import com.hta.lecture.vo.Wishlist;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/rest")
public class CartsRestController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CartService cartService;

	@Autowired
	private WishlistService wishlistService;

	
	@GetMapping("/couponBox")
	public ResponseDto<?> addCarts() {
		ResponseDto<?> response = new ResponseDto<>();
		
		try {
			
		} catch (RuntimeException e) {
		}
		
		return response;
	}
	
	@GetMapping("/wishList")
	public ResponseDto<?> getWishList(int userNo){
		ResponseDto<?> response = new ResponseDto<>();
		
		try {
			
		} catch (RuntimeException e) {
		}
		
		return response;
	}

	
	@PostMapping("/addWishList")

	public ResponseDto<?> addCart(Wishlist wishList){
		ResponseDto<?> response = new ResponseDto<>();
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		wishList.setUserNo(user.getNo());

		Carts cart = Carts.builder()
					.userNo(user.getNo())
					.classNo(wishList.getClassNo())
					.build();
		
		
		try {
			response.setStatus("OK");
			wishlistService.addWishList(wishList); // 위시리스트에 추가.
			cartService.deleteItemByUserNoClassNo(cart); //장바구니 삭제

			return response;
	
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			
			return response;
		}
	}

	@PostMapping("/deleteCart")
	public ResponseDto<?> deleteCart(int cartNo){
		ResponseDto<?> response = new ResponseDto<>();
		log.info("카트번호:"+cartNo);
		try {
			response.setStatus("OK");
			cartService.deleteItem(cartNo);
			return response;
	
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			
			return response;
		}
	}
	
	// 카트 전체삭제.
	@PostMapping("/deleteCarts")
	public ResponseDto<?> deleteCarts(List<Integer> cartNos) {
		ResponseDto<?> response = new ResponseDto<>();
		try {
			for(int cartNo : cartNos) {
				log.info("삭제할 카트번호:"+cartNo);
				cartService.deleteItem(cartNo);
			}
			return response;
		} catch (Exception e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
}
 