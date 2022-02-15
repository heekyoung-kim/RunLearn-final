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

	@PostMapping("/addDeleteCart")
	public ResponseDto<?> addDeleteCart(int classNo, int addDelete){
		ResponseDto<?> response = new ResponseDto<>();
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		try {
			response.setStatus("OK");
			
			Carts cart = Carts.builder().classNo(classNo).userNo(user.getNo()).build();
			if(addDelete == 0) {
				cartService.deleteItemByUserNoClassNo(cart);
			}
			cartService.addCart(cart);
			Wishlist wishlist = Wishlist.builder()
					.classNo(classNo)
					.userNo(user.getNo())
					.build();
			wishlistService.deleteItemByIcon(wishlist);
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
		}
		
		return response;
	}
	
	@GetMapping("/couponBox")
	public ResponseDto<?> getUserCoupon() {
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
	public ResponseDto<?> moveWishlist(Wishlist wishList){
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

	// 카트 추가
	@PostMapping("/addCart")
	public ResponseDto<?> addCart(Carts cart){
		ResponseDto<?> response = new ResponseDto<>();

		try {
			response.setStatus("OK");
			
			// 카트추가
			User user = (User)SessionUtils.getAttribute("LOGIN_USER");
			cart.setUserNo(user.getNo());
			log.info("카트추가:", cart);
			cartService.addCart(cart);			 
			
			// 위시리스트 삭제
			Wishlist wishlist = Wishlist.builder()
								.classNo(cart.getClassNo())
								.userNo(user.getNo())
								.build();
			wishlistService.deleteItemByIcon(wishlist);
			
			return response;
		} catch (RuntimeException e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			
			return response;
		}
	}
	
	
	// 카트 하나 삭제
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
	public ResponseDto<?> deleteCarts() {
		ResponseDto<?> response = new ResponseDto<>();
		try {
			response.setStatus("OK");
			User user = (User)SessionUtils.getAttribute("LOGIN_USER");
			cartService.deleteCartByUserNo(user.getNo());
			return response;
		} catch (Exception e) {
			response.setStatus("FAIL");
			response.setError(e.getMessage());
			return response;
		}
	}
}
 