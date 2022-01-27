<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="common/nav.jsp" %>
<div class="container">
  <div class="mt-2 p-5" style="width:500px; position: absolute; left:35%;">
  	<h1>회원가입</h1>
  	<h5> 너 우리 동료가 되어랏</h5>
	<div class="alert alert-danger" id="alert-error-register" style="display:none;"></div>
	<form id="form-register" method="post" action="/rest/login">
	      <div class="mb-3 mt-3">
	      	<label class="form-label text-danger" id="label_name">*이름</label>
	        <input type="text" class="form-control" name="name"  placeholder="김홍홍"/>
	      </div>
<!-- 	      <div class="mb-3">
	      	<label class="form-label text-danger" id="label_tel">*핸드폰 번호</label>
	        <input type="number" class="form-control" name="tel"  placeholder="010-0000-0000"/>
	        <p><small>예시와 같이 핸드폰번호 형식에 맞춰서 작성해주세요.</small></p>
	      </div>
 -->	      
	      <div class="mb-3">
	      	<label class="form-label text-danger" id="label_email">*이메일</label>
	        <input type="text" class="form-control" name="email"  placeholder="example@gmail.com"/>
    	    <p><small class="form-text">이메일 형식에 맞춰서 작성해주세요.</small></p>
	      </div>
	      <div class="mb-3">
	      	<label class="form-label text-danger" id="label_email_check">*이메일 확인</label>
	        <input type="text" class="form-control" name="email_check" placeholder="example@gmail.com"></input>
	      </div>
	      <div class="mb-3">
	      	<label class="form-label text-danger" id="label_pwd">*비밀번호</label>
	        <input type="password" class="form-control" name="pwd"  placeholder="****"/>
    	    <p><small class="form-text">[비밀번호 조건] <br>특수문자/ 문자 / 숫자 포함 8~20자리 이내의 암호를 입력해주세요.</small></p>
	      </div>
	      <div class="mb-3">
	      	<label class="form-label text-danger" id="label_pwd_check">*비밀번호 확인</label>
	        <input type="password" class="form-control" name="pwd_check"  placeholder="****"/>
	      </div>
 	    <button type="button" class="btn btn-success" id="btn-register">가입하기</button>
     </form>
  </div>
</div>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript">

$(function(){
	$("#btn-register").click(function(event){
		$("#alert-error-register").hide();
		let name = $("#form-register [name=name]").val();
		let tel = $("#form-register [name=tel]").val();
		let email = $("#form-register [name=email]").val();
		let emailCheck = $("#form-register [name=email_check]").val();
		let password = $("#form-register [name=pwd]").val();
		let passwordCheck = $("#form-register [name=pwd_check]").val();
		
		// 유효성확인
		var emailPattern = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		var pwdPattern = /^.*(?=^.{8,20}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
		
		if(name == "" || tel == "" || email == "" || password == "" || emailCheck == "" || passwordCheck == ""){
			$("#alert-error-register").show().text("비어있는 필수입력정보를 입력해주세요.");
			return;
			}

		if( email != emailCheck){
			$("#alert-error-register").show().text("이메일확인을 다시 입력해주세요.");
			return;
		}
		if( password != passwordCheck){
			$("#alert-error-register").show().text("비밀번호확인을 다시 입력해주세요.");
			return;
		}

		if(!emailPattern.test(email)){
			$("#alert-error-register").show().text("이메일 형식을 맞춰주세요");
			return;
		}
		if(!pwdPattern.test(password)){
			$("#alert-error-register").show().text("비밀번호조건을 맞춰주세요");
			return;
		}
		// 비동기 회원가입
		$.getJSON({
			type: "post"
			,url: "rest/registerUser"
			,dataType: "json"
			,data: {
				name: name
				,email: email
				,password: password
			},
			success : function(response){
				if(response.status == "OK"){
					alert("가입이 완료되었습니다. 인프런의 팀원이 되신 걸 환영합니다~");
					location.href = "/hello";
				}else{
					$("#alert-error-register").show().text(response.error);
				}
				
			}
		})
	})
})
</script>
</body>
</html>