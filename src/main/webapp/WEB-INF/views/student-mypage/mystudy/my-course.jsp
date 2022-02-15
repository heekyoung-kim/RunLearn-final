<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
     <meta charset="utf-8">
     <meta name="viewport" content="width=device-width, initial-scale=1">
     <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container-fluid section-bg">
	<div class="row bg-1">
		<div class="col">
			<div class="container">
				<nav class="navbar navbar-dashboard">
					<p class="fs-3 fw-bold my-2">대시보드</p>
				</nav>
			</div>
		</div>
	</div>
	<div class="row bg-2">
		<div class="col">
			<div class="container">
				<div class="row my-3">
					<div class="col-2">
						<%@ include file="../student-mypage-leftbar.jsp" %>
					</div>
					<div class="col-10">
						<div class="row row-cols-1 row-cols-md-2 g-4">
						    <c:forEach var="classes" items="${classesList }">
							  <div class="col">
							    <div class="card">
							      <a href="../../course/${classes.no }/dashboard" class="text-decoration-none text-secondary">
								      <img src="../../resources/images/course/${classes.image }" class="card-img-top" alt="...">
								      <div class="card-body">
								        <h5 class="card-title">${classes.title }</h5>
								        <div class="card-text">
								        	<div class="progress">
											  <div class="progress-bar" role="progressbar" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
											</div>
											<span class="fs-6 text-secondary">진행률: 0.00% | 기간: 무제한</span>
										</div>
								      </div>
							      </a>
							    </div>
							  </div>
						    </c:forEach>
						    <c:forEach var="test" items="${chapterList }">
						    	${test.title }
						    </c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>