<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<c:set var="menu" value="부서"/>
<%@ include file="/WEB-INF/views/common/nav.jsp" %>
<div class="container">
	<div class="row mb-3">
		<div class="col">
			<h1 class="fs-4">부서 정보 등록 폼</h1>
		</div>
	</div>
	<div class="row mb-3">
		<div class="col">
			<p class="mb-3">새로 등록할 부서정보를 입력하세요</p>
			<form class="border px-3 pb-3 bg-light row g-3" method="post" action="insert.do">
  				<div class="col-md-6">
    				<label class="form-label">부서명</label>
    				<input type="text" class="form-control" name="name">
  				</div>
  				<div class="col-md-6">
    				<label class="form-label">부서 소재지</label>
    				<select class="form-select" name="locationId">
    					<option value=""> 부서 소재도시를 선택하세요</option>
    					<!-- 
    						Locations 테이블의 데이터를 조회해서 <option />태그를 생성하도록 한다.
    					 -->
    					<option value="1000"> Roma</option>
    					<option value="1100"> venice</option>
    					<option value="1200"> Tokyo</option>
    					<option value="1300"> Hiroshima</option>
    					<option value="1400"> Southlake</option>
    					<option value="1500"> South San Francisco</option>
    				</select>
  				</div>
  				<div class="col-12 text-end">
  					<button type="submit" class="btn btn-primary">등록</button>
  				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>