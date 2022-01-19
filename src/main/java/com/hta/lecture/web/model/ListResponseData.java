package com.hta.lecture.web.model;

import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * 클라이언트에게 데이터가 여러개 전달되는 응답메세지를 표현하는 클래스다.
 * @author i
 *
 * @param <T> 데이터타입
 */
@Getter
@Setter
public class ListResponseData<T> extends ResponseData {
	private List<T> items;
}
