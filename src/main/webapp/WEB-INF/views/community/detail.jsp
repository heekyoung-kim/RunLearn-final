<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.tiny.cloud/1/8skivbyd7udegec2bybilvg217boq2t339ot1k4o01qx26op/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<style>

</style>
</head>
<body>
	<%@ include file="../common/nav.jsp"%>
	<div class="container">
		<div class="row mb-3">
			<div class="col">
				<div class="row mb-3">
					<div class="col">
						<div class="mt-5 border-bottom">
							<input type="hidden" name="boardNo" value="${dto.boardNo }">
							<h3>
								<i class="bi bi-quora" style="color: #00C471;"></i>.
								${dto.title} 
							</h3>
							<p>${dto.name}· ${dto.createdDate}</p>
						</div>
						<div class="mt-2 ">
							<span>${dto.content}</span>
							<div class="mt-5 border-bottom">
								<c:forEach var="tag" items="${dto.tags}">
									<span class="me-3">#${tag.tagName}</span>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">
						<button class="btn btn-outline-secondary rounded-pill"
							id=update-btn>수정</button>
						<button class="btn btn-outline-secondary rounded-pill"
							id=delete-btn>삭제</button>
						<button class="btn btn-outline-secondary rounded-pill"
							id=status-btn>${dto.status}</button>
						<button class="btn btn-outline-secondary rounded-pill" id=like_btn>
							<i class="bi bi-suit-heart">${dto.boardLikeCnt}</i>
						</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col">
				<c:forEach var="comments" items="${dto.comments}">
					<div
						class="'border p-3  ${comments.commentSubNo eq 0 ? 'mt-5' : '' }"
						data-no="${comments.commentNo}" data-type="comment">
						<c:if test="${comments.commentSubNo eq 0 }">
							<h3 style="">
								<i class="bi bi-pin-angle-fill" style="color: #FFC51E;"></i> 
								답변
							</h3>
						</c:if>
						<div
							class="p-3 border-bottom ${comments.commentSubNo ne 0 ? 'ps-5' : ''}"
							data-no="${comments.commentNo}" data-type="recomment">
							<h5>
								<i class="${comments.commentSubNo ne 0 ? 'bi bi-arrow-return-right' : ''}"></i>
								<i class="bi bi-messenger" style="color: #00C471;"></i>
								${LOGIN_USER.name}
							</h5>
							<h6>날짜 ${dto.registrationDate}</h6>
							<p>${comments.commentContent}</p>
							<div class="mt-2">
								<button class="btn btn-outline-secondary rounded-pill">
									<i class="bi bi-suit-heart">${dto.commentLikeCnt }</i>
								</button>
							</div>
						</div>
					</div>
					<c:if test="${comments.commentSubNo eq 0 }">
						<div class="p-3 mb-3">
							<form id="form-recomment-texteditor" class="mt-3 me-1"
								method="get" action="/">
								<div class="mt-3">
									<textarea class="page-embed">댓글을 작성해주세요</textarea>
								</div>
							</form>
							<button type="button" class="btn btn-primary mt-3"
								id="recomment-btn">댓글 등록</button>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		<c:if test="${not empty LOGIN_USER }">
			<div class="row mb-5">
				<div class="col">
					<div class="mt-3 border-bottom">
						<h5>
							<img src="/resources/images/board/logo.png" width="26" 	height="26" />${LOGIN_USER.name }님, 답변해주세요!
						</h5>
						<h6>모두에게 도움이 되는 답변의 주인공이 되어주세요!</h6>
					</div>
					  <div class="form-group mb-3">
							<label for="comment-content"></label>
	 						<input type="text" name="comment-content" id="comment-content" placeholder= "답변내용을 입력해주세요" style="width:1300px; height:500px;  border:3px solid #C2D1C4; border-radius:4px;">						
					  </div>	
						<button type="button" class="btn btn-outline-success" id="comment-btn">답변 등록</button>
					</div>
				</div>
			</div>
		</c:if>
	</div>


<script type="text/javascript">

		//$("div[name='toggle-control']").click(function() {
		//	$('#target').toggle();
		//	$("div[name='toggle-control']").toggle();
		//})

	
	$("#comment-btn").click(function() {
		var boardNo = $("input[name='boardNo']").val();		
		var comment = $("#comment-content").val();
		$.getJSON({
			type : "post",
			url : "/rest/addComment",
			dataType : "json",
			data : {
				boardNo : boardNo				
				,commentContent : comment
			},
			success : function(response) {
				response.status == "OK"
				alert("답변이 등록되었습니다.");
				location.reload(true);
			}
		})
	})
	
	
	$("#recomment-btn").click(function() {
	
		var boardNo = $("input[name='boardNo']").val();
		var comment = $("#comment-content").val();
		var subNo =???
	})
	
<!--
	tinymce
			.init({
				selector : 'textarea.page-embed',
				toolbar : 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
				plugins : [
						'advlist autolink lists link image charmap print preview anchor',
						'searchreplace visualblocks code fullscreen',
						'insertdatetime media table paste imagetools wordcount' ],
				tiny_pageembed_classes : [ {
					text : 'Big embed',
					value : 'my-big-class'
				}, {
					text : 'Small embed',
					value : 'my-small-class'
				} ],
				height : 250,
				content_style : 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
			});
-->


</script>
</body>
</html>