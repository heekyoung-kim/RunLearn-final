<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp" %>
<!DOCTYPE html>
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <link rel="stylesheet" href="/resources/css/style-jgh.css" />
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	 <script src="https://kit.fontawesome.com/067cf61548.js" crossorigin="anonymous"></script>
</head>
<body>
<div class="container-fluid" id="navbar-container">
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand" href="#"><img width="140" src="/resources/images/logo.png"></a>
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item category-menu">
						<a class="nav-link" href="#">강의</a>
						<ul class="navbar-nav is-boxed depth1">
							<li class="nav-item">
								<a class="nav-link" href="#">개발&middot;프로그래밍</a>
								<ul class="navbar-nav is-boxed depth2">
									<li class="nav-item">
										<a class="nav-link" href="#">웹개발</a>
										<ul class="navbar-nav is-boxed depth3">
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
										</ul>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">웹개발</a>
										<ul class="navbar-nav is-boxed depth3">
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
										</ul>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">웹개발</a>
										<ul class="navbar-nav is-boxed depth3">
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
										</ul>
									</li>
									<li class="nav-item">
										<a class="nav-link" href="#">웹개발</a>
										<ul class="navbar-nav is-boxed depth3">
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
										</ul>
									</li>
								</ul>
							</li>
						</ul>
					</li>
				</ul>
				<form class="d-flex">
					<input class="form-control me-2" type="search"
						placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
				<ul class="navbar-nav" id="navbar-right">
					<!-- 미로그인/지식공유미참여자 -->
					<li class="nav-item"><a class="nav-link btn btn-sm" href="#">지식공유참여</a></li>
					<!--// 미로그인/지식공유미참여자 -->
					<!-- 로그인시 -->
						<!-- 로그인/지식공유참여자 -->
					<li class="nav-item"><a class="nav-link btn btn-success btn-sm btn-recent" href="#">최근강의</a></li>
						<!--// 로그인/지식공유참여자 -->
					<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-shopping-cart"></i></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><i class="fas fa-bell"></i></a></li>
					<li class="nav-item">
						<a class="nav-link profile-cover p-0" href="#"><img src="/resources/images/default_profile.png"></a>
					</li>
					<!--// 로그인시 -->
					<li class="nav-item mx-1"><a class="nav-link btn btn-outline-secondary btn-sm btn-login" href="#">로그인</a></li>
					<li class="nav-item"><a class="nav-link btn btn-primary btn-sm btn-join" href="#">회원가입</a></li>
				</ul>
			</div>
		</div>
	</nav>
</div>
<script type="text/javascript">
	$(function(){
	});
</script>