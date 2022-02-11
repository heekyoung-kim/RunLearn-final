package com.hta.lecture.exceptionhandler;

import org.springframework.dao.DataAccessException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hta.lecture.exception.CartErrorException;
import com.hta.lecture.exception.CustomException;
import com.hta.lecture.exception.LoginErrorException;
import com.hta.lecture.exception.RestLoginErrorException;
import com.hta.lecture.dto.ResponseDto;

/*
 * @ControllerAdvice오 @RestControllerAdvice
 * 		+ @ControllerAdvice는 @Controller클래스와 @RestController클래스 관련된 예외처리가 구현된 클래스를 나타내는 어노테이션이다.
 * 		+ @RestControllerAdvice는 @RestController클래스 관련된 예외처리가 구현된 클래스를 나타내는 어노테이션이다.

 * 		+ @ControllerAdvice 클래스의 예외처리 메소드는 예외가 발생하면 오류 페이지 혹은 JSON 응답을 제공할 수 있다.
 * 		+ @RestControllerAdvice 클래스의 예외처리 메소드는 예외가 발생하면 JSON 응답만 제공할 수 있다.
 * 
 * 		+ 웹 애플리케이션이 웹페이지를 응답으로 제공하는 애플리케이션인 경우 @ControllerAdvice만 사용해서 오류페이지를 응답으로 제공하면 된다.
 * 		+ 웹 애플리케이션이 웹페이지와 Rest 응답을 제공하는 애플리케이션인 경우 @ControllerAdvice만 사용하거나 @RestControllerAdvice를 같이 사용할 수 있다.
 * 		+ 웹 애플리케이션이 Rest 응답을 제공하는 애플리케이션인 경우 @RestControllerAdvice만 사용해서 응답을 제공할 수 있다.
 * 
 * 		+ 예외가 발생하면 여러 예외처리 메소드 중에서 발생한 예외와 가장 일치하는 예외가 정의된 예외처리 메소드가 실행된다.
 * 		+ 일치하는 예외가 없으면 부모타입의 예외가 정의된 예외처리 메소드가 실행된다.
 */

@ControllerAdvice
public class ExceptionHandlerControllerAdvice {
	
	/*
	 * 예외처리 핸들러 메소드
	 * 
	 * + 예외발생시 오류 페이지로 내부이동시키는 예외처리 메소드
	 * 		@ExceptionHandler(예외클래스명.class)
	 * 		public String handle예외클래스명(예외클래스 e) {
	 * 			return "오류정보를 표시하는 jsp 페이지 경로";
	 * 		}
	 * 		+ 예외처리 메소드가 반환하는 JSP로 내부이동해서 JSP를 실행하고, HTML 컨텐츠를 응답으로 보낸다.
	 * 
	 * + 예외발생시 오류 메세지(JSON 텍스트 데이터)를 응답으로 제공하는 예외처리 메소드
	 * 		@ExceptionHandler(예외클래스명.class)
	 * 		public @ResponseBody ResponseDto<?> handle예외클래스명(예외클래스 e) {
	 * 			ReponseDto<?> response = new Response<>();
	 * 			response.setStatus("FAIL");
	 * 			response.setMessage(e.getMessage);
	 * 
	 * 			return response;
	 * 		}
	 * 		+ 위의 예외처리 메소드는 {"status":"FAIL", "error":"오류 메세지 내용", "items":null}을 응답으로 보낸다.
	 * 
	 * 
	 */

	@ExceptionHandler(CartErrorException.class)
	public @ResponseBody ResponseDto<?> handleCartErrorException(CartErrorException e) {
		e.printStackTrace();
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	@ExceptionHandler(RestLoginErrorException.class) 
	public @ResponseBody ResponseDto<?> handleRestLoginErrorException(RestLoginErrorException e, Model model){
		e.printStackTrace();
		ResponseDto<?> response = new ResponseDto<>();
		response.setStatus("FAIL");
		response.setError(e.getMessage());
		
		return response;
	}
	
	@ExceptionHandler(LoginErrorException.class) 
	public String handleLoginErrorException(LoginErrorException e, Model model){
		e.printStackTrace();
		model.addAttribute("error", e.getMessage());
		return "home";
	}
	
	@ExceptionHandler(CustomException.class) 
	public String handleCustomException(CustomException e) {
		e.printStackTrace();
		return "error/customError.jsp";
	}
	
	@ExceptionHandler(DataAccessException.class)
	public String handleDataAccessException(DataAccessException e) {
		e.printStackTrace();
		return "error/databaseError.jsp";
	}
	
	@ExceptionHandler(Exception.class)
	public String handleException(Exception e) {
		e.printStackTrace();
		return "error/serverError.jsp";
	}
	

}
