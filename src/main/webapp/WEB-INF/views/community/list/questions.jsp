<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	
<div class="btn-group btn-group-lg" role="group" aria-label="Basic outlined example">	
<button class="${empty param.state ? 'active' : '' }     btn btn-outline-success"             			 id="btn-all-question">전체</button>  
<button class="${param.state eq '해결' ? 'active' : ''}   btn btn-outline-success"  data-status="해결"     id="btn-resolved-question">해결</button>    
<button class="${param.state eq '미해결' ? 'active' : ''}  btn btn-outline-success"  data-status="미해결"   id="btn-unresolved-question">미해결</button>    
</div>

<div class="row">
	<form id="form-search-questions"  class= "col-lg-6" method="get" action="/search">
					<input class="form-control" name="value" value="${value }" type="search" placeholder="궁금한 질문을 검색해보세요!" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">검색</button>
	</form>
</div>
<div class="row">	
	<form id="form-search-class" class="d-flex" class= "col-lg-6" method="get" action="/tag">
					<input class="form-control" name="value" value="${value }" type="search" placeholder="태그로 검색해보세요!" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">초기화</button>
	</form>
		
</div>	
	<div class="tab-pane fade show active mt-3" id="all" role="tabpanel" aria-labelledby="all-tab">
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
	</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>
<!-- 
	<div class="row mb-3">
		<div class="search-item col-lg-8">
			<div class="search-by-tag-box">
				<ul class="nav nav-tabs" id="status" role="tablist">
					<li class="nav-item" role="all">
						<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#all" type="button" role="tab" aria-controls="all" aria-selected="true">전체</button>
					</li>
					<li class="nav-item" role="unresolved">
						<a href="/community/questions?status=unresolved"></a>
						
						<button class="nav-link" id="profile-tab" data-bs-toggle="tab" data-bs-target="#unresolved" type="button" role="tab" aria-controls="unresolved" aria-selected="false">미해결</button>
					</li>
					<li class="nav-item" role="resolved">
						<button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#resolved" type="button" role="tab" aria-controls="contact" aria-selected="false">해결</button>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="tab-content" id="myTabContent">
			<div class="col-lg-8">
				<label for="exampleFormControlInput1" class="form-label"></label> 
				<input class="form-control form-control-lg" type="text" placeholder="궁금한 질문을 검색해보세요!" aria-label=".form-control-lg example">
				<button class="search questions">검색</button>
				
				<label for="exampleFormControlInput1" class="form-label"></label> 
				<input class="form-control form-control-lg" type="text" placeholder="태그로 검색해보세요!" aria-label=".form-control-lg example">
				<button class="clear">초기화</button>
			</div>
			<div class="tab-pane fade show active mt-3" id="all" role="tabpanel" aria-labelledby="all-tab">
			
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
			<div class="tab-pane fade" id="unresolved" role="tabpanel" aria-labelledby="unresolved-tab">...</div>
			
			<div class="tab-pane fade" id="resolved" role="tabpanel" aria-labelledby="resolved-tab">...</div>
		</div>
 -->	
<script>

$("#btn-all-question").click(function() {
   location.href="/community/questions"
});
$("#btn-resolved-question").click(function() {
   location.href="/community/questions?status=해결"
});

$("#btn-unresolved-question").click(function() {
   location.href="/community/questions?status=미해결"
});
</script>
</body>
</html>