<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../common/tags.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title></title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" href="/resources/css/style-jgh.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://kit.fontawesome.com/067cf61548.js" ></script>
<script src="https://cdn.tiny.cloud/1/8a09qtqq8gwqfnj049ypv7aiyphqexh8n4rtbyw3xvs59wtj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<!-- 카카오 로그인지원 자바스크립트 라이브러리를 포함시킨다. -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<div class="container-fluid" id="navbar-container">
	<nav class="navbar navbar-expand-lg navbar-light">
		<div class="container">
			<a class="navbar-brand" href="/"><img width="140" src="/resources/images/logo.png"></a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item category-menu"><a class="nav-link" href="/course">강의</a>
						<ul class="navbar-nav is-boxed depth1" id="menu-1">
							<%-- 
							<li class="nav-item" id="sub-nav-item-${category.no }"><a class="nav-link" href="/course?no=${category.no }" data-menu-1="${category.no }">${category.name }</a>
								<ul class="navbar-nav is-boxed depth2" id="menu-2">
									<li class="nav-item"><a class="nav-link" href="/course" data-menu-2="${category.name }">개발</a>
										<ul class="navbar-nav is-boxed depth3">
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">Front-End</a></li>
											<li class="nav-item"><a class="nav-link" href="#">JavaScript</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
											<li class="nav-item"><a class="nav-link" href="#">HTML/CSS</a></li>
										</ul>
									</li>
								</ul>
							</li>
							 --%>
						</ul>
					</li>
					<li class="nav-item category-menu"><a class="nav-link" href="/community/questions">커뮤니티</a>
						<ul class="navbar-nav is-boxed depth1">
							<li class="nav-item"><a class="nav-link" href="/community/questions">질문&답변</a></li>
							<li class="nav-item"><a class="nav-link" href="/community/chats">자유주제</a></li>
							<li class="nav-item"><a class="nav-link" href="/community/studies">스터디</a></li>
						</ul>
					</li>
				</ul>
				<form id="form-search-class" class="d-flex" method="get" action="/course">

					<input type="hidden" name="category" value="${param.category }" />
					<input type="hidden" name="page" value="${param.page }" />
					<input class="form-control" name="value" value="${param.value }" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit" id="btn-search-class">Search</button>
				</form>
				<ul class="navbar-nav" id="navbar-right">
					<!-- 미로그인/지식공유미참여자 -->
					<li class="nav-item"><a class="nav-link btn btn-sm  m-1" href="/open-knowledge">지식공유참여</a></li>
					<!--// 미로그인/지식공유미참여자 -->
					<!-- 로그인시 -->
					<!-- 로그인/지식공유참여자 -->
					<!--// 로그인/지식공유참여자 -->
					<c:choose>
						<c:when test="${not empty LOGIN_USER}">
							<li class="nav-item mx-1">
							<li class="nav-item"><a class="nav-link" href="/carts"><i class="fas fa-shopping-cart text-black"></i></a></li>
							<li class="nav-item">	
								<a class="nav-link btn btn-outline-secondary btn-sm btn-login  m-1" href="/logout">로그아웃</a>
							</li>
							<li class="nav-item">
								<a class="nav-link btn btn-primary btn-sm btn-student m-1 text-white" href="/dashboard">학생</a>
							</li>							
							<c:if test="${LOGIN_USER.teacherStatus eq 'Y'}">
								<li class="nav-item">
									<a class="nav-link btn btn-success btn-sm m-1 text-white" href="/instructor/${LOGIN_USER.no }">지식공유자</a>
								</li>							
							</c:if>
							<c:if test="${LOGIN_USER.managerStatus eq 'Y'}">
								<li class="nav-item">
									<a class="nav-link btn btn-danger btn-sm m-1 text-white" href="/admin">관리자</a>
								</li>							
							</c:if>
						</c:when>
						<c:otherwise>
							<li class="nav-item mx-1"><a class="nav-link btn btn-outline-secondary btn-sm  m-1" id="btn-open-modal">로그인</a></li>
							<li class="nav-item"><a class="nav-link btn btn-primary btn-sm btn-join  m-1" href="registerUser">회원가입</a></li>						
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</nav>
<!-- 로그인 모달창 -->
	<div class="modal fade" id="model-login-form" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-sm modal-dialog-centered">
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
						<div class="text-center">
							<button type="button" class="btn" style="width:250px; color:#ffffff; background-color:#00C471;" id="btn-login">로그인</button>
						</div>
					</form>
					<div class="d-flex justify-content-center">
						<a href="registerUser" class="text-reset p-2" title="Tooltip">회원가입</a>
					</div>
				</div>
				<div class="p-3">
	    		   <div class="text-center border-top">
	    		   <p class="mt-3">SNS 로그인</p>
				    	<div class="alert alert-danger d-none" id="alert-kakao-login">오류 메세지</div>
			    		<div class="p-3 mb-4">
				    		<%-- 
				    			카카오 로그인 처리중 중 오류가 발생하면 아래 경고창에 표시된다.
				    			카카오 로그인 오류는 스크립트에서 아래 경고창에 표시합니다.
				    		 --%>
							    		
			    			<a id="btn-kakao-login" href="/kakao/login">
			  					<img src="//k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200;" alt="카카오 로그인 버튼"/>
							</a>
			    		</div>
	    		   </div>
		    		<form id="form-kakao-login" method="post" action="/kakao-login">
		    			<input type="hidden" name="email"/>
		    			<input type="hidden" name="name"/>
		    			<input type="hidden" name="img"/>
		    		</form>
				</div>
			</div>
		</div>
	</div>
</div>
<script type="text/javascript">


// 일반로그인
$(function(){
	
	var loginModal = new bootstrap.Modal(document.getElementById('model-login-form'));

	
	var kakaoLoginFail = '${param.error}';
	if (kakaoLoginFail == 'deleted') {
		$("#alert-error-login").addClass("d-none").text('');
		$("#alert-kakao-login").addClass("d-none").text("");
		loginModal.show();
		$("#alert-kakao-login").removeClass("d-none").text("탈퇴처리된 회원입니다.");
	}
	
	$("#btn-open-modal").click(function(e) {
		e.preventDefault();
		$("#alert-error-login").addClass("d-none").text('');
		$("#alert-kakao-login").addClass("d-none").text("");
		loginModal.show();
	});
	
	
	$("#btn-login") .click(function() {
			$("#alert-error-login").hide();
			
			var email = $("#login_email").val()
			var password = $("#login_password").val()
			if (email == "" || password == "") {
				$("#alert-error-login").show().text('이메일과 비밀번호를 입력해주세요');
				return;
			}

			$.ajax({
				type : "POST",
				url : "/rest/login",
				dataType : "json",
				data : {
					email : email,
					password : password
				},
				success : function(response) {
					if (response.status == "OK") {
						// 로그인 성공시
						location.reload(true);
					} else {
						//로그인 실패시.
						$("#alert-error-login").show().text(response.error);
					}
				}
			})
		})
	})
// 카카오로그인
$(function(){

	$("#btn-kakao-login").click(function(event){
		// a태그 기능 실행멈춤.
		event.preventDefault();
		// 카카오 로그인 실행시 오류메시지를 표시하는 경고창을 화면에 보이지 않게 한다.
		$("alert-kakao-login").addClass("d-none");
		// 사용자 키를 전달, 카카오 로그인 서비스 초기화.
		Kakao.init('4a1f45c20d88beb59ab3913180c0a056');
		// 카카오 로그인 서비스 실행하기 및 사용자 정보 가져오기.
		Kakao.Auth.login({
			success:function(auth){
				Kakao.API.request({
					url: '/v2/user/me',
					success: function(response){
						// 사용자 정보를 가져와서 폼에 추가.
						var account = response.kakao_account;
						
						$('#form-kakao-login input[name=email]').val(account.email);
						$('#form-kakao-login input[name=name]').val(account.profile.nickname);
						$('#form-kakao-login input[name=img]').val(account.profile.img);
						// 사용자 정보가 포함된 폼을 서버로 제출한다.
						document.querySelector('#form-kakao-login').submit();
					},
					fail: function(error){
						// 경고창에 에러메시지 표시
						$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
					}
				}); // api request
			}, // success 결과.
			fail:function(error){
				// 경고창에 에러메시지 표시
				$('alert-kakao-login').removeClass("d-none").text("카카오 로그인 처리 중 오류가 발생했습니다.")
			}
		}); // 로그인 인증.
	}) // 클릭이벤트
})// 카카오로그인 끝.

// 강의 메뉴를 생성하는 함수
$(function(){
	$.getJSON("/rest/topCategoryList.do", function(categoryList) {
		let $categoryUl = $("#menu-1")
		
		$.each(categoryList, function(index, category){
			let no = category.no;
			let name = category.name;
			let parentNo = category.parentNo;
			let $li = $('<li class="nav-item" id="nav-item-'+no+'"><a class="nav-link" href="/course?category='+name+'" data-menu-1="'+no+'">'+name+'</a><ul class="navbar-nav is-boxed depth2"></ul></li>');
			$categoryUl.append($li);
			
			$.getJSON("/rest/subCategoryList.do", {no:no}, function(subCategoryList){
				let $subcategoryUl = $li.find('ul');
				
				$.each(subCategoryList, function(index, subCategory) {
					let subNo = subCategory.no;
					let subName = subCategory.name;
					let $subLi = $('<li class="nav-item" id="sub-nav-item-'+subNo+'"><a class="nav-link" href="/course?category='+subName+'" data-menu-2="'+subNo+'">'+subName+'</a><ul class="navbar-nav is-boxed depth3"></ul></li>');
					$subcategoryUl.append($subLi);
					
					$.getJSON('/rest/subCategoryList.do', {no:subNo}, function(secondSubCategoryList) {
						
						if (secondSubCategoryList.length) {
							let $secondSubcategoryUl =  $subcategoryUl.find("ul").eq(index);
						
							$.each(secondSubCategoryList, function(index, secondSubCategory) {
				           	 	let secondSubNo = secondSubCategory.no;
					            let secondSubName = secondSubCategory.name;
					            let secondSubLi = '<li class="nav-item" id="sub-nav-item-'+secondSubNo+'"><a class="nav-link" href="/course?category='+secondSubName+'" data-menu-3="'+secondSubNo+'">'+secondSubName+'</a></li>';   
					            $secondSubcategoryUl.append(secondSubLi);
								
							})
						
							
						} 

			         })	
				})
			});
		})
	})
});

//검색버튼을 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
$("#btn-search-class").click(function() {
	// 입력값을 조회한다.
	var value = $.trim($(":input[name=value]").val());
	
	// 입력값이 존재하면 페이지번호를 1로 설정하고 폼에서 onsubmit 이벤트를 발생시켜서 폼 입력값이 서버로 제출되게 한다.
	if(value){
		$(":input[name=page]").val("1");
		$("#form-search-class").trigger("submit");
	} else {
		alert("검색조건 혹은 검색어를 입력하세요");					
	}
	
});
</script>
</body>
</html>