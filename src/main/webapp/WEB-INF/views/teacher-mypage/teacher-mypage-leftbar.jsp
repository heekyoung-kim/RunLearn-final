<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	.left-side dt{font-size:.8rem; color:#cfcfcf;}
	.left-side dd a{display:block; color:#454545; text-decoration:none;}
	.left-side dd.active a{font-weight:700; color:#1dc078;}
	.left-side dd:hover{background:#fff;}
	.left-side dd.active:hover a{color:#454545;}
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<dl>
	<dt class="px-1 py-2">대시보드</dt>
	<dd class="px-4 py-1 active"><a href="/instructor">대시보드</a></dd>
</dl>
<dl>
	<dt class="px-1 py-2">강의관리</dt>
	<dd class="px-4 py-1"><a href="/instructor/courses">강의관리</a></dd>
	<dd class="px-4 py-1"><a href="/instructor/questions">질문리스트</a></dd>
	<dd class="px-4 py-1"><a href="/instructor/reviews">수강평리스트</a></dd>
	<dd class="px-4 py-1"><a href="/instructor/incomes">수익 확인</a></dd>
</dl>
<dl>
	<dt class="px-1 py-2">강의 만들기</dt>
	<dd class="px-4 py-1"><a href="">강의 만들기</a></dd>
</dl>
</body>
</html>