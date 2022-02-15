<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
     <style type="text/css">
     	.profilebox {
         width: 30px;
         height: 30px; 
         border-radius: 100%;
         overflow: hidden;
     }
     .profileimg {
         width: 50%;
         height: 50%;
         object-fit: cover;
     }
     </style>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container-fluid section-bg">
	<div class="row bg-1">
		<div class="col">
			<div class="container">
				<nav class="navbar navbar-dashboard">
					<p class="fs-3 fw-bold my-2">대시보드</p>
				</nav>
			</div>
		</div>
	</div>
	<div class="row bg-2">
		<div class="col">
			<div class="container">
				<div class="row my-3">
					<div class="col-2">
						<%@ include file="../student-mypage-leftbar.jsp" %>
					</div>
					<div class="col-10">
						<div class="col-10 right-instructor">
							<div class="row">
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">${LOGIN_USER.name}님 프로필</h6>
												<a href="/profile" class="float-end text-secondary">프로필 수정하기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="card-text text-center">
												<div class="p-5">
												<!--  	<div class="profilebox">
												  		<img src="/resources/images/default_profile.png" class="profileimg" >
													</div>
												-->													
													<p class="mb-0 text-secondary fs-5">${LOGIN_USER.name}님, 오늘 하루 화이팅❤</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">최근 학습중인 강의</h6>
												<a href="/my-course?no=${LOGIN_USER.no}" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="p-3">
												<c:forEach var="classes" items="${classesList}" begin="0" end="2" step="1" varStatus="status" >
												<div>
													<p class="mb-0 my-1 fs-6 text-secondary">${status.count}. <small> ${classes.title}</small></p>
												</div>
												</c:forEach>
											</div>											<!-- 
											<div class="card-text p-2">
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
											</div>
											 -->
										</div>
									</div>
								</div>
							</div>
							<div class="row my-3">
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">작성한 글</h6>
												<a href="" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="p-3">
												<div>
													<p class="mb-0 my-1 fs-6 text-secondary"><small>질문답변 |</small> 자바가 너무 어려워요</p>
													<p class="mb-0 my-1 fs-6 text-secondary"><small>스터디 |</small> [강서구]스프링 스터디구합니다.</p>
													<p class="mb-0 my-1 fs-6 text-secondary"><small>자유주제 |</small> 스프링 강의 추천해주세요</p>
													<p class="mb-0 my-1 fs-6 text-secondary"><small>질문답변 |</small> RestTemplate관련 질문...</p>
												</div>
											</div>										
										</div>
											<!-- 
											<div class="card-text p-2">
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
											</div>
											 -->
										</div>
									</div>
								</div>
								<!-- 
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">강의 총 수익</h6>
												<a href="" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="card-text p-2 text-center">
												<div>
													<p class="mb-0">0 개</p>
												</div>
											</div>
											<div class="card-text p-2">
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
												<a href="#" class="card-link">Card link</a><br>
											</div>
											 -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>