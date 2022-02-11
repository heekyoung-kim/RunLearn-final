<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<p>강의정보</p>
			<form class="border bg-light p-3" method="post" action="insert.do" enctype="multipart/form-data">
				<div class="mb-3">
					<label class="form-label">제목</label>
					<input type="text" class="form-control" name="title" />
				</div>
				<div class="mb-3">
						<div class="form-label">카테고리</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="1">
		  						<label class="form-check-label" for="">개발-프로그래밍</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="2">
		  						<label class="form-check-label" for="">보안-네트워크</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="3">
		  						<label class="form-check-label" for="">데이터-사이언스</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="4">
		  						<label class="form-check-label" for="">웹 개발</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="5">
		  						<label class="form-check-label" for="">프론트엔드</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="6">
		  						<label class="form-check-label" for="">HTML/CSS</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="7">
		  						<label class="form-check-label" for="">Front-end</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="8">
		  						<label class="form-check-label" for="">웹 퍼블리싱</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="9">
		  						<label class="form-check-label" for="">React</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="10">
		  						<label class="form-check-label" for="">jQuery</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="11">
		  						<label class="form-check-label" for="">ES6</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="12">
		  						<label class="form-check-label" for="">보안</label>
							</div>
							<div class="form-check form-check-inline">
		  						<input class="form-check-input" type="radio" name="categoryNo" id="categoryNo" value="13">
		  						<label class="form-check-label" for="">데이터분석</label>
							</div>
							</div>
							<div class="form-label">강의 수준</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="입문">
				  						<label class="form-check-label" for="">입문</label>
							</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="중급">
				  						<label class="form-check-label" for="">중급</label>
							</div>
							<div class="form-check form-check-inline">
				  						<input class="form-check-input" type="radio" name="difficultly" id="difficultly" value="중급이상">
				  						<label class="form-check-label" for="">중급이상</label>
							</div>
							<div class="mb-3">
								<label class="form-label">상세 내용</label><br>
								<textarea cols="80" name="content" placeholder="내용을 입력해주세요"></textarea>
							</div>
							<div class="mb-3">
								<label class="form-label">대표 이미지</label> 
								<input type="file" class="form-control" name="uploadFiles">
							</div>
							<div class="d-inline-flex p-1 bd-highlight">
								<label class="form-label">가격</label>
								<input type="number" class="form-control" name="price"/>
							</div><br>
							<div class="d-inline-flex p-1 bd-highlight">
								<label class="form-label">할인가격</label>
								<input type="number" class="form-control" name="discountPrice"/>
							</div>
								<div class="text-end">
								<a href="list.do" class="btn btn-secondary">취소</a>
								<button type="submit" class="btn btn-primary">등록</button>
							</div>
						</form>
					</div>
				</div>
			</div>
</body>
<script type="text/javascript">
var categoryNo =$('input[name=categoryNo]:checked').val();
$('input:radio[name=categoryNo]').is(':checked');

var difficultly =$('input[name=difficultly]:checked').val();
$('input:radio[name=difficultly]').is(':checked');

</script>

</html>