<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>지식공유자참여</title>
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
									<p class="fs-4 my-3 text-light fw-bold">나의 지식에 가치를 부여하세요</p>
									<span class="fs-6 text-light">전체 지식공유자 평균 수익 3025만원!!</span><br>
									<span class="fs-6 text-light">나의 지식을 나눠 사람들에게 배움의 기회를 주고, 의미있는 대가를 가져가세요.</span>
								</div>
							</div>
						  	<div class="col-6 m-0 p-0">
							  	<img height="320" alt="" src="/resources/images/main-slide1.gif">
						  	</div>
						</div>
					</div>
				  </div>
				</div>
			</div>
		</div>
	</div>
<div class="container">
	<div class="row mt-5">
		<div  class="d-grid gap-2 col-6 mx-auto">
		<btn class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#open-knowledge">지식공유참여</btn>
		</div>
	</div>
	<!-- 쿠폰함 모달창 -->
	<div class="modal fade" id="open-knowledge" tabindex="-1" aria-labelledby="couponBoxModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
				</div>
				<div class="modal-footer ">
				</div>
			</div>
		</div>
	</div>	
</div>
</body>
</html>