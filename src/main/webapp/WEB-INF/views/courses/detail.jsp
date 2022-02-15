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
		.btn.btn-go-study{background:#00c471; color:#fff;}
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
							<img src="/resources/images/course/${classes.uploadfiles }" class="card-img-top" alt="...">
						</div>
					</div>
					<div class="col-7 text-box">
						<div class="text-content">
							<span class="badge bg-secondary">New</span> <span>${classes.categoryName }</span>
							<p class="fs-4 m-2">${classes.title }</p>
							<span>★★★★★(4.9) 138개의 수강평&middot;1636명의 수강생</span><br>
							<span>${classes.teacherName }</span>
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
					<c:if test="${LOGIN_USER.managerStatus eq 'Y'}">
						<li class="nav-item">
							<a  href="/admin/adminClass"><button class="btn btn-primary btn-sm m-1">뒤로</button></a>
						</li>							
					</c:if>
				</div>
			</nav>
		</div>
	</div>
	<div class="row">
		<div class="col-8">
			<p class="fs-3"><strong>${classes.difficultly }자</strong>를 위해 준비한<br><strong>[${classes.categoryName }] 강의입니다.</strong></p>
			<div>
				${classes.content }
			</div>
		</div>
		<div class="col-4">
			<div class="card card-floating" style="width: 18rem;">
				<c:choose>
					<c:when test="${empty savedProgress}">
						<div class="card-body">
							<c:if test="${classes.discountPrice gt 0 }">
								<h3 class="card-title"><strong><fmt:formatNumber pattern="##,###">${classes.discountPrice }</fmt:formatNumber>원</strong></h3>
								<a href="#" class="btn btn-apply w-100 fs-6 fw-bold my-3 py-2" data-no="${classes.no }" id="is-priced">수강신청</a><br>
							</c:if>
							<c:if test="${classes.price le 0 || classes.discountPrice le 0 }">
								<form method="post" action="insert-progress" id="free-form">
									<input type="hidden" name="no" value="${classes.no }" />
									<h3 class="card-title"><strong>무료</strong></h3>
									<button type="submit" class="btn btn-apply w-100 fs-6 fw-bold my-3 py-2" id="is-free">바로 학습하기</button><br>
								</form>
							</c:if>
							<button class="btn btn-warning text-white w-100 fs-6 fw-bold my-1 py-2" id="wishlist-add" data-no="${classes.no }">위시리스트담기</button> 
						</div>
					</c:when>
					<c:otherwise>
						<div class="card-body">
							<h3 class="card-title">학습중</h3>
							<a href="" class="btn btn-go-study w-100 fs-6 fw-bold my-3 py-2" data-no="${classes.no }">이어학습하기</a><br>
							<a href="" class="card-link">공유하기</a><br>
						</div>
					</c:otherwise>
				</c:choose>
				<div class="card-footer">
					<span>&middot; 지식공유자: </span>${classes.teacherName }<br>
					<span>&middot; 총 10개 수업</span><br>
					<span>&middot; 수강기한: 1 개월</span><br>
					<span>&middot; ${classes.difficultly } 대상</span>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
<script>

// 장바구니담기
$("#is-priced").click(function(){
	var classNo = $(this).data("no")
	$.ajax({
		type:"Post"
		,url:"/rest/addCart"
		,dataType:"json"
		,data:{
			classNo: classNo
		}
		,success:function(response){
			if(response.status == "OK"){
				alert("수강바구니에 추가되었습니다.")
			}else{
				alert(response.error);
			}
			
		}
	})
})

// 위시리스트 담기
$("#wishlist-add").click(function(){
	var classNo = $(this).data("no")
	$.ajax({
		type:"Post"
		,url:"/rest/addWishList"
		,dataType:"json"
		,data:{
			classNo: classNo
		}		
		,success:function(response){
			if(response.status == "OK"){
				alert("위시리스트에 추가되었습니다.")
			}else{
				alert(response.error);
			}
		}
	})
})

function freeForm() {
	$("#free-form").submit();
}
  </script>
</body>
</html>