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
  	<h5> 너 우리의 동료가 되어랏</h5>
	<form id="form-login" method="post" action="/rest/login">
	      <div class="mb-3 mt-3">
	      	<label class="form-label" id="name">이름</label>
	        <input type="text" class="form-control" id="name"  placeholder="김홍홍">
	      </div>
	      <div class="mb-3">
	      	<label class="form-label" id="tel">핸드폰 번호</label>
	        <input type="text" class="form-control" id="tel"  placeholder="010-0000-0000">
	      </div>
	      <div class="mb-3">
	      	<label class="form-label" id="email_id">이메일</label>
	        <input type="text" class="form-control" id="email_id"  placeholder="example@gmail.com">
	      </div>
	      <div class="mb-3">
	      	<label class="form-label" id="email_id">이메일 확인</label>
	        <input type="password" class="form-control" id="password" placeholder="example@gmail.com"></input>
	      </div>
	      <div class="mb-3">
	      	<label class="form-label" id="pwd">비밀번호</label>
	        <input type="password" class="form-control" id="pwd"  placeholder="****">
	      </div>
	      <div class="mb-3">
	      	<label class="form-label" id="pwd">비밀번호 확인</label>
	        <input type="password" class="form-control" id="pwd"  placeholder="****">
	      </div>
 	    <button type="button" class="btn btn-success" id="btn-login">가입하기</button>
     </form>
  </div>
</div>
</body>
<%@ include file="common/footer.jsp" %>
</html>