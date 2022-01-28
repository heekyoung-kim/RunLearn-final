package com.hta.lecture.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.hta.lecture.dto.WishlistDto;
import com.hta.lecture.mapper.WishlistMapper;
import com.hta.lecture.vo.Wishlist;

@Service
@Transactional
public class WishlistService {

	@Autowired
	private WishlistMapper wishlistMapper;
	
	public List<WishlistDto> getWishListByUserNo(int no){
		List<WishlistDto> wishList = wishlistMapper.getWishClasstByUserNo(no);
		return wishList;
	}
	
	public void deleteItem(int no) {
		wishlistMapper.deleteWishListByNo(no);
	}
	
	public void addWishList(Wishlist wishlist) {
		wishlistMapper.addWishList(wishlist);
	}

}
