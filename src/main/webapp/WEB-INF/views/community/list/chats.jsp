<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<title>chats.jsp</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<style type="text/css">
 a:link { color: black; text-decoration: none;}
 a:visited { color: black; text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
</style>
</head>
<body>
<%@ include file="../../common/nav.jsp"%>
<div class="container-fluid" >
	<div class="row bg-black mb-3" >
		<div class="col">
			<div class="container">
				<div>
					<h2 class="fs-4 my-3 fw-bold" style="color:white;  font-size:30px;">이야기를 나눠요</h2>
					<p class="fs-6 text-light" style="color:white;">82만명의 커뮤니티!! 함께 토론해봐요.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-2">
			<%@ include file="../../community/left.jsp"%>
		</div>
			<!-- 검색창 -->
		<div class="col-10">
			<form id="form-search" class="col-lg-6" method="get" action="chats">
				<input type="hidden" name="status" value="${param.status}" />
				<input type="hidden" name="sort"   value="${empty param.sort ? 'date' : param.sort}" /> 
				<input type="text" name="search" class="col-lg-9" value="${param.search}" placeholder="대화내용을 검색해보세요!" />
				<button class="btn btn-outline-success btn-sm" type="submit" id="btn-search">검색</button>
			</form>
			<!-- 최신순, 답변많은순, 좋아요순 버튼 -->
				<div class="btn-group btn-group-sm mt-2" role="btn-group" aria-label="btn group">	
					<button   class="${param.sort eq 'date' ? 'active' : '' }  btn btn-outline-success"      id="btn-latest">최신순</button>  
					<button   class="${param.sort eq 'reply' ? 'active' : '' }btn btn-outline-success"  	   id="btn-answer">답변많은순</button>    
					<button   class="${param.sort eq 'like' ? 'active' : '' }btn btn-outline-success"      id="btn-like">좋아요순</button>    
				</div>
			 <!-- 글쓰기 버튼 -->
			 <c:if test="${not empty LOGIN_USER}">
					<button type="button" class="btn btn-outline-success btn-sm float-end mt-2" data-bs-toggle="modal" data-bs-target="#writeBoardModal" >글쓰기</button>		
			 </c:if>
		
			<!-- 질문답변글 전체출력 -->
			<c:forEach var="board" items="${boardLists}">
				<a href="/community/detail?boardNo=${board.boardNo}">
					<div class="row border-top border-1 ">
						<div class=" col-8 mt-3">
							<h3>${board.title }</h3>
							<p>${board.content}</p>
							<ul class="nav">
								<li class="nav-item"><p><small>${board.name }</small></p></li>
								<li class="nav-item"><p><small> / <fmt:formatDate value="${board.createdDate }" pattern="yyyy년 MM월 dd일"/></small></p></li>
								<li class="nav-item"><p><small>  ${board.classTitle }</small></p></li>
							</ul>
						</div>
						<div class="col-4 mt-3">
							<div class="row">
								<div class="col me-2 pe-3">
									<div class="float-end">
										<p><small>${board.commentCnt }<br>답변</small></p>
										<p><small><i class="bi bi-suit-heart-fill"></i> ${board.likeCnt }</small></p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</a>
			</c:forEach>
		</div>	
	</div>
</div>




<!-- 글쓰기 모달창 -->
<div class="modal fade" id="writeBoardModal" tabindex="-1" role="dialog" aria-labelledby="writeBoardLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<div class="alert alert-danger" id="alert-error-addBoard" style="display:none;"></div>
				<h5 class="modal-title" id="writeBoardLabel">커뮤니티</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="addBoard-form" method="post" action="/addBoard">
				<div class="modal-body">
						<div class="form-group mb-3">
							<label for="category">카테고리</label>
							<button type="button" class="btn btn-outline-success" id="btn-questions" >질문답변</button>
							<button type="button" class="btn btn-outline-success" id="btn-freeTalk" >자유주제</button>
							<button type="button" class="btn btn-outline-success" id="btn-study" >스터디</button>
							<input type="hidden" name="category" value="질문답변"/>
							<input type="hidden" name="status" value="미해결"/>
						</div>			
						<div class="form-group mb-3">
							<label for="title">제목</label>
	 						<input type="text" name="title" class="form-control" id="title" placeholder= "제목을 입력하세요">						
						</div>			
					  	<div class="form-group mb-3">
							<label for="tag">태그</label>
							<div class=" border p-2">
		 						<input type="text" name="tagfield" class="form-control  border-0" id="tag" placeholder="태그는 5개까지 입력가능합니다.">						
								<div class="mt-2 g-3" id="tag-box">									
								</div>
							</div>
						</div>				
					  <div class="form-group mb-3">
							<label for="content">내용</label>
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

</div>
<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
$(function(){

<!--최신순, 답변많은순, 좋아요순 필터-->	
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
		$("#addBoard-form [name=category]").val("질문답변");
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

	$("#writeBoardModal :input[name=tagfield]").keyup(function() {
		if(event.keyCode == 13) {
			// 태그 입력값 조회
			var tagValue = $(this).val();
			// 태그 입력값과 동일한 값을 가지고 있는 히든 필드를 조회
			if ($("#addBoard-form :input[name=tag][value="+tagValue+"]").length == 0) {
			
				var tag = '<span class="badge bg-secondary me-2">#<span>'+tagValue+'</span> <i class="bi bi-x" style="cursor:pointer;"></i></span>'
				// 태그 추가 
				$("#tag-box").append(tag);
				// 입력필드의 입력값을 삭제 
				
				// 히든필드 추가
				$("#addBoard-form").append('<input type="hidden" name="tag" value="'+tagValue+'">')
			}
			$(this).val('').focus();
		}
	});
	
	$("#tag-box").on("click", 'i', function() {
		// 태그의 값 조회 
		var tagValue = $(this).closest('span').find('span').text();
		// 히든 필드 삭제 
		$("#addBoard-form :input[name=tag][value="+tagValue+"]").remove();

		// 태그 삭제 
		$(this).closest('span').remove();
	})

	$("#btn-addBoard").click(function(event){
		$("#alert-error-addBoard").hide();
		var category = $("#addBoard-form [name=category]").val();
		var status = $("#addBoard-form [name=status]").val();		
		var title = $("#addBoard-form [name=title]").val();	
		var tags = [];
		$("#addBoard-form [name=tag]").each(function(index, input) {
				tags.push($(input).val());	
			});	
		var content = $("#addBoard-form [name=content]").val();	
		if(title == ""){
			$("#alert-error-addBoard").show().text("빈칸을 입력해주세요.");
			return;
		}		
		$.getJSON({
			type: "post"
			,url: "/rest/addBoard"
			,dataType: "json"
			,data: {
				category: category
				,status: status
				,title: title
				,tagName: tags
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