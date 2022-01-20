<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	<div class="row mb-3">
		<div class="col">
			<h1>로그인 폼</h1>
		</div>
	</div>
	
	<div class="row mb-3">
		<div class="col-8">
			<c:if test="${not empty error }">
				<div class="mb-3 alert alert-danger">
					<strong>오류</strong> ${error }
				</div>
			</c:if>
			<form class="border p-3 bg-light" method="post" action="login">
				<div class="mb-3">
					<label class="form-label">아이디</label>
					<input type="text" class="form-control" name="email" />
				</div>
				<div class="mb-3">
					<label class="form-label">비밀번호</label>
					<input type="password" class="form-control" name="password" />
				</div>
				<div class="mb-3 text-end">
					<a href="home" class="btn btn-secondary">취소</a>
					<button class="btn btn-primary">로그인</button>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>