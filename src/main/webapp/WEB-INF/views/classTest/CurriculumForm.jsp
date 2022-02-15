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
			<form class="border bg-light p-3" method="post" action="insertDetail.do" enctype="multipart/form-data">
				<div class="mb-3">
					<input type="hidden" name="no" value="${no }" />
					<label class="form-label">섹션 0:첫번째 섹션의 제목을 입력해주세요.</label>
					<input type="text" class="form-control" name="chapterTitle" />
				</div>
				<div>
					<label class="form-label">학습 목표를 입력해 주세요.</label>
					<input type="text" class="form-control" name="chapterContent">
				</div>
				<div class="mb-3" id="box">
					<label class="form-label">수업 1:첫번째 수업 만들어주세요.</label>
					<input type="text" class="form-control" name="detailTitle"> <input type="button" name="detailTitle" value="수업 추가하기" onclick="add_textbox()">
				</div>
				<div class="mb-3">
					<label class="form-label">유튜브 주소를 입력해주세요</label>
					<input type="text" class="form-control" name="detailContent" />
				</div>
				<div class="form-label">카테고리</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="detailFree" id="detailFree" value="N">
  						<label class="form-check-label" for="">무료</label>
					</div>
				
					<div class="text-end">
					<a href="" class="btn btn-secondary">취소</a>
					<button type="submit" class="btn btn-primary">등록</button>
				</div>
			</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
	var detailFree =$('input[name=detailFree]:checked').val();
	$('input:radio[name=detailFree]').is(':checked');
	
	const add_textbox = () => {
        const box = document.getElementById("box");
        const newP = document.createElement('p');
        newP.innerHTML = "<input type='text'> <input type='button' value='삭제' onclick='remove(this)'>";
        box.appendChild(newP);
    }
    const remove = (obj) => {
        document.getElementById('box').removeChild(obj.parentNode);
    }
</script>
</html>