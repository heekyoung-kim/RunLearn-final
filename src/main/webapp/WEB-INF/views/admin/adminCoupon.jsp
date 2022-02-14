<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>

<html lang="ko">
<style>

	.card-wrapper{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    padding: .5rem;
	    height: 182px;
	    width: 33.33%;		
	}
	.card{
		-webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    display: flex;
	    flex-direction: column;
	    border-radius: 6px;
	    width: 100%;
	    height: 100%;
	    box-shadow: 2px 2px 4px 0 rgba(20,20,20,.1);
	    background-color: #fff;
	}
	.card-header{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    display: flex;
	    align-items: start;
	    padding: 8px;
	    width: 100%;
	    border-bottom: 1px solid #dbdbdb;
	}
	
	.card-title{
		-webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    margin: 0;
	    padding: 0;
	    line-height: 1.5;
	    letter-spacing: -.3px;
	    font-size: 16px;
	    font-weight: 700;
	}
	
	.move-button{
		-webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    box-sizing: inherit;
	    text-decoration: none;
	    cursor: pointer;
	    display: flex;
	    align-items: center;
	    margin-left: auto;
	    color: #495057;
	    font-weight: 700;
	    font-size: 14px;
	}
	
	.move-button-text{
		-webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    text-rendering: `imizeSpeed;
	    text-size-adjust: 100%;
	    cursor: pointer;
	    color: #495057;
	    box-sizing: inherit;
	    padding: 0;
	    margin: 0;
	    line-height: 1.43;
	    letter-spacing: -.3px;
	    font-size: 14px;
	    display: inline-block;
	    margin-right: 5px;
	    font-weight: 700;
	}
	
	.move-button-icon{
		-webkit-font-smoothing: antialiased;
    	-webkit-tap-highlight-color: transparent;
    	--swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    cursor: pointer;
	    color: #495057;
	    font-weight: 700;
	    font-size: 14px;
	    fill: none;
	    width: 14;
	    box-sizing: inherit;
	    display: inline-block;
	    height: 15px;
	}
	
	.card-body{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    position: relative;
	    width: 100%;
	    height: 100%;
	}
	
	.card-summary-body{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    font-size: 1rem;
	    font-weight: 400;
	    line-height: 1.5;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    color: #000a12;
	    box-sizing: inherit;
	    display: flex;
	    justify-content: center;
	    align-items: center;
	    flex-direction: column;
	    width: 100%;
	    height: 100%;
	}

	.card-body-content{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    box-sizing: inherit;
	    padding: 0;
	    margin: 0;
	    color: #adb5bd;
	    text-align: center;
	    font-weight: 700;
	    line-height: 1.25;
	    letter-spacing: -.3px;
	    font-size: 24px;
	}
	.graph-body-content{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    box-sizing: inherit;
	    padding: 0;
	    margin: 0;
	    color: #adb5bd;
	    text-align: center;
	    font-weight: 700;
	    line-height: 1.25;
	    letter-spacing: -.3px;
	    font-size: 40px;
	}
	
	.process-card-body-content{
	    -webkit-font-smoothing: antialiased;
	    -webkit-tap-highlight-color: transparent;
	    --swiper-theme-color: #007aff;
	    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
	    text-rendering: optimizeSpeed;
	    text-size-adjust: 100%;
	    box-sizing: border;
	    width : 100%;,
	    padding: 0;
	    margin: 0;
	    color: black;
	    text-align: center;
	    font-weight: 700;
	    line-height: 1.25;
	    letter-spacing: -.3px;
	    font-size: 24px;
	}
    

    .mainApp{
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    width: 100%;
    }
    
    .dashboard-summary{
    	    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    display: flex;
    flex-wrap: wrap;
    padding: 20px 20px 0;
    width: 100%;
    }
    
    .dashboard-title{
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    margin: 0;
    padding: 0;
    margin-left: 8px;
    font-weight: 700;
    line-height: 1.25;
    letter-spacing: -.3px;
    font-size: 24px;
    }
    
    .chart-container{
        -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    display: flex;
    flex-direction: row;
    max-height: 350px;
    padding-bottom: 30px;
    }
    
    .chart-wrapper{
        -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    position: relative;
    margin: auto;
    padding-top: min(100%,320px);
    max-width: 600px;
    width: 100%;
    }
    
    .dashboard-revenue__chart{
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    aspect-ratio: auto 240 / 240;
    position: absolute;
    top: 0;
    max-width: 100%;
    max-height: 100%;
    display: block;
    box-sizing: border-box;
    height: 320px;
    width: 320px;
    }
    
  	.graph-wrapper{
  	-webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    width: 50%;
    height: 500px;
    padding: 8px;
    }
</style>
<head>
	<title>인프런 홈페이지</title>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/3.5.0/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js@3.0.0/dist/chart.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels@2.0.0"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@ include file="../common/nav.jsp" %>
	<div class="body">
<!-- left bar -->	
<%@ include file="../admin/adminLeftBar.jsp" %>
<!-- 시작 -->
<div class="mainApp">
<section class="">
	<div class="row mb-3">
		<div class="col">
			<h3 class="dashboard-title ms-4">쿠폰 목록</h3>
		</div>
		<div class="row mb-3 mt-4">
			<div class="col">
				<form id="form-search-coupon" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="coupon">
					<input type="hidden" name="couponPage" value="1"/>
					<div class="col-12">
						<select class="form-select" name="couponOpt">
							<option value="이름" selected ${'이름' eq param.couponOpt ? 'selected' : ''}>쿠폰 이름</option>
							<option value="번호" ${'번호' eq param.couponOpt ? 'selected' : ''}>쿠폰 번호</option>
						</select>
					</div>
					<div class="col-12">
						<input type="text" class="form-control" name="couponValue" value="${param.couponValue }">
					</div>
					<div class="col-12">
						<button type="submit" class="btn btn-outline-secondary btn-sm" id="btn-search-coupon">검색</button>
					</div>
					<div class="col-12">
						<button type="button" class="btn btn-danger btn-sm float-end mt-2" id="btn-delete-coupon">쿠폰 삭제</button>
						<button type="button" class="btn btn-primary btn-sm float-end mt-2" id="btn-create-coupon" data-bs-toggle="modal" data-bs-target="#couponCreateModal">쿠폰 생성</button>
					</div>
				</form>
			</div>
		</div>
		
		<div class="col-12 radioButton">
			<table class="table" id="table-books">
				<thead>
					<tr>
						<th style="width: 5%;"></th>
						<th style="width: 10%;">쿠폰 번호</th>
						<th style="width: 65%;">쿠폰 이름</th>
						<th style="width: 15%;">쿠폰 기간</th>
						<th style="width: 15%"></th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty coupons }">
							<tr>
								<td class="text-center" colspan="6">등록된 쿠폰이 없습니다.</td>
							</tr>
							</c:when>
								<c:otherwise>
									<c:forEach var="coupons" items="${coupons }" varStatus="loop">
										 <tr>
							  				<td>
							  					<input class="form-check-input" type="radio" name="coupon" id="coupon-check-${coupons.couponNo}"  value="${coupons.couponNo}">
							  				</td>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${coupons.couponNo}}">
									    			${loop.count }
									  			</label>
							  				</td>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${coupons.couponNo}">
									    			${coupons.couponName }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${coupons.couponNo}">
									    			${coupons.couponPeriod }일
									  			</label>
									  		</td>
							  			</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<c:if test="${couponPagination.totalRecords gt 0 }">
					<!-- 페이지 내비게이션 표시 -->
					<div class="row mt-3 mb-3">
						<div class="col">
							<nav>
					  			<ul class="pagination justify-content-center">
					    			<li class="page-item ${couponPagination.existPrev ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/coupon?couponPage=${couponPagination.prevPage }" data-page="${couponPagination.prevPage }">이전</a>
					    			</li>
				
					    			<c:forEach var="num" begin="${couponPagination.beginPage }" end="${couponPagination.endPage }">
						    			<li class="page-item ${couponPagination.pageNo eq num ? 'active' : '' }">
						    				<a class="page-link" href="/admin/coupon?couponPage=${num }" data-page="${num }">${num }</a>
						    			</li>	    			
					    			</c:forEach>
				
					    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/coupon?couponPage=${couponPagination.nextPage }" data-page="${couponPagination.nextPage }">다음</a>
					    			</li>
					  			</ul>
							</nav>
						</div>
					</div>
				</c:if>
			</section>
			
			
			<section class="mt-3">
				<div class="row mb-3">
					<div class="col">
						<h3 class="dashboard-title ms-4 mb-4">유저 쿠폰 보유 목록</h3>
					</div>

<!-- 유저 쿠폰 보유 검색 -->		
<div class="row mb-3 mt-2">
	<div class="col">
		<form id="form-search-userCoupon" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="coupon">
			<input type="hidden" name="userCouponPage" value="1"/>
			<div class="col-12">
				<select class="form-select" name="userCouponOpt">
					<option value="이름" selected ${'번호' eq param.userCouponOpt ? 'selected' : ''}>회원 이름</option>
					<option value="메일" ${'메일' eq param.userCouponOpt ? 'selected' : ''}>회원 이메일</option>
				</select>
			</div>
			<div class="col-12">
				<input type="text" class="form-control" name="userCouponValue" value="${param.userCouponValue }">
			</div>
			<div class="col-12">
				<button type="submit" class="btn btn-outline-secondary btn-sm" id="btn-search-userCoupon">검색</button>
			</div>
			<div class="col-12"></div>
			<div class="col-12 align-self-end">
				<button type="button" class="btn btn-danger btn-sm float-end mt-2" id="btn-delete-userCoupon">쿠폰 삭제</button>
				<button type="button" class="btn btn-primary btn-sm float-end mt-2" id="btn-register-userCoupon">쿠폰 등록</button>
			</div>
		</form>
	</div>
</div>
					<div class="col-12 checkbox">
						<table class="table" id="table-coupon">
							<thead>
								<tr>
									<th style="width: 5%;">
										<input class="form-AllCheckbox-input" type="checkbox" name="checkAllCoupon" id="checkAllCoupon">
									</th>
									<th style="width: 5%;">번호</th>
									<th style="width: 10%;">회원 이름</th>
									<th style="width: 15%;">회원 아이디</th>
									<th style="width: 55%;">보유 쿠폰</th>
									<th style="width: 10;"></th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty couponUsers}">
									<tr>
										<td class="text-center" colspan="6">쿠폰 보유 인원이 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="couponUsers" items="${couponUsers }" varStatus="loop">
										<tr>
											<td>
							  					<input class="form-checkbox-input" type="checkbox" name="userCoupon" id="user-check-${loop.count}" value="${couponUsers.userNo}" >
							  				</td>
											<td>${couponUsers.userNo }</td>
											<td>${couponUsers.userName }</td>
											<td>${couponUsers.userEmail }</td>
											<td>
											 	<c:choose>
													<c:when test="${empty couponUsers.couponList}">
																<a>보유 쿠폰이 없습니다.</a>
													</c:when>
													 <c:otherwise>
														<c:forEach var="couponList" items="${couponUsers.couponList}" varStatus="loop">
																<input type="checkbox" class="btn-check" id="btn-check-outlined-${couponList.userNo}-${couponList.couponNo}" autocomplete="off" value="${couponList.userNo},${couponList.couponNo}">
																<label class="btn btn-outline-secondary" for="btn-check-outlined-${couponList.userNo}-${couponList.couponNo}">${couponList.couponName }</label>
														</c:forEach>
													</c:otherwise>
												</c:choose>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
				<c:if test="${couponPagination.totalRecords gt 0 }">
					<!-- 페이지 내비게이션 표시 -->
					<div class="row mt-3 mb-3">
						<div class="col">
							<nav>
					  			<ul class="pagination justify-content-center">
					    			<li class="page-item ${userCouponPagination.existPrev ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/coupon?userCouponPage=${userCouponPagination.prevPage }" data-page="${userCouponPagination.prevPage }">이전</a>
					    			</li>
				
					    			<c:forEach var="num" begin="${userCouponPagination.beginPage }" end="${userCouponPagination.endPage }">
						    			<li class="page-item ${userCouponPagination.pageNo eq num ? 'active' : '' }">
						    				<a class="page-link" href="/admin/coupon?userCouponPage=${num }" data-page="${num }">${num }</a>
						    			</li>	    			
					    			</c:forEach>
				
					    			<li class="page-item ${userCouponPagination.existNext ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/coupon?userCouponPage=${userCouponPagination.nextPage }" data-page="${userCouponPagination.nextPage }">다음</a>
					    			</li>
					  			</ul>
							</nav>
						</div>
					</div>
				</c:if>	
			</section>
			
<!-- 글쓰기 모달창 -->
<div class="modal fade" id="couponCreateModal" tabindex="-1" role="dialog" aria-labelledby="writeBoardLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="writeBoardLabel">쿠폰 생성</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="addCoupon-form" method="post" action="/addCoupon">
				<div class="modal-body">
						<div class="form-group mb-3">
							<label for="name">쿠폰 이름</label>
	 						<input type="text" name="name" class="form-control" id="couponName" placeholder= "쿠폰 이름을 입력하세요">
	 						<div class="alert alert-danger" id="alert-error-addCouponName" style="display:none;"></div>						
						</div>			
					  	<div class="row form-group mb-3">
					  			<div class="col-3">
									<select class="form-select" name="discountOpt">
										<option value="할인율" selected>할인율</option>
										<option value="할인금액" >할인금액</option>
									</select>
								</div>
								<div class="col-9">
	 								<input type="text" name="discount" class="form-control" id="discount" placeholder= "할인조건을 입력해주세요" style="width:; height:;">
	 								<div class="alert alert-danger" id="alert-error-addCouponDiscount" style="display:none;"></div>
	 							</div>		
						</div>
						<div class="form-group mb-3">
							<label for="name">쿠폰 기간</label>
	 						<input type="text" name="period" class="form-control" id="period" placeholder= "쿠폰 기간(일)을 입력하세요">
	 						<div class="alert alert-danger" id="alert-error-addCouponPeriod" style="display:none;"></div>						
						</div>				
				</div>
				<div class="modal-footer">
					<button type= "button" class="btn btn-outline-success" id="btn-addCoupon" >등록</button>
					<button type= "button" class="btn btn-outline-secondary" data-bs-dismiss="modal" >취소</button>
				</div>
			</form>
	</div>
</div>			
		</div>
	</div>
<script type="text/javascript">
	
	// 쿠폰 검색 클릭시
	$("#form-search-coupon").submit(function(){
		var couponOpt = $("select[name=couponOpt]").val();
		var couponValue = $.trim((":input[name=couponValue]").val());
		
		if(couponOpt && couponValue){
			$("#form-search-coupon").trigger("submit");
		}
		
		
	});
	
	// 유저 쿠폰 검색 클릭시
	$("#btn-search-userCoupon").click(function(){
		var userCouponOpt = $("select[name=userCouponOpt]").val();
		var userValue = $.trim((":input[name=userCouponValue]").val());
		
		if(userCouponOpt&&userValue){
		$("#form-search-coupon").trigger("submit");
		}
		
		alert("검색 조건을 입력하세요");
		
	});
	
	// 쿠폰 삭제 버튼 클릭
	$("#btn-delete-coupon").click(function(){
		var couponNo;
		$(".radioButton .form-check-input").each(function(){
			if($(this).is(":checked"))
				couponNo = $(this).val();
		})
		
		$.getJSON({
			type: "post"
			,url: "/rest/deleteCoupon"
			,dataType: "json"
			,data: {
				couponNo: couponNo
			},
			success : function(response){
				if(response.status == "OK"){
					alert("삭제 되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
		
	});
	
	// 쿠폰 전체 선택
	$("#checkAllCoupon").click(function(){
		
		if($(this).is(":checked")) 
			$(".checkbox .form-checkbox-input").attr("checked","checked");  
        else  
        	$(".checkbox .form-checkbox-input").removeAttr("checked");

	});
	
	// 유저 쿠폰 등록 버튼
	$("#btn-register-userCoupon").click(function(){
		let userNo="";
		
		$(".checkbox .form-checkbox-input").each(function(){
			if($(this).is(":checked"))  // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
				userNo+=$(this).val()+" "; 
		})
		
		var couponNO;
		$(".radioButton .form-check-input").each(function(){
			if($(this).is(":checked"))
				couponNo = $(this).val();
		})
		
		
		$.getJSON({
			type: "post"
			,url: "/rest/addUserCoupon"
			,dataType: "json"
			,data: {
				 userNo: userNo,
				 couponNo: couponNo
			},
			success : function(response){
				if(response.status == "OK"){
					alert("유저 쿠폰이 발급되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
		
	});
	
	// 유저 쿠폰 삭제 버튼
	$("#btn-delete-userCoupon").click(function(){
		var userCoupon ="";
		$(".checkbox .btn-check").each(function(){
			if($(this).is(":checked"))  // ":checked"를 이용하여 체크가 되어있는지 아닌지 확인한다.
				userCoupon += $(this).val() + " "; 
		})
		
		$.getJSON({
			type: "post"
			,url: "/rest/deleteUserCoupon"
			,dataType: "json"
			,data: {
				userCoupon: userCoupon
			},
			success : function(response){
				if(response.status == "OK"){
					alert("쿠폰이 삭제 되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
	});
	
	$("#btn-addCoupon").click(function(event){
		
		
		var name = $("#addCoupon-form [name=name]").val();
		var discount = $("select[name=discountOpt]").val();
		var discountRate;
		var discountPrice;
		var period = $("#addCoupon-form [name=period]").val();
		
		
		if(discount=="할인율"){
			discountRate= $("#addCoupon-form [name=discount]").val();
			console.log(discountRate);
		}
		
		if(discount=="할인금액"){
			discountPrice= $("#addCoupon-form [name=discount]").val();
			console.log(discountPrice);
		}
		
		if(name == ""){
			$("#alert-error-addCouponName").show().text("쿠폰 이름을 입력해주세요.");
			return;
		}
		$("#alert-error-addCouponName").hide();
			
		if(discountRate == "" || discountPrice == ""){
			$("#alert-error-addCouponDiscount").show().text("할인 조건을 입력해주세요.");
			return;
		}
		$("#alert-error-addCouponDiscount").hide();
		
		if(period == ""){
			$("#alert-error-addCouponPeriod").show().text("쿠폰 기간을 입력해주세요.");
			return;
		}
		$("#alert-error-addCouponPeriod").hide();
		
		$.getJSON({
			type: "post"
			,url: "/rest/addCoupon"
			,dataType: "json"
			,data: {
				 name: name
				,discountRate: discountRate
				,discountPrice: discountPrice
				,period: period
			},
			success : function(response){
				if(response.status == "OK"){
					alert("글이 등록되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
		
	})
	
	
</script>
</body>
</html>