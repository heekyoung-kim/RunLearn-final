<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커리큘럼</title>
<style>
	header {
	    color: #fff;
   	 	height: 64px;
    	background: #333b3d;
	}
		
	.header-wrapper {
		max-width: 1280px;
		height: 100%;
		margin: 0 auto;
		display: flex;
   		align-items: center;
	}
	.header-wrapper h1 {
		font-weight: 800;
   		 font-size: 24px;
	}		
	
	.main {
		background-color: #f5f5f5;
		padding-top: 24px;
	}

	.curriculum-wrapper {
	background-color: #fff;
	 max-width: 996px;
	 margin: 0 auto;
  	 box-shadow: 0 2px 10px 0 hsl(0deg 0% 75% / 50%);
   	 padding: 20px;
   	 
	}

	.curriculum-wrapper img {
		width: 100%;
	}
	
	.title-heading {
		font-size: 14px;
   		color: #929292;
  	 	font-weight: 800;
	}
	
	.title-sub-heading {
		font-size: 24px;
	    color: #330;
	    font-weight: 800;
	    padding-bottom: 1rem;
	}
	
	.form-label {
		font-size: 24px;
	    color: #330;
	    font-weight: 800;
	    padding-bottom: 1rem;
	}
	
	.span {
		font-size: 15px;
		padding-bottom: 1rem;
	}
	
</style>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
<div class="wrapper">
	<header>
	<div class="header-wrapper">
		<h1>내 강의 만들기</h1>
	</div>
	</header>
	<div class="main">
		<div class="curriculum-wrapper">
			<p class='title-heading'>강의제작</p>
			<p class='title-sub-heading'>커리큘럼</p>
			<form class="border bg-light p-3" method="post" action="insertDetail.do" enctype="multipart/form-data">
				<div class="mb-3">
					<input type="hidden" name="no" value="${no }" />
					<label class="form-label">유튜브 제목을 입력해주세요.</label>
					<input type="text" class="form-control" name="chapterTitle" />
				</div>
				<div>
					<label class="form-label">학습 목표를 입력해 주세요.</label>
					<input type="text" class="form-control" name="chapterContent">
				</div>
				<div class="mb-3" id="box">
					<label class="form-label">유튜브 수업내용을 입력해주세요.</label>
					<input type="text" class="form-control" name="detailTitle">
				</div>
				<div class="mb-3">
					<label class="form-label">유튜브 주소를 입력해주세요.<span class="form-label span">    예)https://www.youtube.com/watch?v= 주소입력값</span></label>
					<input type="text" class="form-control" name="detailContent" />
				</div>
				<div>
					<img src="../resources/images/course/youtube.png">
				</div>
				<div class="form-label">카테고리</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="detailFree" id="detailFree" value="Y">
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
	
</script>
</html>