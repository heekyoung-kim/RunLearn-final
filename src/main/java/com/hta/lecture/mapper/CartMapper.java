package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.hta.lecture.vo.Carts;

@Mapper
public interface CartMapper {

	List<Carts> getCartByUserNo(int no);
	
}
