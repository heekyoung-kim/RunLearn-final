<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		.slick-side div{display:inline-block;}
		.slick-nav{padding:0 16px; background:#c3c3c3; border-radius:25px;}
		.slick-nav div{font-weight:bold; color:#fff;}
		.slick-prev, .slick-next{background:transparent; border:none; font-weight:bold; color:#fff; font-size:20px;}
		.slick-pause{width:11px; height:11px; background:#fff;}
		.slick-notice div{padding:4px 12px; border:1px solid #d3d3d3; border-radius:25px; font-weight:bold; font-size:14px;}
		@media(max-width:768px){
			.slick-side{display:none;}
		}
	</style>
</head>
<body>
<%@ include file="common/nav.jsp" %>
	<div class="container-fluid m-0 p-0">
		<div class="row">
			<div class="col">
				<div class="main-slide">
				  <div style="background:#000a12;">
					<div class="container">
						<div class="row m-0 p-0">
							<div class="col-6">
								텍스트<br>
								텍스트
							</div>
						  	<div class="col-6 m-0 p-0">
							  	<img height="320" alt="" src="/resources/images/main-slide1.gif">
						  	</div>
						</div>
					</div>
				  </div>
				  <div style="background:#f9f9f9;">
				    <div class="container">
						<div class="row m-0 p-0">
							<div class="col-6 m-0 p-0">
								텍스트<br>
								텍스트
							</div>
						  	<div class="col-6 m-0 p-0">
							  	<img height="320" alt="" src="/resources/images/main-slide2.png">
						  	</div>
						</div>
					  </div>
					</div>
				</div>
				<div class="container">
					<div class="slick-side my-3">
						<div class="slick-nav me-3">
							<div class="slick-count">1 / 10</div>
							<div class="slick-arrow">
								<div class="slick-pause"></div>
							</div>
						</div>
						<div class="slick-notice">
							<div class="slick-notice-1">성장은 인프런</div>
							<div class="slick-notice-2">for All Developers</div>
							<div class="slick-notice-3"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col">
				<p class="fs-3">여기서 시작해보세요!</p><span class="">Ready!!</span>
				<p class="fs-6">이미 검증된 쉽고 친절한 입문 강의!!</p>
				<div class="sub-slide">
					<div class="card">
						<img src="/resources/images/main-slide1.gif" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">&starf;&starf;&starf;&starf;&star;</li>
							<li class="list-group-item">&bsol; 77,000</li>
						</ul>
						<div class="card-body">
							<a href="#" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a>
						</div>
					</div>
					<div class="card">
						<img src="/resources/images/main-slide1.gif" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">&starf;&starf;&starf;&starf;&star;</li>
							<li class="list-group-item">&bsol; 77,000</li>
						</ul>
						<div class="card-body">
							<a href="#" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a>
						</div>
					</div>
					<div class="card">
						<img src="/resources/images/main-slide1.gif" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">&starf;&starf;&starf;&starf;&star;</li>
							<li class="list-group-item">&bsol; 77,000</li>
						</ul>
						<div class="card-body">
							<a href="#" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a>
						</div>
					</div>
					<div class="card">
						<img src="/resources/images/main-slide1.gif" class="card-img-top" alt="...">
						<div class="card-body">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">&starf;&starf;&starf;&starf;&star;</li>
							<li class="list-group-item">&bsol; 77,000</li>
						</ul>
						<div class="card-body">
							<a href="#" class="card-link">Card link</a>
							<a href="#" class="card-link">Another link</a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.main-slide').slick({
			appendArrows:$(".slick-arrow"),
			prevArrow:"<button type='button' class='slick-prev'>&#60;</button>",
			nextArrow:"<button type='button' class='slick-next'>&#62;</button>"
		});	
		$('.sub-slide').slick({
			slidesToShow: 4,
			slidesToScroll: 4
		});
	})
</script>
</body>
</html>