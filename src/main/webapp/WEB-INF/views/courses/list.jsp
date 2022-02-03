<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		#filter-btn-group .checked{color: #1dc078;}	
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col">
			<div class="input-group" id=category-btn-group>
				<form id="form-search-category" class="d-inline-flex mt-3 me-1" method="get" action="/course">
					<input class="form-control" name="categoryName" value="${param.value }" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-success" type="submit" id="btn-search-category"><i class="fas fa-search"></i></button>
				</form>
				<c:forEach var="category" items="${categoryList }">			
					<div class="d-inline-flex mt-3 mx-1">
						<input type="checkbox" class="btn-check" id="btn-check-outlined-${category.no}" autocomplete="off">
						<label class="btn btn-outline-secondary" for="btn-check-outlined-${category.no}">${category.name }</label>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
	<div class="row mt-5">
		<div class="w-100 d-md-flex">
		<div class="col col-md-8">
			<div class="btn-group" role="group" aria-label="Basic checkbox toggle button group" id="filter-btn-group">
				<form id="form-search-filter" class="d-inline-flex mt-3 me-1" method="get" action="/course">
					<input type="hidden" name="filter" />
					
					<span style="height:31px; line-height:31px;">
						<i class="icon"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 16 16" fill="none"><path d="M8 10.4a1.8 1.8 0 0 1 1.7 1.209l.03-.005.07-.004h3.6a.6.6 0 0 1 .07 1.196l-.07.004H9.8a.606.606 0 0 1-.1-.008 1.8 1.8 0 0 1-3.4-.001l-.03.005-.07.004H2.6a.6.6 0 0 1-.07-1.196l.07-.004h3.6c.034 0 .067.003.1.008A1.8 1.8 0 0 1 8 10.4zm0 1.2a.6.6 0 1 0 0 1.2.6.6 0 0 0 0-1.2zM3.8 6.2a1.8 1.8 0 0 1 1.7 1.209l.03-.005.07-.004h7.8a.6.6 0 0 1 .07 1.196l-.07.004H5.6a.605.605 0 0 1-.1-.008A1.8 1.8 0 1 1 3.8 6.2zm0 1.2a.6.6 0 1 0 0 1.2.6.6 0 0 0 0-1.2zM10.4 2a1.8 1.8 0 0 1 1.7 1.209l.03-.005.07-.004h1.2a.6.6 0 0 1 .07 1.196l-.07.004h-1.2a.605.605 0 0 1-.1-.008 1.8 1.8 0 0 1-3.4-.001l-.03.005-.07.004h-6a.6.6 0 0 1-.07-1.196L2.6 3.2h6c.034 0 .067.003.1.008A1.8 1.8 0 0 1 10.4 2zm0 1.2a.6.6 0 1 0 0 1.2.6.6 0 0 0 0-1.2z" fill="#3E4042"></path></svg></i>
	 				필터
	 				</span>
	  					
	  				<input type="checkbox" class="btn-check" id="btncheck1" autocomplete="off">
					<label class="btn btn-sm" for="btncheck1">유료</label>
					<input type="checkbox" class="btn-check" id="btncheck2" autocomplete="off">
					<label class="btn btn-sm" for="btncheck2">무료</label>
					<input type="checkbox" class="btn-check" id="btncheck3" autocomplete="off">
					<label class="btn btn-sm" for="btncheck3">할인중</label>
					
					<input type="checkbox" class="btn-check" id="btncheck4" autocomplete="off">
					<label class="btn btn-sm" for="btncheck4">입문</label>
					<input type="checkbox" class="btn-check" id="btncheck5" autocomplete="off">
					<label class="btn btn-sm" for="btncheck5">중급</label>
					<input type="checkbox" class="btn-check" id="btncheck6" autocomplete="off">
					<label class="btn btn-sm" for="btncheck6">중급이상</label>
				</form>
			</div>
		</div>
		<div class="col col-md-4 text-end">
			<select class="form-select-sm" aria-label="Default select example">
				<option selected>추천순</option>
				<option value="1">인기순</option>
				<option value="2">최신순</option>
				<option value="3">평점순</option>
				<option value="3">학생수순</option>
			</select>
		</div>
		</div>
	</div>
	
	<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4 mt-3 gx-4">
		<input type="hidden" value="${param.category }" name="category" />
		<c:forEach var="course" items="${classes }">					
			<div class="col">
				<div class="card h-100">
					<a href="/course/${course.no }" class="stretched-link" data-course-no="${course.no }"></a>
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

$(".input-group input[type=checkbox]").on("click", function(){
	var id= $(this).attr("id");
	
	if( $(this).is(":checked")){
		var value = $("#category-btn-group label[for='"+id+"']").text();
		console.log(value);
		$(":input[name=categoryName]").val(value);
		
		//
		$("#form-search-category").trigger("submit");
	}
})

$("#filter-btn-group input[type=checkbox]").click(function(){
	var id= $(this).attr("id");
	var value = $("#filter-btn-group label[for='"+id+"']").text();
	
	if($(this).is(":checked")){
		$("#filter-btn-group label[for='"+id+"']").addClass("checked");
		console.log(value);
		$(this).val(value);
		
		$("#filter-btn-group input[name=filter]").val(value)
		
		$("#form-search-filter").trigger("submit");
	} else {
		$("#filter-btn-group label[for='"+id+"']").removeClass("checked");
	}
	
})

</script>
</body>
</html>