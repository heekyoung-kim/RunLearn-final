package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.vo.Carts;

@Mapper
public interface CartMapper {
	void addCart(Carts cart);
	void deleteCartByUserNo(int userNo); // userNo로 카트삭제.
	void deleteItemByCartNo(int cartNo);
	void deleteItemByUserNoClassNo(Carts cart); // 위시리스트에 담을 때 삭제(cartNo를 모를 때) 
	List<CartDto> getCartByUserNo(int no); // userNo로 카트조회
	
	Carts getCartByUserNoClassNo(Carts cart); // cart에 상품이 있는지 조회.
}
 