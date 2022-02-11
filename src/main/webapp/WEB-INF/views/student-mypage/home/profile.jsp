<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
	<style>
	.profilebox {
	    width: 150px;
	    height: 150px; 
	    border-radius: 70%;
	    overflow: hidden;
	}
	.profileimg {
	    width: 100%;
	    height: 100%;
	    object-fit: cover;
	}
	.imglocation{
		idth: 400px; 
		position: absolute; 
		left: 60%; 
		margin-left: -200px;
	}
	</style>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container">
  	<div class="row mt-3">
		<div class="col-3">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-6 my-4">
			<p class="fw-bolder text-success"><small>프로필 설정</small></p>
			<div class="border p-5">
			  <div class=" mt-3 d-flex justify-content-center">
					<div class="profilebox">
				  		<img src="/resources/images/default_profile.png" class="profileimg" alt="..." >
					</div>
			  </div>
			  <div class="mt-3">
				  <form action="/rest/addNameIntro" method="Post">
				  	<div>
				  		<label class="form-lable mb-1 text-secondary fw-bolder">닉네임</label>
				  		<input class="form-control" type="text" name="nickname" value="${LOGIN_USER.name}" placeholder="">
				  	</div>
				  	<div class="mt-3">
				  		<label class="form-lable mb-1 text-secondary"><strong>자기소개</strong></label>
				  		<textarea class="form-control" type="text" name="nickname" value="${LOGIN_USER.intro}" style=" width: 100%; height: 8em;"></textarea>
				  	</div>
				  	<div class="d-flex justify-content-center mt-3">
					  	<button class="btn btn-success" type="button">저장하기</button>
				  	</div>
				  </form>
			  </div>
			</div>
			<c:choose>
				<c:when test="${LOGIN_USER.password eq null}">
					<div class="border p-5 mt-2">
					  <form action="/rest/updatePwd" method="Post">
					  	<div>
					  		<label class="form-lable mb-1 text-secondary fw-bolder">비밀번호 발급하기</label>
					  		<input class="form-control my-2 bg-light border-0" type="password" name="newPwd" value="" placeholder="비밀번호">
					  		<input class="form-control my-2 bg-light border-0" type="password" name="newPwdCheck" value="" placeholder="비밀번호확인">
					  	</div>
					  	<div class="d-flex justify-content-center mt-3">
						  	<button class="btn btn-success" type="button">저장하기</button>
					  	</div>
					  </form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="border p-5 mt-2">
					  <form action="/rest/updatePwd" method="Post">
					  	<div>
					  		<div class="alert"></div>
					  		<label class="form-lable mb-1 text-secondary fw-bolder">비밀번호 변경하기</label>
					  		<input class="form-control my-1  bg-light border-0" type="password" name="oldPwd" value="" placeholder="현재 비밀번호">
					  		<input class="form-control my-1  bg-light border-0" type="password" name="newPwd" value="" placeholder="새 비밀번호">
					  		<input class="form-control my-1  bg-light border-0" type="password" name="newPwdCheck" value="" placeholder="새 비밀번호확인">
					  	</div>
					  	<div class="d-flex justify-content-center mt-3">
						  	<button class="btn btn-success" type="button">저장하기</button>
					  	</div>
					  </form>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="border p-5 mt-2">
			  <form action="/rest/deleteUser" method="Post">
			  	<div>
			  		<label class="form-lable mb-1 text-secondary fw-bolder">탈퇴</label>
			  		<input class="form-control bg-light border-0" type="password" name="oldPwd" value="" placeholder="현재 비밀번호">
			  	</div>
			  	<div class="d-flex justify-content-center mt-3">
				  	<button class="btn btn-success" type="button">탈퇴하기</button>
			  	</div>
			  </form>
			</div>
		</div>
	</div>
</div>
</body>
</html>