<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title>카트</title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row mt-5">
		<div class="col-7 mt-3">
			<h3><strong>수강바구니</strong></h3>
			<ul class="nav">
				<li class="nav-item"><a class="m-1 text-black" data-bs-toggle="modal" data-bs-target="#couponBox">내 쿠폰함 > </a></li>					
				<li class="nav-item"><a class="m-1 text-black" data-bs-toggle="modal" data-bs-target="#withList">내 위시리스트🤍</a></li>	
			</ul>
			<table class="table table-hover mt-3">
				<tr>
					<th>사용가능한 쿠폰 : 3개</th>
				</tr>
				<tr>
					<td><a href="" id="coupon-check">20% | 가입환영20%할인 쿠폰</a></td>
				</tr>
				<tr>
					<td><a href="">20% | 가입환영20%할인 쿠폰</a></td>
				</tr>
				<tr>
					<td><a href="">20% | 가입환영20%할인 쿠폰</a></td>
				</tr>
			</table>
		</div>
		<div class="col-5 mt-3">
			<label id="">사용할 포인트</label>
			<div class="mt-1">
				<input class="form-control" type="number" id="point-use" placeholder="사용가능포인트 5000" min="0" max="5000" />
				<button class="btn btn-success">포인트적용</button>
			</div>
		</div>
	</div>
	<div class="row mt-4">
		<div class="col-7 mt-3">
			<div class="d-flex justify-content-between">
				<h3><strong>강의 정보</strong></h3>
				<a href="" class="mt-2 text-black" id="cart-delete">전체삭제</a>
			</div>
			<div class="row mt-3 border-top border-1">
				<div class="col-3 mt-3">
					<img class="rounded mx-auto d-block" alt="courceImg" src="/resources/images/course/sample10.png" style="width:120px; height:120px;">
				</div>
				<div class="col-7 mt-4">
					<h5>스위프트 1편 - 백엔드 어플개발 핵심기술</h5>
					<p>(수강기한: <strong>무제한</strong>)</p>
				</div>
				<div class="col-2 mt-4">
					<h5><strong>&#8361; 99,000</strong></h5>
					<button class="btn btn-outline-secondary btn-sm">위시리스트로 이동</button>
					<button class="btn btn-outline-secondary btn-sm mt-1">장바구니삭제</button>
				</div>
			</div>
			<div class="row mt-3 border-top border-1">
				<div class="col-3 mt-3">
					<img class="rounded mx-auto d-block" alt="courceImg" src="/resources/images/course/sample10.png" style="width:120px; height:120px;">
				</div>
				<div class="col-7 mt-4">
					<h5>스위프트 1편 - 백엔드 어플개발 핵심기술</h5>
					<p>(수강기한: <strong>무제한</strong>)</p>
				</div>
				<div class="col-2 mt-4">
					<h5><strong>&#8361; 99,000</strong></h5>
					<button class="btn btn-outline-secondary btn-sm">위시리스트로 이동</button>
					<button class="btn btn-outline-secondary btn-sm mt-1">장바구니삭제</button>
				</div>
			</div>
		</div>
		<div class="col-5 mt-3 ">
			<div class="border p-3">
				<form class="p-3" id="form-payment" action="/rest/payment">
					<input type="hidden" name="classNo" value="">
					<input type="hidden" name="classTitle" value="">
					<input type="hidden" name="classTitle" value="">
					<div class=" d-flex justify-content-between">
						<h4><strong>총계</strong></h4>
						<h4><strong>&#8361; 99,000</strong></h4>
					</div>
					<label class="form-label mt-2">이름</label>
					<input class="form-control" type="text" placeholder="이름을 적어주세요"/>
					<label class="form-label mt-2">휴대폰 번호</label>
					<input class="form-control" type="number" placeholder="01011112222"/>
					<label class="form-label mt-2">이메일주소</label>
					<input class="form-control" type="text" placeholder="example@naver.com"/>
					<label class="form-label mt-2">결제수단</label>
					<button class="form-control btn btn-outline-secondary" id="btn-kakao-pay">카카오페이로 결제하기</button>
				</form>
			</div>
		</div>
	</div>
<!-- 쿠폰함 모달창 -->
	<div class="modal fade" id="couponBox" tabindex="-1" aria-labelledby="couponBoxModalLabel" aria-hidden="true">
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
<!-- 쿠폰함 모달창 -->
	<div class="modal fade" id="withList" tabindex="-1" aria-labelledby="withListModalLabel" aria-hidden="true">
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
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
	
	$(function(){
		// 숫자가 아닌 정규식
		var replaceNotInt = /[^0-9]/gi;
	    
	    $("#point-use").on("focusout", function() {
	        var x = $(this).val();
	        if (x.length > 0) {
	            if (x.match(replaceNotInt)) {
	               x = x.replace(replaceNotInt, "");
	            }
	            if (x > 5000){
	            	x = x.replace(""); 
	            }
	            $(this).val(x);
	        }
	    }).on("keyup", function() {
	        $(this).val($(this).val().replace(replaceNotInt, ""));
	    });
	
	});

</script>
</body>
</html>