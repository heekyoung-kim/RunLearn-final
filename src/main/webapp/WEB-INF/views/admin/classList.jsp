<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<style>

</style>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="body">
<%@ include file="../admin/adminLeftBar.jsp" %>
<div class="mainApp">

	<div class="row">
		<input type="hidden" value="${param.category }" name="category" />
		<c:forEach var="course" items="${classes }">					
				<tr>
					<th class="col-3">
						<a href="/course/${course.no }" class="stretched-link"></a>
						<img src="/resources/images/course/${course.image }" class="card-img-top" alt="...">
					</th>
					<th class="col-3">
						<!-- <h5 class="card-title">Card title</h5> -->
						<p class="card-text">${course.title }</p>
					</th>
					<th class="col-3">${course.name }</th>
					<th class="col-3">★★★★★()</th>
						<!-- <li class="list-group-item">&#8361;${course.price } &#8361;${course.discountPrice }</li>-->
				</tr>
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

// json 정보를 호출해서 해당 데이터로 카테고리 검색과 토글 버튼이 생성되도록 한다.
/* $(function(){
	$.getJSON("/rest/ClassDetailList.do", function(categoryList) {
		let $categoryUl = $("#menu-1")
		
		$.each(categoryList, function(index, category){
			let no = category.no;
			let name = category.name;
			let parentNo = category.parentNo;
			let $li = $('<li class="nav-item" id="nav-item-'+no+'"><a class="nav-link" href="/course?category='+no+'" data-menu-1="'+no+'">'+name+'</a><ul class="navbar-nav is-boxed depth2"></ul></li>');
			$categoryUl.append($li);
		})
	})
}) */
</script>
</body>
</html>