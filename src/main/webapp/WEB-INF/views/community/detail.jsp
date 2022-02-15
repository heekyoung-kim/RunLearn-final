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
							<p>${dto.name}· <fmt:formatDate value="${dto.createdDate}" pattern="yyyy년 MM월 dd일"/></p>
						</div>
						<div class="mt-2 ">
							<span>${dto.content}</span>
							<div class="mt-5 border-bottom">
							<div>[연관태그]</div>
								<c:forEach var="tag" items="${dto.tags}">
									<span class="me-3">#${tag.tagName}</span>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
				<div class="row mb-3">
					<div class="col">

							<!-- <button class="btn btn-outline-secondary rounded-pill"	id=update-btn>수정</button> -->
							<button class="btn btn-outline-secondary rounded-pill"  id=delete-btn>삭제</button>
							<button class="btn btn-outline-secondary rounded-pill"	id=status-btn>${dto.status}</button>
							<button class="btn btn-outline-secondary rounded-pill"  id=like_btn><i class="bi bi-suit-heart">${dto.boardLikeCnt}</i></button>
					</div>
				</div>
			</div>
		</div>
		
<!--수정 모달창 -->
<div class="modal fade" id="updateBoardModal" tabindex="-1" role="dialog" aria-labelledby="writeBoardLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="updateBoardLabel">커뮤니티</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
				<form id="updateBoard-form" method="post" action="/updateBoard">
					<c:forEach var="tag" items="${dto.tags}">
						<input type="hidden" name="tag" value="${tag.tagName }" />
					</c:forEach>
					<div class="modal-body">
						<div class="form-group mb-3">
							<label for="title">제목</label>
	 						<input type="text" name="title" class="form-control" id="title" value="${dto.title}" >						
						</div>			
					  	<div class="form-group mb-3">
							<label for="tag">태그</label>
							<div class=" border p-2">
		 						<input type="text" name="tagfield" class="form-control  border-0" id="tag" value="">						
								<div class="mt-2 g-3" id="tag-box">										
									<c:forEach var="tag" items="${dto.tags}">
										<span class="badge bg-secondary me-2"><span>${tag.tagName}</span> <i class="bi bi-x" style="cursor:pointer;"></i></span>
									</c:forEach>							
								</div>
							</div>
						</div>				
					  <div class="form-group mb-3">
							<label for="content">내용</label>
	 						<textarea name="content" class="form-control" >${dto.content}</textarea>
					  </div>				
				</div>
				<div class="modal-footer">
					<button type= "button" class="btn btn-outline-secondary" data-bs-dismiss="modal" >취소</button>
					<button type= "button" class="btn btn-outline-success" id="btn-updateBoard" >저장</button>
				</div>
			</form>
		</div>
	</div>
</div>
			
<!-- 답변.댓글 게시글 출력 -->
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
							<h6><fmt:formatDate value="${comments.registrationDate}" pattern="yyyy년 MM월 dd일"/></h6>
							<p>${comments.commentContent}</p>
							<div class="mt-2">
								<button class="btn btn-outline-secondary rounded-pill">
									<i class="bi bi-suit-heart">${dto.commentLikeCnt }</i>
								</button>
							</div>
						</div>
					</div>
					<!--<c:if test="${comments.commentSubNo eq 0 }">
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
					-->
				</c:forEach>
			</div>
		</div>
		
<!-- 답변입력창 -->
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
		</c:if>
	</div>


<script type="text/javascript">


var updateBoardModal = new bootstrap.Modal(document.getElementById("updateBoardModal"))

//수정버튼 클릭시
	$("#update-btn").click(function() {
		updateBoardModal.show();
	})
	
	
//삭제버튼 클릭시
$("#delete-btn").click(function() {
	var boardNo = $("input[name='boardNo']").val();		
	$.getJSON({
		type : "post",
		url : "/rest/deleteBoard",
		dataType : "json",
		data : {
			boardNo : boardNo				
		},
		success : function(response) {
			if(response.status == "OK"){
				alert("게시글이 삭제되었습니다.");
				location.href = "/community/questions";
			}
		}
	})	
})	
	
	$("#updateBoardModal :input[name=tagfield]").keyup(function() {
		if(event.keyCode == 13) {
			// 태그 입력값 조회
			var tagValue = $(this).val();
			// 태그 입력값과 동일한 값을 가지고 있는 히든 필드를 조회
			if ($("#updateBoard-form :input[name=tag][value="+tagValue+"]").length == 0) {
			
				var tag = '<span class="badge bg-secondary me-2">#<span>'+tagValue+'</span> <i class="bi bi-x" style="cursor:pointer;"></i></span>'
				// 태그 추가 
				$("#tag-box").append(tag);
				// 입력필드의 입력값을 삭제 
				
				// 히든필드 추가
				$("#updateBoard-form").prepend('<input type="hidden" name="tag" value="'+tagValue+'">')
			}
			$(this).val('').focus();
		}
	});
	
	$("#tag-box").on("click", 'i', function() {
		// 태그의 값 조회 
		var tagValue = $(this).closest('span').find('span').text();
		// 히든 필드 삭제 
		$("#updateBoard-form :input[name=tag][value="+tagValue+"]").remove();

		// 태그 삭제 
		$(this).closest('span').remove();
	})

//댓글등록버튼 클릭시
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
	
	})

</script>
</body>
</html>