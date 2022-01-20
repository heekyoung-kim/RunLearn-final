<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<h1>홈페이지</h1>
	<p><c:out value="${message }" /></p>
	<div class="row row-cols-1 row-cols-md-4 g-4">
		<c:forEach var="course" items="${classCourse }">
			<div class="col">
				<div class="card h-100">
					<a href="${course.no }" class="stretched-link"></a>
						<img src="/resources/images/course/${course.image }" class="card-img-top" alt="...">
						<div class="card-body">
							<!-- <h5 class="card-title">Card title</h5> -->
							<p class="card-text">${course.title }</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">${course.name }</li>
							<li class="list-group-item">★★★★★(132)</li>
							<li class="list-group-item">&#8361;${course.price } &#8361;${course.discountPrice }</li>
						</ul>
						<div class="card-footer">
							<span class="badge bg-info">+${course.studentCount }명</span>
							<span class="badge bg-success">독점</span>
							<span class="badge bg-danger">할인중</span>
						</div>
				</div>
			</div>
		</c:forEach>
		<div class="col">
			<div class="card">
				<img src="/resources/images/course/sample.png" class="card-img-top" alt="...">
				<div class="card-body">
					<h5 class="card-title">Card title</h5>
					<p class="card-text">This is a longer card with supporting
						text below as a natural lead-in to additional content. This
						content is a little bit longer.</p>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>