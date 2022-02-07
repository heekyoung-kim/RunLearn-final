<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		.section-1{background:#002333;}
		.section-1 .section-bg{padding:40px 0;}
		.section-1 .img-box{width:440px; height:286px; border-radius:8px;}
		.section-1 .text-box{position:relative;}
		.text-box .text-content{position:absolute; top:50%; transform:translateY(-50%); color:#fff;}
		.card-floating{position:sticky; top:75px; margin:20px 34px 20px auto; width:332px;}
		.btn.btn-apply{background:#00c471; color:#fff;}
		@media screen and (max-width: 1024px) {
			.section-1 .img-box{width:525px; height:341px;}
		}
		@media screen and (max-width: 767px) {
			.section-1 .img-box{width:90vw; height:58vw;}
		}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container-fluid section-1">
	<div class="row section-bg">
		<div class="col">
			<div class="container">
				<div class="row">
					<div class="col-5">
						<div class="img-box">
							<img src="/resources/images/course/${classes.image }" class="card-img-top" alt="...">
						</div>
					</div>
					<div class="col-7 text-box">
						<div class="text-content">
							<span class="badge bg-secondary">New</span> <span>개발&middot;프로그래밍 > 프론트엔드</span>
							<p class="fs-4 m-2">${classes.title }</p>
							<span>★★★★★(4.9) 138개의 수강평&middot;1636명의 수강생</span><br>
							<span>작성자명(강사이름)</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col">
			<nav class="navbar navbar-light bg-light">
				<div class="container-fluid">
					<a class="navbar-brand" href="#">강의 소개</a>
				</div>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-8">
		</div>
		<div class="col-4">
			<div class="card card-floating" style="width: 18rem;">
				<div class="card-body">
					<h3 class="card-title"><strong><fmt:formatNumber pattern="##,###">${classes.price }</fmt:formatNumber>원</strong></h3>
					<a href="#" class="btn btn-apply w-100 fs-6 fw-bold my-3 py-2">수강신청</a><br>
					<a href="#" class="card-link">장바구니 담기</a> <a href="#" class="card-link">추천수</a><br>
				</div>
				<div class="card-footer">
					<span>&middot; 지식공유자: </span><a href="#" class="card-link">강사명</a><br>
					<span>&middot; 총 xx개 수업: 총 x시간 </span><br>
					<span>&middot; 수강기한: xxx</span><br>
					<span>&middot; 입문 > 중급 > 중급이상 대상</span>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>