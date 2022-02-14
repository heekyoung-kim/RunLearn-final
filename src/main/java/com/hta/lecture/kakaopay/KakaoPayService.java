package com.hta.lecture.kakaopay;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.hta.lecture.dto.CartDto;
import com.hta.lecture.mapper.CartMapper;
import com.hta.lecture.service.CartService;
import com.hta.lecture.utils.SessionUtils;
import com.hta.lecture.vo.Order;
import com.hta.lecture.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class KakaoPayService {
	
	@Autowired
	private CartMapper cartMapper;
	
	public ReadyResponse payReady(int totalAmount) {
		
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		List<CartDto> carts = cartMapper.getCartByUserNo(user.getNo());
		
		String[] cartNames = new String[carts.size()];
		for(CartDto cart: carts) {
			for(int i=0; i< carts.size(); i++) {
				cartNames[i] = cart.getClassTitle();
			}
		}	
		String itemName = cartNames[0] + " 그외" + (carts.size()-1);
		log.info("강좌이름들:"+itemName);
		String order_id = user.getNo() + itemName;
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", "inflearn");
		parameters.add("item_name", itemName);
		parameters.add("quantity", String.valueOf(carts.size()));
		parameters.add("total_amount", String.valueOf(totalAmount));
		parameters.add("tax_free_amount", "0");
		parameters.add("approval_url", "http://localhost/order/pay/completed");
		parameters.add("cancel_url", "http://localhost/order/pay/cancel");
		parameters.add("fail_url", "http://localhost/order/pay/fail");
		
		log.info("파트너주문아이디:"+ parameters.get("partner_order_id")) ;
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/ready";
		ReadyResponse readyResponse = template.postForObject(url, requestEntity, ReadyResponse.class);
		log.info("결재준비 응답객체: " + readyResponse);
		return readyResponse;
	}
	
	public ApproveResponse payApprove(String tid, String pgToken) {
		User user =  (User)SessionUtils.getAttribute("LOGIN_USER");
		List<CartDto> carts = cartMapper.getCartByUserNo(user.getNo());
		
		String[] cartNames = new String[carts.size()];
		for(CartDto cart: carts) {
			for(int i=0; i< carts.size(); i++) {
				cartNames[i] = cart.getClassTitle();
			}
		}	
		String itemName = cartNames[0] + " 그외" + (carts.size()-1);
		
		String order_id = user.getNo() + itemName;
		
		
		MultiValueMap<String, String> parameters = new LinkedMultiValueMap<String, String>();
		parameters.add("cid", "TC0ONETIME");
		parameters.add("tid", tid);
		parameters.add("partner_order_id", order_id);
		parameters.add("partner_user_id", "inflearn");
		parameters.add("pg_token", pgToken);
		
		HttpEntity<MultiValueMap<String, String>> requestEntity = new HttpEntity<>(parameters, this.getHeaders());
		
		RestTemplate template = new RestTemplate();
		String url = "https://kapi.kakao.com/v1/payment/approve";
		ApproveResponse approveResponse = template.postForObject(url, requestEntity, ApproveResponse.class);
		log.info("결재승인 응답객체: " + approveResponse);
		
		return approveResponse;
	}
	
	private HttpHeaders getHeaders() {
		HttpHeaders headers = new HttpHeaders();
		headers.set("Authorization", "KakaoAK 0492be26a85d8f23d9e31449f1850fb8");
		headers.set("Content-type", "application/x-www-form-urlencoded;charset=utf-8");
		
		return headers;
	}
}
