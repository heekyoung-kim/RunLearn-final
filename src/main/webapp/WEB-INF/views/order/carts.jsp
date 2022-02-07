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
			<div class="mt-3 border-bottom border-1">
				<h6>사용가능한 쿠폰 : ${couponTotal} 개</h6>
			</div>
			<div id="user-coupon-box">
				<div class="form-check mt-3">
				  <input class="form-check-input" type="radio" name="userCoupon" id="not-use" value="-1" checked>
				  <label class="form-check-label" for="not-use">
				    쿠폰사용안함
				  </label>
				</div>
				<c:forEach var="coupon" items="${coupons}">	
					<c:choose>
						<c:when test="${coupon.discountRate eq 0}">					
							<c:if test="${coupon.useStatus eq 'N'}">
							<div class="form-check">
							  <input class="form-check-input" type="radio" name="userCoupon" id="coupon-check-${coupon.userCouponNo}" data-coupon-type="price" data-discount="${coupon.discountPrice}" value="${coupon.userCouponNo}">
							  <label class="form-check-label" for="coupon-check-${coupon.userCouponNo}">
							    ${coupon.couponName}
							  </label>
							</div>
							</c:if>
						</c:when>
						<c:otherwise>
						<div class="form-check">
						  <input class="form-check-input" type="radio" name="userCoupon" id="coupon-check-${coupon.userCouponNo}" data-coupon-type="rate"data-discount="${coupon.discountRate}" value="${coupon.userCouponNo}">
						  <label class="form-check-label" for="coupon-check-${coupon.userCouponNo}">
						    ${coupon.discountRate} % | ${coupon.couponName}
						  </label>
						</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>	
		</div>
		<div class="col-5 mt-3">
			<label id="">사용할 포인트</label>
			<div class="mt-1">
				<input type="hidden" name="user_point" value="${LOGIN_USER.point}"/>
				<input class="form-control" type="number" id="point-use"  placeholder="사용가능포인트 ${LOGIN_USER.point}" min="0" max="5000" />
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
			<c:forEach var="cart" items="${carts}">
				<div class="row mt-3 border-top border-1" id="cart-item-${cart.cartNo}">
					<div class="col-3 mt-3" >
						<img class="rounded mx-auto d-block" alt="courceImg" src="/resources/images/course/${cart.img}" style="width:120px; height:120px;">
					</div>
					<div class="col-7 mt-4">
						<h5> ${cart.classTitle}</h5>
						<c:choose>
							<c:when test="${not empty cart.period }">
								<p>(수강기한: <strong>${cart.period}개월</strong>)</p>
							</c:when>
							<c:otherwise>
								<p>(수강기한: <strong>무제한</strong>)</p>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="col-2 mt-4">
					<c:choose>
						<c:when test="${cart.discountPrice gt 0}">
							<h5><del>&#8361;<fmt:formatNumber pattern="##,###">${cart.price}</fmt:formatNumber></del></h5>
							<h5 data-price="${cart.discountPrice}">&#8361;<strong><fmt:formatNumber pattern="##,###">${cart.discountPrice}</fmt:formatNumber></strong></h5>
						</c:when>
						<c:otherwise>
							<h5 data-price="${cart.price}">&#8361;<strong><fmt:formatNumber pattern="##,###">${cart.price}</fmt:formatNumber></strong></h5>
						</c:otherwise>
					</c:choose>
						<button class="btn btn-outline-secondary btn-sm" id="go-wishList" data-no="${cart.cartNo}" data-class-no="${cart.classNo}">위시리스트로 이동</button>
						<button class="btn btn-outline-secondary btn-sm mt-1 "id="delete-cartItem" data-no="${cart.cartNo}">장바구니삭제</button>
					</div>
				</div>
			</c:forEach>
		</div>
		<div class="col-5 mt-3 ">
			<div class="border p-3">
				<form class="p-3" id="form-payment" action="/rest/payment">
					<input type="hidden" name="classNo" value="">
					<input type="hidden" name="classTitle" value="">
					<input type="hidden" name="classTitle" value="">
					<div class=" d-flex justify-content-between">
						<h4><strong>총계</strong></h4>
						<h4 id="total-price"> &#8361; <strong><fmt:formatNumber pattern="##,###">${cartTotalPrice}</fmt:formatNumber></strong></h4>
					</div>
					<label class="form-label mt-2">이름</label>
					<input class="form-control" type="text" name="name" value="${LOGIN_USER.name}" placeholder="dddd"/>
					<label class="form-label mt-2">휴대폰 번호</label>
					<input class="form-control" type="number" name="tel" value="${LOGIN_USER.tel}" placeholder="01012345678"/>
					<label class="form-label mt-2">이메일주소</label>
					<input class="form-control" type="text" name="email" value="${LOGIN_USER.email}"/>
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
<!-- 위시리스트 모달창 -->
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
	
	// 가격에 쿠폰적용하기.
	$('input[name="userCoupon"]').change(function(){
		var value = $(this).val();  // 쿠폰번호 -> 결제시 넘기기.
		var couponType = $(this).data("coupon-type");
		var amount = $(this).data("discount");
		var totalPrice = parseInt($("#total-price strong").text().trim().replace(/,/g, ''));
		
		if(couponType == 'price'){
			totalPrice -= amount
		} else if (couponType == "rate"){
			totalPrice -= (totalPrice*amount/100)
		}
		 $("#total-price strong").text(totalPrice.toLocaleString());
	})	
	
	// 위시리스트로 이동
	$(function(){
		$("#go-wishList").click(function(){
			var no = $(this).data("no"); //cartNo 값 넘기기 => cart삭제.
			var classNo = $(this).data("class-no");
			$("#cart-item-"+no).remove;
		$.ajax({
			type: "Post"
			,url:"/rest/addWishList"
			,dataType:"json"
			,data: {
				classNo: classNo
			},
			success:function(response){
				if(response.status=="OK"){
					location.reload(true);
				}else{
					alert(response.error);
				}
			}
		
		})
		})
	})
	
	// 장바구니삭제
	$(function(){
		$("#delete-cartItem").click(function(){
			var no = $(this).data("no"); // cartNo로 삭제하기.
			$("#cart-item-"+no).remove;
			$.ajax({
				type:"Post"
				,url:"/rest/deleteCart"
				,dataType:"json"
				,data:{
					cartNo: no
				},
				success: function(response){
					if(response.status == "OK"){
						location.reload(true);
					}else{
						alert(response.error);
					}
				}
			})
			
		})
	})
	
</script>
</body>
</html>