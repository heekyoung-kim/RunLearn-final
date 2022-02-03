package com.hta.lecture.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import com.hta.lecture.dto.WishlistDto;
import com.hta.lecture.vo.Wishlist;

@Mapper
public interface WishlistMapper {

	void addWishList(Wishlist wish);
	void deleteWishListByNo(int wishNo);
	List<WishlistDto> getWishClasstByUserNo(int no);
}
 