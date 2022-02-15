<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<script src="https://cdn.tiny.cloud/1/8a09qtqq8gwqfnj049ypv7aiyphqexh8n4rtbyw3xvs59wtj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	<style>
		.section-bg .bg-1{background:#333b3d;}
		.section-bg .bg-2{background:#f7f7f7; height:100vh;}
		.navbar-dashboard p{color:#fff;}
	
		.left-side dt{font-size:.8rem; color:#cfcfcf;}
		.left-side dd a{display:block; color:#454545; text-decoration:none;}
		.left-side dd.active a{font-weight:700; color:#1dc078;}
		.left-side dd:hover{background:#fff;}
		.left-side dd.active:hover a{color:#454545;}
		
		.right-instructor .card{height:182px; border-radius:8px; flex-direction:column;}
		.right-instructor .card-header{background:transparent;}
		.right-instructor .card-header .card-title h6{display:inline-block;}
		.right-instructor .card-header .card-title a{font-size:.9rem; text-decoration:none;}
		.right-instructor .card-body{display:flex; width:100%; height:100%;}
		.right-instructor .card-body .card-text{position:relative; width:100%; height:100%;}
		.right-instructor .card-body .card-text div{display:flex; justify-content:center; align-items:center; flex-direction:column; width:100%; height:100%;}
		.right-instructor .card-body p{font-weight:700; font-size:1.5rem; color:#adb5bd;}
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
						<%@ include file="../teacher-mypage-leftbar.jsp" %>
					</div>
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
												<p class="mb-0">0 점</p>
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
												<p class="mb-0">0 명</p>
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
												<p class="mb-0">0 원</p>
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
<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">
</script>
</body>
</html>