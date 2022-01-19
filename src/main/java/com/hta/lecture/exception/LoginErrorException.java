package com.hta.lecture.exception;

public class LoginErrorException extends CustomException {

	private static final long serialVersionUID = -7799696001358188839L;

	public LoginErrorException(String message) {
		super(message);
	}
}
