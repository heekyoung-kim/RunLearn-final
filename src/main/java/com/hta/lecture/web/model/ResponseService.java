package com.hta.lecture.web.model;

import java.util.List;

import org.springframework.stereotype.Service;

/**
 * 클라이언트에게 전달되는 응답메시지를 제공할 때 사용되는 헬퍼 클래스다.
 * @author i
 *
 */
@Service
public class ResponseService {

	/**
	 * 클라이언트에게 데이터가 하나 전달되는 응답 메세지를 반환하는 클래스<br>
	 * {"success:true, "message":null, "item":{"no":100, "title":"자바의 정석", "author":"남궁성"....}}
	 * @param <T> 데이터타입
	 * @param item 클라이언트에게 전달할 데이터
	 * @return 응답메세지
	 */
	public <T> SingleResponseData<T> getResponseData(T item) {
		SingleResponseData<T> responseData = new SingleResponseData<>();
        responseData.setItem(item);
        responseData.setSuccess(true);
        return responseData;
	}
	
	/**
	 * 클라이언트에게 데이터가 여러 개 전달되는 응답메시지를 반환하는 클래스다.<br>
	 * {"success:true, "message":null, "item":[{"no":100, "title":"자바의 정석", "author":"남궁성"....},{"no":100, "title":"자바의 정석", "author":"남궁성"....},{}..]}
	 * @param <T> 데이터 타입
	 * @param items 클라이언트에게 전달할 데이터
	 * @return 응답 메시지
	 */
	public <T> ListResponseData<T> getResponseData(List<T> items) {
        ListResponseData<T> responseData = new ListResponseData<>();
        responseData.setItems(items);
        responseData.setSuccess(true);
        return responseData;
    }
	
	/**
	 * 클라이언트에게 전달할 데이터는 없고, 성공여부만 전달되는 응답메세지를 반환하는 클래스다.<br>
	 * {"success":true, "message":null}
	 * @return 응답메세지
	 */
	public ResponseData getSuccessResponse() {
        return getResponseData(true, null);
    }
	
	/**
	 * 클라이언트에게 전달할 데이터는 없고, 실패여부와 에러메세지를 반환하는 클래스<br>
	 * {"success":false, "message": "아이디 혹은 비밀번호가 일치하지 않습니다."}
	 * @param message 오류메세지
	 * @return 응답메세지
	 */
	public ResponseData getFailResponse(String message) {
        return getResponseData(false, message);
    }
	
	/**
	 * 클라이언트에게 전달할 데이터는 없고, 성공여부/실패여부와 메세지가 전달되는 응답메세지를 반환하는 클래스.
	 * @param success 성공/실패여부
	 * @param message 오류메세지
	 * @return 메세지
	 */
	private ResponseData getResponseData(boolean success, String message) {
        ResponseData responseData = new ResponseData();
        responseData.setSuccess(success);
        responseData.setMessage(message);
        return responseData;
    }
}
