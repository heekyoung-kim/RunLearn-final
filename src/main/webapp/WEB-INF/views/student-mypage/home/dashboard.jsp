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
												<h6 class="mb-0 fw-bold">총 강의 수</h6>
												<a href="../instructor/courses/${LOGIN_USER.no }" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="card-text p-2 text-center">
												<div>
													<p class="mb-0">${classCount } 개</p>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">평점</h6>
												<a href="" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="card-text p-2 text-center">
												<div>
													<p class="mb-0">0 개</p>
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
							</div>
							<div class="row my-3">
								<div class="col-6">
									<div class="card">
										<div class="card-header border-bottom p-2 mb-0">
											<div class="card-title mb-0">
												<h6 class="mb-0 fw-bold">총 학생 수</h6>
												<a href="" class="float-end text-secondary">더 보기 >></a>
											</div>
										</div>
										<div class="card-body p-0">
											<div class="card-text p-2 text-center">
												<div>
													<p class="mb-0">0 개</p>
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