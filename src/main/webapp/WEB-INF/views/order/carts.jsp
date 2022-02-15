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
							<c:if test="${coupon.useStatus eq 'N'}">
								<div class="form-check">
								  <input class="form-check-input" type="radio" name="userCoupon" id="coupon-check-${coupon.userCouponNo}" data-coupon-type="rate"data-discount="${coupon.discountRate}" value="${coupon.userCouponNo}">
								  <label class="form-check-label" for="coupon-check-${coupon.userCouponNo}">
								    ${coupon.discountRate} % | ${coupon.couponName}
								  </label>
								</div>
							</c:if>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>	
		</div>
		<div class="col-5 mt-3">
			<c:if test="${not empty carts}">
				<label id="">사용할 포인트</label>
				<div class="mt-1">
					<input class="form-control" type="number" id="point-use"  placeholder="사용가능포인트 ${LOGIN_USER.point}" value = "0" min="0" max="${LOGIN_USER.point}" />
				</div>
			</c:if>
		</div>
	</div>
	<c:choose>
		<c:when test="${empty carts}">
			<div class="row mt-5">
				<div  class="d-grid gap-2 col-6 mx-auto">
				<span>바구니에 담긴 강의가 없습니다.</span>
				<a href="/course" class="btn btn-success">강의 둘러보기</a>
				<a href="/wishlist" class="btn btn-primary">위시리스트가기</a>
				</div>
			</div>
		</c:when>
		<c:otherwise>
			<div class="row mt-4">
				<div class="col-7 mt-3">
					<div class="d-flex justify-content-between">
						<h3><strong>강의 정보</strong></h3>
						<button type="button" class="btn btn-sm mt-2 text-black" id="delete-cartItems">전체삭제</button>
					</div>
					<c:forEach var="cart" items="${carts}">
						<div class="row mt-3 border-top border-1" id="cart-item-${cart.cartNo}" data-no ="${cart.cartNo}">
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
								<button class="btn btn-outline-secondary btn-sm" id="go-wishList-${cart.cartNo}" data-no="${cart.cartNo}" data-class-no="${cart.classNo}">위시리스트로 이동</button>
								<button class="btn btn-outline-secondary btn-sm mt-1 "id="delete-cartItem-${cart.cartNo}" data-no="${cart.cartNo}">장바구니삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
				<div class="col-5 mt-3 ">
					<div class="border p-3">
						<form class="p-3" id="form-payment">
							
							<div class=" d-flex justify-content-between border-bottom">
								<h4><strong>총 결재금액</strong></h4>
								<h4> &#8361; <strong id="total-pay-price"><fmt:formatNumber pattern="##,###">${cartTotalPrice}</fmt:formatNumber></strong></h4>
							</div>
							<div class=" d-flex justify-content-between mt-3">
								<h6>구매 금액</h6>
								<h6> &#8361; <strong id="total-price"><fmt:formatNumber pattern="##,###">${cartTotalPrice}</fmt:formatNumber></strong></h6>
							</div>
							<div class=" d-flex justify-content-between">
								<h6>쿠폰할인 </h6>
								<h6> &#8361; <strong id="coupon-amount"><fmt:formatNumber pattern="##,###">0</fmt:formatNumber></strong></h6>
							</div>
							<div class=" d-flex justify-content-between border-bottom">
								<h6>포인트할인 </h6>
								<h6> &#8361; <strong id="point-amount"><fmt:formatNumber pattern="##,###">0</fmt:formatNumber></strong></h6>
							</div>
							<label class="form-label mt-4">이름</label>
							<input class="form-control" type="text" name="pay-name" value="${LOGIN_USER.name}" placeholder="이름을 적어주세요."/>
							<label class="form-label mt-2">휴대폰 번호</label>
							<input class="form-control" type="number" name="pay-tel" value="${LOGIN_USER.tel}" placeholder="01012345678"/>
							<label class="form-label mt-2">이메일주소</label>
							<input class="form-control" type="text" name="pay-email" value="${LOGIN_USER.email}"/>
							<label class="form-label mt-2">결제수단</label>
							<button class="form-control btn btn-outline-secondary" type="button" id="btn-kakao-pay">카카오페이로 결제하기</button>
						</form>
					</div>
				</div>
			</div>		
		</c:otherwise>
	</c:choose>

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

	// 포인트, 쿠폰 적용해서 총 결제금액 변경. 
	// 하나의 값에 여러 기능이 포함되어있다면 하나의 function에 합쳐서 구현.
	$(function(){
		const orginalTotalPrice = parseInt($("#total-price").text().replace(/,/g, ''));
		//쿠폰
		$('input[name="userCoupon"]').change(function(){
			changeTotalPrice();
		})	
		
		//포인트
		$("#point-use").on("keyup",function(){
			changeTotalPrice();
		})
		
		function changeTotalPrice(){
			var $radio = $(":radio[name='userCoupon']:checked");
			var type = $radio.data("coupon-type");
			var discountValue = $radio.data("discount");
			var amount = 0;
			if (type == 'price') {
				amount = parseInt(discountValue);
			}else if (type == 'rate') {
				amount = parseInt(orginalTotalPrice*discountValue/100);
			}

			$("#coupon-amount").text(amount.toLocaleString());
			var totalPayPrice = orginalTotalPrice - amount;
			
			var $pointUse = $("#point-use");
			var maxPoint = parseInt($pointUse.attr("max"));
			var minPoint = 0
			var point = parseInt($pointUse.val());
			if (point) {
				if (point > maxPoint) {
					$pointUse.val(maxPoint);
					point = maxPoint;
				}
				if (point <= 0) {
					$pointUse.val(minPoint);
					point = 0;
				}
				totalPayPrice -= point;
				
				$("#point-amount").text(point.toLocaleString());				
			}

			$("#total-pay-price").text(totalPayPrice.toLocaleString());
			
		}
	})
	
	// 위시리스트로 이동
	$(function(){
		$(".btn[id^=go-wishList]").click(function(){
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
		$(".btn[id^=delete-cartItem]").click(function(){
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
	// 장바구니 전체삭제.
	$(function(){
		$("#delete-cartItems").click(function(){
			alert("모든 카트아이템을 삭제하시겠습니까?");
			$.ajax({
				type:"Post"
				,url:"/rest/deleteCarts"
				,dataType:"json"
				,success:function(response){
					if(response.status == "OK"){
						location.reload(true);
					}else{
						alert(response.error);
					}
				}
			})
		})
	})
	
	// 카카오결제
	$(function(){
		$("#btn-kakao-pay").click(function(){
			
			// 필수입력값을 확인.
			var name = $("#form-payment input[name='pay-name']").val();
			var tel = $("#form-payment input[name='pay-tel']").val();
			var email = $("#form-payment input[name='pay-email']").val();
			
			if(name == ""){
				$("#form-payment input[name='pay-name']").focus()
			}
			if(tel == ""){
				$("#form-payment input[name='pay-tel']").focus()
			}
			if(email == ""){
				$("#form-payment input[name='pay-email']").focus()
			}
			
			// 결제 정보를 form에 저장한다.
			let totalPayPrice = parseInt($("#total-pay-price").text().replace(/,/g,''))
			let totalPrice = parseInt($("#total-price").text().replace(/,/g,''))
			let discountPrice = totalPrice - totalPayPrice 
			let usePoint = $("#point-use").val()
			let useUserCouponNo = $(":radio[name='userCoupon']:checked").val()
			
			// 카카오페이 결제전송
			$.ajax({
				type:'get'
				,url:'/order/pay'
				,data:{
					total_amount: totalPayPrice
					,payUserName: name
					,sumPrice:totalPrice
					,discountPrice:discountPrice
					,totalPrice:totalPayPrice
					,tel:tel
					,email:email
					,usePoint:usePoint
					,useCouponNo:useUserCouponNo	
					
				},
				success:function(response){
					location.href = response.next_redirect_pc_url			
				}
			})
		})
	})

</script>
</body>
</html>