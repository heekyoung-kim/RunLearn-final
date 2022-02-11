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
		<div class="col-3">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-9 my-4">
			<table class="table">
				<tr>
					<th class="text-center">주문번호</th>
					<th class="text-center">주문날짜</th>
					<th class="text-center">주문상태</th>
					<th class="text-center">주문명</th>
					<th class="text-center">결재금액</th>
					<th class="text-center">결제수단</th>
				</tr>
				<tr>
					<td class="text-center">15000</td>
					<td class="text-center">2022-01-17</td>
					<td class="text-center">결제완료</td>
					<td class="text-center"><strong>예제로 공부하는 파이썬</strong></td>
					<td>            
						<p class="text-end p-0 my-0">₩49,500</p>
            			<p class="text-end border-bottom  p-0 my-0">- ₩49,500</p>
          				<p class="text-end  p-0">₩0</p>
          			</td>
					<td  class="text-center">카드</td>
				</tr>
				<tr>
					<td class="text-center">15000</td>
					<td class="text-center">2022-01-17</td>
					<td class="text-center">결제완료</td>
					<td class="text-center"><strong>예제로 공부하는 파이썬</strong></td>
					<td>            
						<p class="text-end p-0 my-0">₩49,500</p>
            			<p class="text-end border-bottom  p-0 my-0">- ₩49,500</p>
          				<p class="text-end  p-0">₩0</p>
          			</td>
					<td  class="text-center">카드</td>
				</tr>
			</table>
		</div>
	</div>
</div>
</body>
</html>