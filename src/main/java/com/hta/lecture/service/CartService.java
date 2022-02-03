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
		cartMapper.deleteItemByNo(no);
	}
	
	public void addCart(Carts cart) {
		cartMapper.addCart(cart);
	}

}
 