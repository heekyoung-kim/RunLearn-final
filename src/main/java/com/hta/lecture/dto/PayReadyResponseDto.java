package com.hta.lecture.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class PayReadyResponseDto {

	private String tid;
	private String next_redirect_app_url;
	private String next_redirect_mobile_url;
	private String next_redirect_pc_url;
	private String android_app_scheme;
	private String ios_app_scheme;
	private String created_at;
	
}
