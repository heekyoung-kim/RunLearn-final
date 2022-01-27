<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>questions.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../../common/nav.jsp"%>
<div class="container">
	<section class="community-header">
		<div class="community-header__content">
			<h2 class="community-header__title">묻고 답해요</h2>
			<p class="community-header__sub-title">74만명의 커뮤니티!! 함께 토론해봐요.</p>
		</div>
	</section>

<!--전체,해결,미해결 상태그룹버튼  -->	
<div class="btn-group btn-group-lg" role="btn-group" aria-label="btn group">	
<button class="${empty param.status ? 'active' : '' }     btn btn-outline-success"             			 id="btn-all-question">전체</button>  
<button class="${param.status eq '해결' ? 'active' : ''}   btn btn-outline-success"  data-status="해결"     id="btn-resolved-question">해결</button>    
<button class="${param.status eq '미해결' ? 'active' : ''}  btn btn-outline-success"  data-status="미해결"   id="btn-unresolved-question">미해결</button>    
</div>
<!-- 검색, 태그창 -->
<div class="row">
	<form id="form-search-questions"  class= "col-lg-6" method="get" action="/search">
		<input class="form-control" name="questions" value="${search }" type="search" placeholder="궁금한 질문을 검색해보세요!" aria-label="Search-Questions"/>
		<button class="btn btn-outline-success" type="submit" id="btn-search">검색</button>
	</form>
</div>
 <div class="row">	
	<form id="form-search-class" class="col-lg-6" method="get" action="/tag">
		<input class="form-control" name="tagname" value="${value }" type="search" placeholder="태그로 검색해보세요!" aria-label="Search-Tags"/>
		<button class="btn btn-outline-success" type="submit" id="btn-clear">초기화</button>
	</form>
</div>	

<!-- 최신순, 답변많은순, 좋아요순 버튼 -->
<div class="btn-group btn-group-lg" role="btn-group" aria-label="btn group">	
<button class=    "btn btn-outline-success"             			 id="btn-all-question">최신순</button>  
<button class=     "btn btn-outline-success"  						 id="btn-resolved-question">답변많은순</button>    
<button class=    "btn btn-outline-success"    						 id="btn-unresolved-question">좋아요순</button>    
</div>
 <!-- 글쓰기 버튼 -->
<button class="btn btn-outline-success " type="submit" id="btn-write">글쓰기</button>

		<!-- 질문답변글 전체출력 -->
	<c:forEach var="board" items="${boardLists}">
			<div class="row border-top border-1">
				<div class=" col-8 mt-3">
					<h3>${board.title }</h3>
					<p>${board.content}</p>
					<p><small>${board.name } / ${board.createdDate } / ${board.classTitle }</small></p>
				</div>
				<div class="col-4 mt-3">
					<p><small>${board.commentCnt }<br>답변</small></p>
					<p><small><i class="bi bi-suit-heart-fill"></i> ${board.likeCnt }</small></p>
				</div>
			</div>
	</c:forEach>
</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
<!--전체,해결, 미해결 버튼 클릭기능-->
$("#btn-all-question").click(function() {
   location.href="/community/questions"
});
$("#btn-resolved-question").click(function() {
   location.href="/community/questions?status=해결"
});
$("#btn-unresolved-question").click(function() {
   location.href="/community/questions?status=미해결"
});
$("#btn-search").click(function() {
   location.href="/community/questions?어떻게 연결해줘야하지?"
});
$("#btn-write").click(function() {
   location.href="글쓰기 모달창 어떻게 띄우지"
});
</script>
</body>
</html>