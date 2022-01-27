package com.hta.lecture.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class OrderController {

	@GetMapping("/carts")
	public String cart() {
		return "/order/carts";
	}
	
}
