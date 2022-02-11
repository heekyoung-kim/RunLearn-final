package com.hta.lecture.web.restController;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.hta.lecture.dto.ResponseDto;
import com.hta.lecture.service.WishlistService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Carts;
import com.hta.lecture.vo.User;
import com.hta.lecture.vo.Wishlist;

@RequestMapping("/rest")
@RestController
public class WishlistRestController {

	@Autowired
	WishlistService wishlistService;
			
	@PostMapping("/addDeleteWishlist")
	public ResponseDto<?> addDeleteWishlist(int classNo, int addDelete){
		ResponseDto<?> response = new ResponseDto<>();
		User user = (User)SessionUtils.getAttribute("LOGIN_USER");
		
		try {
			response.setStatus("OK");
			
			Wishlist wishlist = Wishlist.builder().classNo(classNo).userNo(user.getNo()).build();	
			if(addDelete == 0) {
				wishlistService.addWishList(wishlist);					
			}
			wishlistService.deleteItemByIcon(wishlist);			
			
		} catch (RuntimeException e) {
			response.setStatus("FAIL");	
			response.setError(e.getMessage());
		}
		
		
		return response;
	}
}
