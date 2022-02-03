package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.vo.Carts;

@Mapper
public interface CartMapper {
	void addCart(Carts cart);
	void deleteItemByNo(int cartNo);
	List<CartDto> getCartByUserNo(int no);
}
 