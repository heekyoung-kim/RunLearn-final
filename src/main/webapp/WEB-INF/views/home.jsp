<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		.banner-box{position:relative;}
		.banner-text{position:absolute; top:50%; transform:translateY(-50%);}
		
		.main-slide-side .slick-side div{display:inline-block;}
		.main-slide-side .slick-nav{padding:0 16px; background:#c3c3c3; border-radius:25px;}
		.main-slide-side .slick-nav div{font-weight:bold; color:#fff;}
		.main-slick-prev, .main-slick-next{background:transparent; border:none; font-weight:bold; color:#fff; font-size:20px;}
		.main-slide-side .slick-pause{width:11px; height:11px; background:#fff;}
		.main-slide-side .slick-notice div{padding:4px 12px; border:1px solid #d3d3d3; border-radius:25px; font-weight:bold; font-size:14px;}
		@media(max-width:768px){
			.main-slide-side .slick-side{display:none;}
		}
		
		.section-text p{display:inline-block;}
		.section-text span{color:#fa4c3d;}
		
		.sub-slide .slick-prev{position:absolute; top:50%; transform:translateY(-50%); left:-20px; z-index:10; opacity:.5;
			background:#fff; width:40px; height:40px; color:#000; font-weight:bold; border:1px solid #000; border-radius:50%;
		}
		.sub-slide .slick-next{position:absolute; top:50%; transform:translateY(-50%); right:-20px; z-index:10; opacity:.5;
			background:#fff; width:40px; height:40px; color:#000; font-weight:bold; border:1px solid #000; border-radius:50%;
		}
		
		.sub-slide .slick-slide{margin:0 4px;}
		.sub-slide .slick-list{margin:0 -4px;}
		
		.section-end p span{color:#00c471;}
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
							<div class="col-6 banner-box">
								<div class="banner-text">
									<span class="badge bg-info text-dark me-2">인프런이 사랑받는 이유</span><span class="badge bg-info text-dark">+ 10일 남음</span><br>
									<p class="fs-4 my-3 text-light fw-bold">80만 유저가 선택한<br>특별한 이유는 무엇일까?</p>
									<span class="fs-6 text-light">지금 댓글만 작성해도</span><br>
									<span class="fs-6 text-light">모두에게 선물을 드려요</span>
								</div>
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
							<div class="col-6 banner-box">
								<div class="banner-text">
									<span class="badge bg-primary text-light me-2">신규 강의</span><br>
									<p class="fs-4 my-3 text-dark fw-bold">나만 몰랐었던 이 강의~♬</p>
									<span class="fs-6 text-dark">매일 업데이트 되는</span><br>
									<span class="fs-6 text-dark">인프런 신규강의를 만나보세요!</span>
								</div>
							</div>
						  	<div class="col-6 m-0 p-0">
							  	<img height="320" alt="" src="/resources/images/main-slide2.png">
						  	</div>
						</div>
					  </div>
					</div>
				</div>
				<div class="container main-slide-side">
					<div class="slick-side my-3">
						<div class="slick-nav me-3">
							<!-- <div class="slick-count">1 / 10</div> -->
							<div class="slick-arrow">
								<!-- <div class="slick-pause"></div> -->
							</div>
						</div>
						<div class="slick-notice">
							<div class="slick-notice-1">성장은 인프런</div>
							<div class="slick-notice-2">신규 강의</div>
							<!-- <div class="slick-notice-3">for All Developers</div> -->
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col section">
				<div class="section-text">
					<p class="fs-4 fw-bold me-2 mt-3 mb-0">여기서 시작해보세요!</p><span class="fw-bold">Ready!!</span><br>
					<p class="fs-6 mt-0 mb-3">이미 검증된 쉽고 친절한 입문 강의!!</p>				
				</div>
				<div class="card-group sub-slide">
					<c:forEach var="classList" items="${classDto }">
						<c:if test="${classList.difficultly eq '입문'}">
							<div class="card">
								<a class="d-block text-decoration-none text-secondary" href="course/${classList.no }">
									<img src="/resources/images/course/${classList.uploadfiles }" class="card-img-top" alt="...">
									<div class="card-body" style="min-height:136px;">
										<h5 class="card-title">${classList.title }</h5>
										<p class="card-text">${classList.teacherName }</p>
									</div>
									<ul class="list-group list-group-flush">
										<li class="list-group-item border-0">&starf;&starf;&starf;&starf;&star;</li>
										<c:if test="${classList.discountPrice gt 0}">
											<li class="list-group-item border-0">
												<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${classList.price }</fmt:formatNumber></span>
												<span class="fs-5 fw-bold">&bsol; <fmt:formatNumber pattern="##,###">${classList.discountPrice }</fmt:formatNumber></span>
											</li>
										</c:if>
										<c:if test="${classList.price gt 0 && classList.discountPrice le 0}">
											<li class="list-group-item border-0">
												<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${classList.price }</fmt:formatNumber></span>
												<span class="fs-5 fw-bold">무료</span>
											</li>
										</c:if>
										<c:if test="${classList.price le 0 && classList.discountPrice le 0}">
											<li class="list-group-item border-0">
												<span class="fs-5 fw-bold">무료</span>
											</li>
										</c:if>
									</ul>
									<div class="card-footer">
										<span class="badge bg-success">${classList.difficultly }</span>
									</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row my-4">
			<div class="col section">
				<div class="section-text">
					<p class="fs-4 fw-bold me-2 mt-3 mb-0">기본부터 실무까지 제시해주는 로드맵</p><span class="fw-bold">RoadMap!!</span><br>
					<p class="fs-6 mt-0 mb-3">아무것도 몰라도 따라오다 보면 전문가가 될 수 있어요!</p>				
				</div>
				<div class="card-group sub-slide">
					<c:forEach var="classList" items="${classDto }">
						<c:if test="${classList.difficultly eq '중급'}">
							<div class="card">
								<a class="d-block text-decoration-none text-secondary" href="course/${classList.no }">
									<img src="/resources/images/course/${classList.uploadfiles }" class="card-img-top" alt="...">
									<div class="card-body" style="min-height:136px;">
										<h5 class="card-title">${classList.title }</h5>
										<p class="card-text">${classList.teacherName }</p>
									</div>
									<ul class="list-group list-group-flush">
										<c:if test="${classList.discountPrice gt 0}">
											<li class="list-group-item border-0">
												<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${classList.price }</fmt:formatNumber></span>
												<span class="fs-5 fw-bold">&bsol; <fmt:formatNumber pattern="##,###">${classList.discountPrice }</fmt:formatNumber></span>
											</li>
										</c:if>
										<c:if test="${classList.price gt 0 && classList.discountPrice le 0}">
											<li class="list-group-item border-0">
												<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${classList.price }</fmt:formatNumber></span>
												<span class="fs-5 fw-bold">무료</span>
											</li>
										</c:if>
										<c:if test="${classList.price le 0 && classList.discountPrice le 0}">
											<li class="list-group-item border-0">
												<span class="fs-5 fw-bold">무료</span>
											</li>
										</c:if>
									</ul>
									<div class="card-footer">
										<span class="badge bg-success">${classList.difficultly }</span>
									</div>
								</a>
							</div>
						</c:if>
					</c:forEach>
				</div>
			</div>
		</div>
		<div class="row my-4 section-end">
			<div class="offset-3 col-3">
				<div class="py-3">
					<p class="fs-3"><span>813,481</span> 명이<br>인프런과 함께합니다.</p>
					<!-- 
					<span class="fs-6">
						학교에서 배우기 어렵거나 큰 비용을<br>
						지불해야만 배울 수 있는 전문적인 지식들을 제공합니다.<br>
						오픈 플랫폼의 이점을 통해 다양성과 경제성을 모두 높입니다.
					</span>
					 -->
				</div>
			</div>
			<div class="col-6">
				<div class="py-3">
					<span class="fs-6">
						학교에서 배우기 어렵거나 큰 비용을<br>
						지불해야만 배울 수 있는 전문적인 지식들을 제공합니다.<br>
						오픈 플랫폼의 이점을 통해 다양성과 경제성을 모두 높입니다.
					</span>				
				</div>
				<!-- <div class="vertical-slide my-3">
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
					<div class="card my-2">
						<div class="card-body" style="background:#e5e5e5;">
							<h5 class="card-title">비전공자를 위한 개발자 취업 올인원 가이드 [통합편]</h5>
							<p class="card-text">한정수</p>
						</div>
					</div>
				</div>
			</div> -->
		</div>
	</div>
<%@ include file="common/footer.jsp" %>
<script type="text/javascript">
	$(function(){
		$('.main-slide').slick({
			autoplay: true,
			autoplaySpeed: 5000,
			appendArrows:$(".slick-arrow"),
			prevArrow:"<button type='button' class='main-slick-prev'>&#60;</button>",
			nextArrow:"<button type='button' class='main-slick-next'>&#62;</button>"
		});	
		$('.sub-slide').slick({
			slidesToShow: 4,
			slidesToScroll: 4,
			prevArrow:"<button type='button' class='slick-prev'>&#60;</button>",
			nextArrow:"<button type='button' class='slick-next'>&#62;</button>"
		});
		$('.vertical-slide').slick({
			slidesToShow: 3,
			autoplay: true,
			arrows: false,
			centerMode: true,
			vertical: true
		});
	})
</script>
</body>
</html>