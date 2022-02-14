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
	<div class="p-5">
		<h5 class="text-secondary text-center"><strong>구매 상세내역</strong></br><small>(주문번호:${no})</small></h5>
		<table class="table table-hover row mt-5">
			<tr class="">
				<th class="text-center col-1">강의주문</br>상세번호</th> 
				<th class="text-center col-1"></th> 
				<th class="text-center col-2">강의명</th>
				<th class="text-center col-2">결제금액 
				<p><small class="text-secondary">(할인쿠폰/포인트/이벤트가 적용금액)</small></p>
				</th>
				<th class="text-center col-2"></th>
			</tr>
			<c:forEach var="orderItem" items="${orderItems}">
				<tr class="">
					<td class="text-center" >${orderItem.orderItemNo }</td>
					<td class="text-center"><img alt="" src="/resources/images/course/${orderItem.classImg}" style="width:100px; hight:100px;"></td>
					<td class="text-center"><strong>${orderItem.orderClassDetailName }</strong></td>
					<td class="text-center"><fmt:formatNumber pattern="##,###"> ${orderItem.orderDetailPrice }</fmt:formatNumber>원</td>
					<td class="text-center">
					<a href="/course/${orderItem.classNo}" class="text-black"><button type="button" class="btn btn-outline-success btn-sm mt-3" >강의보러가기</button> </a>
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</div>
</body>
</html>