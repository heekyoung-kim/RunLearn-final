<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>questions.jsp</title>
	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
	<div class="container">
		<h1>커뮤니티</h1>
	<ul class="nav nav-tabs" id="status" role="tablist">
  <li class="nav-item" role="all">
    <button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
  </li>
  <li class="nav-item" role="unresolved">
    <button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#unresolved" type="button" role="tab" aria-controls="unresolved" aria-selected="false">미해결</button>
  </li>
  <li class="nav-item" role="resolved">
    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#resolved" type="button" role="tab" aria-controls="contact" aria-selected="false">해결</button>
  </li>
</ul>
<div class="tab-content" id="myTabContent">
  <div class="tab-pane fade show active" id="all" role="tabpanel" aria-labelledby="all-tab">
  	<table>
  		<tr>
  			<th>제목</th>
  			<th>내용</th>
  			<th>작성자</th>
  			<th>등록일</th>
  			<th>강좌명</th>
  			<th>답변갯수</th>
  			<th>좋아요</th>
  		</tr>
	<c:forEach var="board" items="${boardLists}">
		<tr>
			<td>${board.title }</td>
			<td>${board.content}</td>
			<td>${board.name }</td>
			<td>${board.createdDate }</td>
			<td>${board.classTitle }</td>
			<td>${board.commentCnt }</td>
			<!-- <td>${board.tagName }</td> -->
		</tr>		
	</c:forEach>	
  	</table>
  </div>
  <div class="tab-pane fade" id="unresolved" role="tabpanel" aria-labelledby="unresolved-tab">...</div>
  <div class="tab-pane fade" id="resolved" role="tabpanel" aria-labelledby="resolved-tab">...</div>
</div>
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>