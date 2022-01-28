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
	<form id="form-search"  class= "col-lg-6" method="get" action="questions">
		<input type="hidden" name="status" value="${param.status}" } />
		<input type="hidden" name="sort" value="${empty param.sort ? 'date' : param.sort}" } />
		<input type="text" name="search" class= "col-lg-9" value="${param.search}" placeholder="궁금한 질문을 검색해보세요!" /> }
		<button class="btn btn-outline-success" type="submit" id="btn-search">검색</button>
	</form>
</div>
<!--  
<div class="row">	
	<form id="form-search-class" class="col-lg-6" method="get" action="/tag">
		<input class="form-control" name="tagname" value="${value }" type="search" placeholder="태그로 검색해보세요!" aria-label="Search-Tags"/>
		<button class="btn btn-outline-success" type="submit" id="btn-clear">초기화</button>
	</form>
</div>	
 -->
<!-- 최신순, 답변많은순, 좋아요순 버튼 -->
<div class="btn-group btn-group-sm" role="btn-group" aria-label="btn group">	
<button   class="btn btn-outline-success"             			 id="btn-latest">최신순</button>  
<button   class="btn btn-outline-success"  						 id="btn-answer">답변많은순</button>    
<button   class="btn btn-outline-success"    					 id="btn-like">좋아요순</button>    
</div>
 <!-- 글쓰기 버튼 -->
<button class="btn btn-outline-success " type="submit" id="btn-write">글쓰기</button>
<!-- 글쓰기 모달창 -->
<!-- 로그인 모달창 -->
	<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div id="alert-error-login" class="alert alert-danger" style="display: none;"></div>
					<form id="form-login" method="post" action="/rest/login">
						<div class="mb-3">
							<input type="text" class="form-control" id="login_email" placeholder="이메일을 입력하세요">
						</div>
						<div class="mb-3">
							<input type="password" class="form-control" id="login_password" placeholder="비밀번호를 입력하세요"></input>
						</div>
						<button type="button" class="btn btn-primary" id="btn-login">로그인</button>
					</form>
					<div class="d-flex justify-content-center">
						<a href="#" class="text-reset p-2" title="Tooltip">비밀번호 찾기</a> 
						<span class="p-2"> | </span> 
						<a href="registerUser" class="text-reset p-2" title="Tooltip">회원가입</a>
					</div>
				</div>
				<div class="modal-footer ">
	    		   <p>SNS 로그인</p>
		    		<div class="border p-3 mb-4 bg-light d-flex justify-content-between">
			    		<%-- 
			    			카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
			    			카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
			    		 --%>
			    		<div class="alert alert-danger d-none" id="alert-kakao-login">오류 메세지</div>
						    		
		    			<a id="btn-kakao-login" href="kakao/login">
		  					<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
						</a>
		    		</div>
		    		<form id="form-kakao-login" method="post" action="kakao-login">
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="img"/>
		    		</form>
				</div>
			</div>
		</div>
	</div>
</div>

		<!-- 질문답변글 전체출력 -->
	<c:forEach var="board" items="${boardLists}">
			<div class="row border-top border-1">
				<div class=" col-8 mt-3">
					<h3>${board.title }</h3>
					<p>${board.content}</p>
					<ul class="nav">
						<li class="nav-item"><p><small>${board.name }</small></p></li>
						<li class="nav-item"><p><small> / ${board.createdDate }</small></p></li>
						<li class="nav-item"><p><small> / ${board.classTitle }</small></p></li>
					</ul>
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

<!--
$("#btn-search").click(function() {
   location.href="/community/questions?어떻게 연결해줘야하지?"
});

$("#btn-write").click(function() {
   location.href="글쓰기 모달창 어떻게 띄우지"
});
-->

$("#btn-latest").click(function() {
   		$(":input[name=sort]").val("date")
   		$("#form-search").trigger("submit")
});
$("#btn-answer").click(function() {
   		$(":input[name=sort]").val("like")
   		$("#form-search").trigger("submit")
});
$("#btn-like").click(function() {
   		$(":input[name=sort]").val("reply")
   		$("#form-search").trigger("submit")
});

</script>
</body>
</html>