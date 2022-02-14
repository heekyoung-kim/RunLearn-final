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
				  <form >
					<div class="alert alert-danger d-none" id="alert-change-userInfo">오류 메세지</div>				  
				  	<div>
				  		<label class="form-lable mb-1 text-secondary fw-bolder">닉네임<small class="text-danger"> *필수입력</small></label>
				  		<input class="form-control" type="text" name="nickname" value="${LOGIN_USER.name}" placeholder="">
				  	</div>
				  	<div class="mt-3">
				  		<label class="form-lable mb-1 text-secondary"><strong>자기소개</strong><small class="text-danger fw-bolder"> *필수입력</small></label>
				  		<textarea class="form-control" type="text" name="intro" style=" width: 100%; height: 8em;">${LOGIN_USER.intro}</textarea>
				  	</div>
				  	<div class="d-flex justify-content-center mt-3">
					  	<button class="btn btn-success" type="button" id="btn-name-intro-submit">저장하기</button>
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
    	    				<p><small class="form-text">[비밀번호 조건] <br>특수문자/ 문자 / 숫자 포함 8~20자리 이내의 암호를 입력해주세요.</small></p>
					  		<div class="alert alert-danger d-none" id="alert-get-password">오류 메세지</div>
					  		<input class="form-control my-2 bg-light border-0" type="password" name="get-user-pwd" value="" placeholder="비밀번호">
					  		<input class="form-control my-2 bg-light border-0" type="password" name="user-pwd-check" value="" placeholder="비밀번호확인">
					  	</div>
					  	<div class="d-flex justify-content-center mt-3">
						  	<button class="btn btn-success" type="button" id="btn-get-password">발급받기</button>
					  	</div>
					  </form>
					</div>
				</c:when>
				<c:otherwise>
					<div class="border p-5 mt-2 my-0">
					  <form>
					  	<div>
					  		<label class="form-lable mb-1 text-secondary fw-bolder">비밀번호 변경하기</label>
    	    				<p><small class="form-text">[비밀번호 조건] <br>특수문자/ 문자 / 숫자 포함 8~20자리 이내의 암호를 입력해주세요.</small></p>
					  		<div class="alert alert-danger d-none" id="alert-change-password">오류 메세지</div>
					  		<input class="form-control my-1  bg-light border-0" type="password" name="orginPwd" value="" placeholder="현재 비밀번호">
					  		<input class="form-control my-1  bg-light border-0" type="password" name="newPwd" value="" placeholder="새 비밀번호">
					  		<input class="form-control my-1  bg-light border-0" type="password" name="user-newPwd-check" value="" placeholder="새 비밀번호확인">
					  	</div>
					  	<div class="d-flex justify-content-center mt-3">
						  	<button class="btn btn-success" type="button" id="btn-change-pwd">비밀번호 변경하기</button>
					  	</div>
					  </form>
					</div>
				</c:otherwise>
			</c:choose>
			<div class="border p-5 mt-2">
			  <form action="/rest/deleteUser" method="Post">
			  	<div>
			  		<label class="form-lable mb-1 text-secondary fw-bolder">탈퇴</label>
			  		<div class="alert alert-danger d-none" id="alert-delete-user">오류 메세지</div>
			  		<input class="form-control bg-light border-0" type="password" name="user-now-pwd" value="" placeholder="현재 비밀번호">
			  	</div>
			  	<div class="d-flex justify-content-center mt-3">
				  	<button class="btn btn-secondary" type="button" id="delete-user">탈퇴하기</button>
			  	</div>
			  </form>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">
	
	// 이름,자기소개저장
	$(function(){
		$("#btn-name-intro-submit").click(function(){
			
			var nickName = $("input[name=nickname]").val()
			var intro = $("textarea[name=intro]").val()
			
			if(nickName == ""){
				$("input[name=nickname]").focus()
			}
			if(intro == ""){
				$("textarea[name=intro]").focus()
			}
			$.ajax({
				type:"Post"
				,url:"/rest/addUserInfo"
				,dataType: "json"	
				,data:{
					name : nickName,
					intro : intro
				}
				,success : function(response){
					if(response.status == "OK"){
						alert("정보가 변경되었습니다.")
					}else{
						$('#alert-change-userInfo').removeClass("d-none").text(response.error)
					}
				}
			})
		})
	})
	
	// 비밀번호 발급하기
	$(function(){
		$("#btn-get-password").click(function(){
			var pwdPattern = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			var pwd = $("input[name=get-user-pwd]").val()
			var pwdCheck = $("input[name=user-pwd-check]").val()
			
			if(pwd =="" || pwdCheck ==""){
				$('#alert-get-password').removeClass("d-none").text("빈칸을 입력해주세요.")
				return;
			}
			if(!pwdPattern.test(pwd)){
				$('#alert-get-password').removeClass("d-none").text("비밀번호 조건을 맞춰주세요.")
				return;
			}
			
			if(pwd != pwdCheck){
				$('#alert-get-password').removeClass("d-none").text("비밀번호가 일치하지 않습니다.")				
				return;
			}

			$.ajax({
				type:"Post"
				,url:"/rest/updatePwd"
				,dataType: "json"	
				,data:{
					password : pwd
				}
				,success : function(response){
					if(response.status == "OK"){
						alert("정보가 변경되었습니다.")
					}else{
						$('#alert-get-password').removeClass("d-none").text(response.error)
					}
				}
			})
		})
	})
	
	// 비밀번호 변경하기.
	$(function(){
		$("#btn-change-pwd").click(function(){
			var pwdPattern = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			var orginPwd = $("input[name=orginPwd]").val()

			var newPwd = $("input[name=newPwd]").val()
			var newPwdCheck = $("input[name=user-newPwd-check]").val()
			
			if(orginPwd == "" || newPwd =="" || newPwdCheck ==""){
				$('#alert-change-password').removeClass("d-none").text("빈칸을 입력해주세요.")
				return;
			}
			if(!pwdPattern.test(newPwd)){
				$('#alert-change-password').removeClass("d-none").text("비밀번호 조건을 맞춰주세요.")
				return;
			}
			
			if(newPwd == orginPwd){
				$('#alert-change-password').removeClass("d-none").text("현재비밀번호와 새비밀번호가 일치합니다.")				
				return;
			}
			if(newPwd != newPwdCheck){
				$('#alert-change-password').removeClass("d-none").text("새비밀번호와 새비밀번호확인이 일치하지 않습니다.")				
				return;
			}

			$.ajax({
				type:"Post"
				,url:"/rest/updateNewPwd"
				,dataType: "json"	
				,data:{
					orignPwd : orginPwd
					,password : newPwd
				}
				,success : function(response){
					if(response.status == "OK"){
						alert("정보가 변경되었습니다.")
					}else{
						$('#alert-change-password').removeClass("d-none").text(response.error)
					}
				}
			})
		})
	})
	
	
	// 탈퇴하기
	$(function(){
		$("#delete-user").click(function(){
			var pwdPattern = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
			
			var orginPwd = $("input[name=user-now-pwd]").val()
			
			if(orginPwd == ""){
				$('#alert-delete-user').removeClass("d-none").text("빈칸을 입력해주세요.")
				return;
			}
			if(!pwdPattern.test(orginPwd)){
				$('#alert-delete-user').removeClass("d-none").text("비밀번호 조건에 맞지 않습니다.")
				return;
			}

			$.ajax({
				type:"Post"
				,url:"/rest/deleteUserByUser"
				,dataType: "json"	
				,data:{
					password : orginPwd
				}
				,success : function(response){
					if(response.status == "OK"){
						alert("탈퇴되었습니다.")
						location.href="/logout";
					}else{
						$('#alert-delete-user').removeClass("d-none").text(response.error)
					}
				}
			})
		})
	})
	
	
	// 탈퇴하기. 이메일아이디에 해당 비밀번호를 비교후 일치한다면 탈퇴시킴.
	
	
</script>
</body>
</html>