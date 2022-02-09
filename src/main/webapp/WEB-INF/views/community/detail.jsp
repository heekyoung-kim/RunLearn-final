<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tiny.cloud/1/8skivbyd7udegec2bybilvg217boq2t339ot1k4o01qx26op/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<meta charset="UTF-8">
<title>게시판 상세페이지</title>
</head>
<body>
<%@ include file="../common/nav.jsp"%>
<!--게시글 출력-->
<section class="detail-post" id="detail-post">
	<!-- 게시글 상단파트 -->
<div class="community-post-info">
		<!-- 제목, 작성자이름, 작성시각, 이름 -->
	<div class="header_title">
		<img src="/resources/images/board/Q_image.png" width="26px" height="26px" alt="..."/>
		<h1>제목${board.title}</h1>
	</div>
	<div class="header_sub-title">
		<h6>작성자${board.name }</h6>
		<span>작성날짜${board.createdDate }</span>
	</div>
</div>
	<!--게시글 내용-->
<div class="community-postinfo-content">
	<div class="content">
		<div class="type-placeholder" style="font-size: 15px; letter-spacing: -0.3px; color: #abb0b5; white-space: pre-wrap;">내용${board.content}</div>
	</div>
	<div class="content_sub-info">
		<!--연관강의 수업 -->
		<div>연관강의${boardDto.classTitle}</div>
		<!-- 태그들 -->
		<div>태그${boardDto.tagName}</div>
	</div>
</div>
</section>
<!--답변파트 -->
<section class="answer">

</section>



  <footer class="footer">
</body>
</html>