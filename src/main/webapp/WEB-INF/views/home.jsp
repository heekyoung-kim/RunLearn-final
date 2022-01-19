<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
</head>
<body>
<%@ include file="common/nav.jsp" %>
	<div class="container">
		<h1>홈페이지</h1>
		<p><c:out value="${message }" /></p>
		<div>
			<img src="/resources/images/cat.png"/>
		</div>
	</div>
<%@ include file="common/footer.jsp" %>
</body>
</html>