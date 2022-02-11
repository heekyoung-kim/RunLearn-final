<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tiny.cloud/1/8skivbyd7udegec2bybilvg217boq2t339ot1k4o01qx26op/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>
<style>

</style>
</head>
<body>
<%@ include file="../common/nav.jsp"%>
<div class= "container">
	<div class="position-relative">
		<div class="position-absolute top-0 start-50 translate-middle-x">
			<div class="mt-5 border-bottom">
				<h3><img src="/resources/images/board/logo.png" width="26" height="26"/> ${dto.title}</h3>
				<p>${dto.name} · ${dto.createdDate}</p>
			</div>
			<div class="mt-2 ">
				<span>${dto.content}</span>
			<div class="mt-5 border-bottom">
				<c:forEach var="tag" items="${dto.tags}">
					<span>#${tag.tagName}</span>
				</c:forEach>
			</div>
			</br>
			<div>	
				<button class="btn btn-outline-secondary rounded-pill" id=update-btn>수정</button>
				<button class="btn btn-outline-secondary rounded-pill" id=delete-btn>삭제</button>
				<button class="btn btn-outline-secondary rounded-pill" id=status-btn>${dto.status}</button>
				<button class="btn btn-outline-secondary rounded-pill" id=like_btn>♡${dto.boardLikeCnt}</button>
			</div>
			<div class="mt-5 bg-white" >
				<div class="mt-3 border-bottom">
					<c:forEach var="comments" items="${dto.comments}">
						<h5><img src="/resources/images/board/logo.png" width="26" height="26"/>${dto.name}</h5>
						<h6>${dto.registrationDate}</h6>
				</div>
					<span>${comments.commentContent}</span>
				<div class="mt-3">
					<button class="btn btn-outline-secondary rounded-pill">♡${dto.commentLikeCnt }</button>
				</div>
					</c:forEach>
			</div>
			
			<div class="mt-5 bg-white" >
				<div class="mt-3 border-bottom">
					<h5><img src="/resources/images/board/logo.png" width="26" height="26"/> h2844j님, 답변해주세요!</h5>
					<h6>모두에게 도움이 되는 답변의 주인공이 되어주세요!</h6>
				</div>
					<form id="form-texteditor" class="mt-3 me-1" method="get" action="/">
				<div>
					<textarea id="page-embed">
						작성해주세요
					</textarea>
				</div>
					<button type="button" id="texteditor-submit">답변 등록</button>
					</form>
			</div>
			</div>	
		</div>
	</div>
</div>
<script>
tinymce.init({
	  selector: 'textarea#page-embed',
	  toolbar: 'insertfile undo redo | styleselect | bold italic | alignleft aligncenter alignright alignjustify | bullist numlist outdent indent | link image',
	  plugins: [
		    'advlist autolink lists link image charmap print preview anchor',
		    'searchreplace visualblocks code fullscreen',
		    'insertdatetime media table paste imagetools wordcount'
		  ],
	  tiny_pageembed_classes: [
	    { text: 'Big embed', value: 'my-big-class' },
	    { text: 'Small embed', value: 'my-small-class' }
	  ],
	  height: 250,
	  content_style: 'body { font-family:Helvetica,Arial,sans-serif; font-size:14px }'
	});
</script>
</body>
</html>