<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		.section-1{background:#002333;}
		.section-1 .section-bg{padding:40px 0;}
		.section-1 .img-box{width:440px; height:286px; border-radius:8px;}
		.section-1 .text-box{position:relative;}
		.text-box .text-content{position:absolute; top:50%; transform:translateY(-50%); color:#fff;}
		.card-floating{position:sticky; top:75px; margin:20px 34px 20px auto; width:332px;}
		.btn.btn-apply{background:#00c471; color:#fff;}
		.btn.btn-go-study{background:#00c471; color:#fff;}
		@media screen and (max-width: 1024px) {
			.section-1 .img-box{width:525px; height:341px;}
		}
		@media screen and (max-width: 767px) {
			.section-1 .img-box{width:90vw; height:58vw;}
		}
		
		.class-dashboard{border:1px solid #ddd; border-radius:5px;}
		.class-dashboard span.fs-6{font-size:.9rem !important;}
		.class-dashboard .toggle-text{position:relative; display:inline-block; width:21px; height:21px; vertical-align:middle;}
		.class-dashboard .toggle-text i{position:absolute; display:inline-block;}
		.class-dashboard .toggle-text.minus i.i-1, .class-dashboard .toggle-text.plus i.i-1{top:50%; transform:translateY(-50%); background:#595959; width:15px; height:2px;}
		.class-dashboard .toggle-text.plus i.i-2{top:50%; left:40%; transform:translate(-50%, -50%); background:#595959; width:2px; height:15px;}
		.class-dashboard .section-text{padding:0 .5rem; font-weight:bold; color:#595959}
	</style>
	
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container-fluid section-1">
	<div class="row section-bg">
		<div class="col">
			<div class="container">
				<div class="row">
					<div class="col-5">
						<div class="img-box">
							<img src="/resources/images/course/${classes.uploadfiles }" class="card-img-top" alt="...">
						</div>
					</div>
					<div class="col-7 text-box">
						<div class="text-content">
							<span class="badge bg-secondary">New</span> <span>${classes.categoryName }</span>
							<p class="fs-4 m-2">${classes.title }</p>
							<span>★★★★★(4.9) 138개의 수강평&middot;1636명의 수강생</span><br>
							<span>${classes.teacherName }</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col class-dashboard my-3 p-3">
			<p class="fs-3 mb-3">교육과정</p>
			<c:forEach var="chapter" items="${chapterList }" varStatus="chapterStatus">
				<div class="list-group mb-2">
					<div>
						<a id="section-btn-${chapter.no }" class="list-group-item bg-light d-block text-decoration-none text-secondary" data-bs-toggle="collapse" href="#collapse-${chapter.no }" role="button" aria-expanded="false" aria-controls="collapse-${chapter.no }">
							<span class="toggle-text minus">
								<i class="i-1"></i>
								<i class="i-2"></i>
							</span>
							<span class="section-text">${chapter.title }</span>
							<span class="float-end fs-6"></span>	
						</a>
					</div>
					<div class="collapse show" id="collapse-${chapter.no }">
						<c:forEach var="chapterDetail" items="${chapter.classDetail }" varStatus="status">
							<a href="curriculum/${chapterDetail.detailNo}" class="list-group-item d-block text-decoration-none text-secondary">${status.count }강. ${chapterDetail.detailTitle }</a>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>