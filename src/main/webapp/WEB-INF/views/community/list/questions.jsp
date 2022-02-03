<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>questions.jsp</title>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdn.tiny.cloud/1/8skivbyd7udegec2bybilvg217boq2t339ot1k4o01qx26op/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script> 

</head>
<body>
<%@ include file="../../common/nav.jsp"%>
<div class="container">
	<section class="community-header">
		<div class="community-header__content">
			<h2 class="community-header__title">묻고 답해요</h2>
			<p class="community-header__sub-title">74만명의 커뮤니티!! 함께 토론해봐요.</p>
		</div>
	</section>

<!--전체,해결,미해결 상태그룹버튼  -->	
<div class="btn-group btn-group-lg" role="btn-group" aria-label="btn group">	
<button class="${empty param.status ? 'active' : '' }     btn btn-outline-success"             			 id="btn-all-question">전체</button>  
<button class="${param.status eq '해결' ? 'active' : ''}   btn btn-outline-success"  data-status="해결"     id="btn-resolved-question">해결</button>    
<button class="${param.status eq '미해결' ? 'active' : ''}  btn btn-outline-success"  data-status="미해결"   id="btn-unresolved-question">미해결</button>    
</div>
<!-- 검색, 태그창 -->
<div class="row">
	<form id="form-search"  class= "col-lg-6" method="get" action="questions">
		<input type="hidden" name="status" value="${param.status}" } />
		<input type="hidden" name="sort" value="${empty param.sort ? 'date' : param.sort}" } />
		<input type="text" name="search" class= "col-lg-9" value="${param.search}" placeholder="궁금한 질문을 검색해보세요!" />
		<button class="btn btn-outline-success" type="submit" id="btn-search">검색</button>
	</form>
</div>
<!--  
<div class="row">	
	<form id="form-search-class" class="col-lg-6" method="get" action="/tag">
		<input class="form-control" name="tagname" value="${value }" type="search" placeholder="태그로 검색해보세요!" aria-label="Search-Tags"/>
		<button class="btn btn-outline-success" type="submit" id="btn-clear">초기화</button>
	</form>
</div>	
 -->
<!-- 최신순, 답변많은순, 좋아요순 버튼 -->
<div class="btn-group btn-group-sm" role="btn-group" aria-label="btn group">	
<button   class="${param.sort eq 'date' ? 'active' : '' }  btn btn-outline-success"      id="btn-latest">최신순</button>  
<button   class="${param.sort eq 'reply' ? 'active' : '' }btn btn-outline-success"  	   id="btn-answer">답변많은순</button>    
<button   class="${param.sort eq 'like' ? 'active' : '' }btn btn-outline-success"      id="btn-like">좋아요순</button>    
</div>
 <!-- 글쓰기 버튼 -->
<button type="button" class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#writeBoardModal" >글쓰기</button>
<!-- 글쓰기 모달창 -->
<div class="modal fade" id="writeBoardModal" tabindex="-1" role="dialog" aria-labelledby="writeBoardLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="alert alert-danger" id="alert-error-addBoard" style="display:none;"></div>
				<h5 class="modal-title" id="writeBoardLabel">커뮤니티</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="addBoard-form" method="post" action="/addBoard">
				<div class="modal-body">
						<div class="form-group">
							<label for="category">카테고리</label>
							<button type="button" class="btn btn-outline-success" id="btn-questions" >질문</button>
							<button type="button" class="btn btn-outline-success" id="btn-freeTalk" >자유주제</button>
							<button type="button" class="btn btn-outline-success" id="btn-study" >스터디</button>
							<input type="hidden" name="category" value="질문"/>
							<input type="hidden" name="status" value="미해결"/>

						</div>			
						<div class="form-group">
							<label for="title">제목</label>
	 						<input type="text" name="title" class="form-control" id="title" placeholder= "제목을 입력하세요">						
						</div>			
					  
						<div class="form-group">
							<label for="tag">태그</label>
	 						<input type="text" name="tag" class="form-control" id="tag" placeholder= "태그는 10개까지 입력가능합니다.">						
						</div>				
					<!-- // TODO  내용파트 tinymce 적용하기? -->
					  <div class="form-group">
							<label for="content">내용</label></br>
									<!--<textarea> Welcome to TinyMCE! </textarea>-->
	 						<input type="text" name="content" class="form-control" id="tag" placeholder= "내용을 입력해주세요" style="width:470px; height:200px;">						
						</div>				
				</div>
				<div class="modal-footer">
					<button type= "button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
					<button type= "button" class="btn btn-outline-success" id="btn-addBoard" >등록</button>
				</div>
			</form>
	</div>
</div>
</div>
		<!-- 질문답변글 전체출력 -->
	<c:forEach var="board" items="${boardLists}">
			<div class="row border-top border-1 ">
				<div class=" col-8 mt-3">
					<h3>${board.title }</h3>
					<p>${board.content}</p>
					<ul class="nav">
						<li class="nav-item"><p><small>${board.name }</small></p></li>
						<li class="nav-item"><p><small> / ${board.createdDate }</small></p></li>
						<li class="nav-item"><p><small> / ${board.classTitle }</small></p></li>
					</ul>
				</div>
				<div class="col-4 mt-3">
					<p><small>${board.commentCnt }<br>답변</small></p>
					<p><small><i class="bi bi-suit-heart-fill"></i> ${board.likeCnt }</small></p>
				</div>
			</div>
	</c:forEach>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>

<!--전체,해결, 미해결 버튼 클릭기능-->
$("#btn-all-question").click(function() {
   location.href="/community/questions"
});
$("#btn-resolved-question").click(function() {
   location.href="/community/questions?status=해결"
});
$("#btn-unresolved-question").click(function() {
   location.href="/community/questions?status=미해결"
});

$("#btn-latest").click(function() {
   		$(":input[name=sort]").val("date")
   		$("#form-search").trigger("submit")
});
$("#btn-answer").click(function() {
   		$(":input[name=sort]").val("reply")
   		$("#form-search").trigger("submit")
});
$("#btn-like").click(function() {
   		$(":input[name=sort]").val("like")
   		$("#form-search").trigger("submit")
});



$("#btn-questions").click(function(){
	$("#addBoard-form [name=category]").val("질문");
	$("#addBoard-form [name=status]").val("미해결");	
  
	$('#btn-freeTalk').removeClass('active');
    $('#btn-study').removeClass('active');
    $(this).addClass('active');
});
$("#btn-freeTalk").click(function(){
	$("#addBoard-form [name=category]").val("자유주제");	
	$("#addBoard-form [name=status]").val("");	
    
	$('#btn-questions').removeClass('active');
    $('#btn-study').removeClass('active');
    $(this).addClass('active');

});
$("#btn-study").click(function(){
	$("#addBoard-form [name=category]").val("스터디");
	$("#addBoard-form [name=status]").val("모집중");	
    
	$('#btn-questions').removeClass('active');
    $('#btn-freeTalk').removeClass('active');
    $(this).addClass('active');	
});

$(function(){
	$("#btn-addBoard").click(function(event){
		$("#alert-error-addBoard").hide();
		let category = $("#addBoard-form [name=category]").val();
		let status = $("#addBoard-form [name=status]").val();		
		let title = $("#addBoard-form [name=title]").val();	
		let tag =  $("#addBoard-form [name=tag]").val();		
		let content = $("#addBoard-form [name=content]").val();	
		
		if(title == ""){
			$("#alert-error-addBoard").show().text("빈칸을 입력해주세요.");
			return;
		}		
	$.ajax({
		type: "post"
		,url: "/rest/addBoard"
		,dataType: "json"
		,data: {
			category: category
			,status: status
			,title: title
			,tagName: tag
			,content: content
				},
		success : function(response){
				if(response.status == "OK"){
					alert("글이 등록되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}
				
			}
		})
	})
})


</script>
</body>
</html>