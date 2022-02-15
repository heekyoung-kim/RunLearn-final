<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
	<title>인프런 홈페이지</title>
	<style>
		.section-1{background:#002333;}
		.section-1 .section-bg{padding:1.5rem 0;}
		.section-1 .text-box{position:relative;}
		
		.video-area{position:relative; width:100%; padding-bottom:56.25%;}
		.video-area #video{position:absolute; width:100%; height:100%;}
	</style>
	
</head>
<body>
<%@ include file="../../common/nav_lecture.jsp" %>
<div class="container-fluid section-1">
	<div class="row section-bg">
		<div class="col">
			<div class="container">
				<div class="row">
					<div class="col">
						<a href="../dashboard">강의 대시보드</a> <p class="d-inline text-white">${classDetail.detailTitle }</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col my-3">
			<div class="video-area">
				<iframe id="video" src="https://www.youtube.com/embed/${classDetail.detailContent }" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
			</div>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
<script>
</script>
</body>
</html>