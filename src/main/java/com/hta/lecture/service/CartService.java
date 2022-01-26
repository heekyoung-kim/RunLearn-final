package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.vo.Carts;

@Service
public class CartService {

	@Autowired
	private CartMapper cartMapper;
	
	
	public List<Carts> getCartItemsByNo(int no){
		List<Carts> carts = cartMapper.getCartByUserNo(no);
		return carts;
	}
}
