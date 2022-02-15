<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		#filter-btn-group .checked{color: #1dc078;}
		.card{positon:relative;}
		.modal-card{display:none; position:absolute; top:0;}
		.card:hover .modal-card{display:block; background:#000; font-size:14px; opacity:.9; z-index:10;}
		.modal-active-btn{position:absolute; right:0; bottom:0; z-index:1000; cursor:pointer;}
		.modal-active-btn i{color:#fff;}
	</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row">
		<div class="col">
			<div class="input-group" id=category-btn-group>
				<form id="form-search-category" class="d-inline-flex mt-3 me-1" method="get" action="/course">
					<input class="form-control" name="category" value="${param.value }" type="search" placeholder="Search" aria-label="Search">
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
		<div class="col col-md-4 text-end" id="sort-form">
			<form id= class="" method="get" action="/course">
				<input type="hidden" value="${param.sort }" name="sort" />
				<select class="form-select-sm" aria-label="Default select example">
					<option selected>추천순</option>
					<option value="likely">인기순</option>
					<option value="recently">최신순</option>
					<option value="grade">평점순</option>
					<option value="studentCount">학생수순</option>
				</select>
			</form>
		</div>
		</div>
	</div>
	
	
	
	<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4 mt-3 gx-4">
		<input type="hidden" value="${param.category }" name="category" />
		<c:forEach var="course" items="${classes }">
			<div class="col mb-3" id="card-${course.no }">
				<div class="card h-100">
					<a href="/course/${course.no }" class="stretched-link" data-course-no="${course.no }"></a>
					<img src="/resources/images/course/${course.uploadfiles }" class="card-img-top" alt="...">
					<div class="card-body">
						<!-- <h5 class="card-title">Card title</h5> -->
						<p class="card-text">${course.title }</p>
					</div>
					<ul class="list-group list-group-flush">
						<li class="list-group-item">${course.name }</li>
						<li class="list-group-item">★★★★★(14)</li>
						<c:if test="${course.discountPrice gt 0}">
							<li class="list-group-item border-0">
								<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${course.price }</fmt:formatNumber></span>
								<span class="fs-5 fw-bold">&bsol; <fmt:formatNumber pattern="##,###">${course.discountPrice }</fmt:formatNumber></span>
							</li>
						</c:if>
						<c:if test="${course.price gt 0 && course.discountPrice le 0}">
							<li class="list-group-item border-0">
								<span class="text-decoration-line-through text-muted">&bsol; <fmt:formatNumber pattern="##,###">${course.price }</fmt:formatNumber></span>
								<span class="fs-5 fw-bold">무료</span>
							</li>
						</c:if>
						<c:if test="${course.price le 0 && course.discountPrice le 0}">
							<li class="list-group-item border-0">
								<span class="fs-5 fw-bold">무료</span>
							</li>
						</c:if>
					</ul>
					<div class="card-footer">
						<span class="badge bg-info">+100명</span>
						<span class="badge bg-success">독점</span>
						<span class="badge bg-danger">할인중</span>
					</div>
					<div class="modal-card p-2 h-100">
						<a href="/course/${course.no }" class="stretched-link text-light text-decoration-none" data-course-no="${course.no }">
							<p class="course_title">${course.title }</p>
							<p class="course_description">분야 무관! 개발자라면 실무에서 꼭 알고 있어야 할 핵심
								기본기를 쉽게 + 코드 위주로 다루는 강의입니다. 성장하고 싶은 모든 주니어 개발자와 취준생에게 이 강의를 적극
								추천합니다.</p>
							<div class="back_course_metas">
								<div class="course_level">
									<span><svg width="16" aria-hidden="true"
											data-prefix="fal" data-icon="signal-alt"
											class="svg-inline--fa fa-signal-alt fa-w-20" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
											<path fill="currentColor"
												d="M576 32v448h-32V32h32M416 160v320h-32V160h32M256 288v192h-32V288h32M96 416v64H64v-64h32M576 0h-32c-17.67 0-32 14.33-32 32v448c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V32c0-17.67-14.33-32-32-32zM416 128h-32c-17.67 0-32 14.33-32 32v320c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V160c0-17.67-14.33-32-32-32zM256 256h-32c-17.67 0-32 14.33-32 32v192c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V288c0-17.67-14.33-32-32-32zM96 384H64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32z"></path></svg>초급</span>
								</div>
								<div>
									<span><svg width="16" aria-hidden="true"
											focusable="false" data-prefix="fal" data-icon="folder-tree"
											class="svg-inline--fa fa-folder-tree fa-w-18" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
											<path fill="currentColor"
												d="M288 224h224a32 32 0 0 0 32-32V64a32 32 0 0 0-32-32H400L368 0h-80a32 32 0 0 0-32 32v64H64V8a8 8 0 0 0-8-8H40a8 8 0 0 0-8 8v392a16 16 0 0 0 16 16h208v64a32 32 0 0 0 32 32h224a32 32 0 0 0 32-32V352a32 32 0 0 0-32-32H400l-32-32h-80a32 32 0 0 0-32 32v64H64V128h192v64a32 32 0 0 0 32 32zm0 96h66.74l32 32H512v128H288zm0-288h66.74l32 32H512v128H288z"></path></svg>
										프론트엔드, 백엔드, 교양 · 기타</span>
								</div>
								<div class="course_skills">
									<span><svg width="16" aria-hidden="true"
											focusable="false" data-prefix="far" data-icon="cubes"
											class="svg-inline--fa fa-cubes fa-w-16" role="img"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
											<path fill="currentColor"
												d="M384 215.1V102.5c0-15-9.3-28.4-23.4-33.7l-92-34.5c-8.1-3.1-17.1-3.1-25.3 0l-92 34.5c-14.1 5.3-23.4 18.7-23.4 33.7v112.6L23.4 254.4C9.3 259.6 0 273.1 0 288.1v106.6c0 13.6 7.7 26.1 19.9 32.2l98.6 49.3c10.1 5.1 22.1 5.1 32.2 0L256 423.6l105.3 52.6c10.1 5.1 22.1 5.1 32.2 0l98.6-49.3c12.2-6.1 19.9-18.6 19.9-32.2V288.1c0-15-9.3-28.4-23.4-33.7L384 215.1zm-116 34.8V152l92-31.7v97.6l-92 32zM152 94.2l104-39 104 39v.2L256 131 152 94.3v-.1zm0 26.1l92 31.7v97.9l-92-32v-97.6zm-30 329.4l-96.8-48.4V308l96.8 39.3v102.4zM25.2 280.8v-.2l109.4-41 108.1 40.5v1.2l-108.1 43.9-109.4-44.4zm122 66.5l95.5-38.8V402l-95.5 47.8V347.3zm217.6 102.4L269.3 402v-93.4l95.5 38.8v102.3zm122-48.4L390 449.7V347.3l96.8-39.3v93.3zm0-120.5l-109.4 44.4-108.1-43.9v-1.2l108.1-40.5 109.4 41v.2z"></path></svg>
										객체지향, 소프트웨어 테스트, 아키텍처</span>
								</div>
							</div>
						</a>
						<!-- <div class="modal-active-btn p-1 m-1">
							<div class="add_cart e_cart_action mb-1 me-1">
								<i class="fas fa-cart-plus fa-lg"></i>
							</div>
							<div class="add_cart e_cart_action mb-1">
								<i class="fas fa-heart fa-lg"></i>
							</div>
							<div class="e-add-mylist">
								<i class="fas fa-plus fa-lg"></i>
							</div>
						</div> -->
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
		$(":input[name=category]").val(value);
		
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

// sort 정보를 서버에 전달
$("#sort-form select").on("change", function(){
	var sortValue = $(this).val();
	$("#sort-form input[name=sort]").val(sortValue);
	$("#").trigger("submit");
})

</script>
</body>
</html>