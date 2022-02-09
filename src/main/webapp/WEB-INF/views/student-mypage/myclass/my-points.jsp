<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container">
  	<div class="row mt-3">
		<div class="col-3">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-9 my-4">
			<div class="">
				<h5>현재사용가능 포인트 <strong class="text-success">${LOGIN_USER.point}</strong></h5>
				<a class="m-1 text-black" data-bs-toggle="modal" data-bs-target="#how-to-get">포인트받는 법</a>
			</div>
		</div>
	<!-- 포인트받는 법모달창 -->
		<div class="modal fade" id="how-to-get" tabindex="-1" aria-labelledby="pointModalLabel" aria-hidden="true">
			<div class="modal-dialog modal-lg modal-dialog-centered">
				<div class="modal-content">
					<div class="modal-header d-flex justify-content-between">
						<h6>포인트 적립안내</h6>
						<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					</div>
					<div class="modal-body">
						<div class="mt-3">
							<h3><strong>수강평을 남겨주세요 +300</strong></h3>
							<p><small>솔직하고 자세한 수강평은 강의를 만드는 지식공유자, 그리고 앞으로 강의를 듣게 될 예비 수강생 모두에게 도움이 됩니다. 멋진 수강평을 남기고 포인트도 받아 가세요! (단, 수강평 포인트는 하루에 3번까지만 지급됩니다.)</small></p>
						</div>
						<div class="mt-5">
							<h3><strong>내 질문이 좋아요를 받는다면 +10</strong></h3>
							<p><small>내가 궁금했던 부분을 다른 누군가도 궁금해할 수 있겠죠? 내가 올린 질문은 다른 수강생들에게 유용한 참고가 될 수 있어요. 내 질문이 좋아요를 받을 때마다 10 포인트를 받게 됩니다.</small></p>
						</div>
						<div class="mt-5">
							<h3><strong>내 답변이 좋아요를 받는다면 +10</strong></h3>
							<p><small>내가 아는 내용의 질문이 올라오면 직접 답변을 작성할 수 있어요. 학습 중 어려움을 겪는 또 다른 수강생에게 큰 도움이 된답니다! 답변이 좋아요를 받을 때마다 10 포인트를 받게 됩니다.</small></p>
						</div>
					</div>
					<div class="modal-footer ">
					</div>
				</div>
			</div>
		</div>	
	</div>
</div>
</body>
</html>