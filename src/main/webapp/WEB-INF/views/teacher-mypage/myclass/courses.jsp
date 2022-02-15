<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<script src="https://cdn.tiny.cloud/1/8a09qtqq8gwqfnj049ypv7aiyphqexh8n4rtbyw3xvs59wtj/tinymce/5/tinymce.min.js" referrerpolicy="origin"></script>
	<style>
		.section-bg .bg-1{background:#333b3d;}
		.section-bg .bg-2{background:#f7f7f7; height:100vh;}
		.navbar-dashboard p{color:#fff;}
	
		.left-side dt{font-size:.8rem; color:#cfcfcf;}
		.left-side dd a{display:block; color:#454545; text-decoration:none;}
		.left-side dd.active a{font-weight:700; color:#1dc078;}
		.left-side dd:hover{background:#fff;}
		.left-side dd.active:hover a{color:#454545;}
		
		.course-table .table th{text-align:center;}
		.course-table .table th, .course-table .table td{vertical-align:middle;}
		.course-table .table a{color:#333; text-decoration:none;}
		.course-thumbnail{max-width:50px; min-width:45px;}
		.course-thumbnail img{width:100%; height:100%;}
		@media screen and (max-width:1024px) {
			.course-table{overflow-x:scroll;}
			.course-table .table{width:1920px;}
		}
	</style>
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
						<%@ include file="../teacher-mypage-leftbar.jsp" %>
					</div>
					<div class="col-10 right-instructor">
						<div class="row">
							<div class="col course-table">
								<table class="table">
									<thead>
										<tr>
											<th>이미지</th>
											<th>강의명</th>
											<th>평점</th>
											<th>총 수강생</th>
											<th>질문</th>
											<th>총 수입</th>
											<th>상태</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="classes" items="${classes }">
											<tr>
												<td class="text-center course-thumbnail"><img src="/resources/images/course/${classes.uploadfiles }" alt="" /></td>
												<td><a href="">${classes.title }</a></td>
												<td class="text-center"><a href="">4.5 점</a></td>
												<td class="text-center"><a href="">1234 명</a></td>
												<td class="text-center"><a href="">1 개</a></td>
												<td class="text-center">₩ 10000</td>
												<td class="text-center">${classes.status }</td>
												<td class="text-center"><button type="button" class="btn btn-danger">강의삭제</button></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
<script type="text/javascript">
</script>
</body>
</html>