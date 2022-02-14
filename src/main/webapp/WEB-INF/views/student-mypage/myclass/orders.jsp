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
<div class="container">
  	<div class="row mt-3">
		<div class="col-2">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-10 my-4">
			<table class="table row">
				<tr class="">
					<th class="text-center col-1">주문번호</th>
					<th class="text-center col-2">주문날짜</th>
					<th class="text-center col-2">주문상태</th>
					<th class="text-center col-3">주문명</th>
					<th class="text-center col-1">결재금액</th>
					<th class="text-center col-2">결제수단</th>
				</tr>
				<c:forEach var="order" items="${orders}">
					<tr>
						<td class="text-center ">${order.orderNo }</td>
						<td class="text-center "><fmt:formatDate value="${order.orderDate}" pattern="yyyy년 MM월 d일 hh:mm:ss"/></td>
						<td class="text-center ">${order.orderState }</td>
						<td class="text-center">
						<a href="/orders/detail/${order.orderNo}" class="text-black"><strong >${order.orderClassName }</strong></a>
						</td>
						<td>            
							<p class="text-end p-0 my-0">₩ ${order.sumPrice}</p>
	            			<p class="text-end border-bottom  p-0 my-0"><small>- ₩ ${order.discountPrice}</small></p>
	          				<p class="text-end  p-0">₩ ${order.orderPrice}</p>
	          			</td>
						<td  class="text-center">${order.payMethod}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
</div>
</body>
</html>