<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커리큘럼</title>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1>내 강의 만들기</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<p>강의제작</p>
			<p>커리큘럼</p>
			<form class="border bg-light p-3" method="post" action="insert.do" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">섹션 0:첫번째 섹션의 제목을 입력해주세요.</label>
					<input type="text" class="form-control" name="chapterTitle" />
				</div>
				<div class="mb-3">
					<label class="form-label">수업 1:첫번째 수업 만들어주세요.</label>
					<input type="text" class="form-control" name="chapterTitle" />
				</div>
				<div class="mb-3">
					<label class="form-label">수업 2:두번째 수업 만들어주세요.</label>
					<input type="text" class="form-control" name="chapterTitle" />
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</body>
</html>