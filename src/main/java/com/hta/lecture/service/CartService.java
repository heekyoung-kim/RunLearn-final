package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.vo.Carts;

@Service
@Transactional
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	public List<CartDto> getCartItemsByNo(int no){
		List<CartDto> carts = cartMapper.getCartByUserNo(no);
		return carts;
	}
	
	public void deleteItem(int no) {
		cartMapper.deleteItemByCartNo(no);
	}
	public void deleteCartByUserNo(int no) {
		cartMapper.deleteCartByUserNo(no);
	}
	
	
	public void deleteItemByUserNoClassNo(Carts cart) {
		cartMapper.deleteItemByUserNoClassNo(cart);
	}
	
	
	public void addCart(Carts cart) {
		// 카트 중복추가 조회.
		Carts savedCart = cartMapper.getCartByUserNoClassNo(cart);
		if(savedCart != null) {
			throw new RuntimeException("카트에 동일상품이 존재합니다.");
		}
		cartMapper.addCart(cart);
	}

}
 