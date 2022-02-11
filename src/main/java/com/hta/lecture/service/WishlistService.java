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
	
	// 위시리스트들 조회
	public List<WishlistDto> getWishListByUserNo(int no){
		List<WishlistDto> wishList = wishlistMapper.getWishClasstByUserNo(no);
		return wishList;
	}
	
	// 위시리스트 조회
	public WishlistDto getWishByUserNoClassNo(Wishlist wishlist){
		WishlistDto wish = wishlistMapper.getWishByUserNoClassNo(wishlist);
		return wish;
	}
	
	// 장바구니에서 위시리스트 삭제
	public void deleteItem(int wishNo) {
		wishlistMapper.deleteWishListByNo(wishNo);
	}
	// 아이콘으로 위시리스트 삭제
	public void deleteItemByIcon(Wishlist wishlist) {
		wishlistMapper.deleteWishListByUserNoClassNo(wishlist);
	}
	
	// 위시리스트 추가.
	public void addWishList(Wishlist wishlist) {
		WishlistDto wish = wishlistMapper.getWishByUserNoClassNo(wishlist);
		// classNo와 userNo로 wishlist테이블에서 동일 상품 유무조회
		// 있으면 RuntimeException throw 아니면 저장.	
		if(wish != null) {
			throw new RuntimeException("이미 위시리스트에 담긴 강의입니다.");
		}
		wishlistMapper.addWishList(wishlist);
	}

}
 