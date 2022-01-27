<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row row-cols-1 row-cols-md-4 mt-3 g-4">
		<input type="hidden" value="${param.category }" name="category" />
		<c:forEach var="course" items="${classes }">					
			<div class="col">
				<div class="card h-100">
					<a href="/course/${course.no }" class="stretched-link"></a>
					<img src="/resources/images/course/${course.image }" class="card-img-top" alt="...">
					<div class="card-body">
						<!-- <h5 class="card-title">Card title</h5> -->
						<p class="card-text">${course.title }</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">${course.name }</li>
						<li class="list-group-item">★★★★★()</li>
						<li class="list-group-item">&#8361;${course.price } &#8361;${course.discountPrice }</li>
					</ul>
					<div class="card-footer">
						<span class="badge bg-info">+100명</span>
						<span class="badge bg-success">독점</span>
						<span class="badge bg-danger">할인중</span>
					</div>
				</div>
			</div>
		</c:forEach>
	</div>
	<c:if test="${pagination.totalRecords gt 0 }">
		<!-- 페이지 내비게이션 표시 -->
		<div class="row mt-3 mb-3">
			<div class="col">
				<nav>
		  			<ul class="pagination justify-content-center">
		    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
		      				<a class="page-link" href="/course?page=${pagination.prevPage }" data-page="${pagination.prevPage }">이전</a>
		    			</li>
	
		    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
			    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
			    				<a class="page-link" href="/course?page=${num }" data-page="${num }">${num }</a>
			    			</li>	    			
		    			</c:forEach>
	
		    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
		      				<a class="page-link" href="/course?page=${pagination.nextPage }" data-page="${pagination.nextPage }">다음</a>
		    			</li>
		  			</ul>
				</nav>
			</div>
		</div>
	</c:if>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
// 페이지내비게이션의 링크를 클릭했을 때 실행될 이벤트핸들러 함수를 등록한다.
$(".pagination a").click(function(event) {
	event.preventDefault();
	// 클릭한 페이지내비게이션의 페이지번호 조회하기
	var pageNo = $(this).attr("data-page");
	var category = $.trim($(":input[name=category]").val());
	// 검색폼의 히든필드에 클릭한 페이지내비게이션의 페이지번호 설정
	$(":input[name=page]").val(pageNo);
	
	// 검색폼에 onsubmit 이벤트 발생시키기
	$("#form-search-class").trigger("submit");
})
</script>
</body>
</html>