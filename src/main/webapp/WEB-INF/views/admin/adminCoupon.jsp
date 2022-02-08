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
	    text-rendering: optimizeSpeed;
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
						<h3 class="dashboard-title ms-4">쿠폰 목록 <a href="insert.do" class="btn btn-outline-primary btn-sm float-end mt-2">쿠폰 등록</a></h1>
					</div>
				
					<div class="col-12">
						<table class="table" id="table-books">
							<thead>
								<tr>
									<th style="width: 10%;">쿠폰 번호</th>
									<th style="width: 65%;">쿠폰 이름</th>
									<th style="width: 15%;">쿠폰 기간</th>
									<th style="width: 20%"></th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty coupons }">
									<tr>
										<td class="text-center" colspan="6">등록된 도서 정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="coupons" items="${coupons }" varStatus="loop">
										<tr>
											<td>${loop.count }</td>
											<td>${coupons.couponName }</td>
											<td>${coupons.couponPeriod }일</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
			<section class="mt-3">
				<div class="row mb-3">
					<div class="col">
						<h3 class="dashboard-title ms-4">쿠폰 보유 유저 목록</h3>
					</div>
				
					<div class="col-12">
						<table class="table" id="table-books">
							<thead>
								<tr>
									<th style="width: 10%;">회원 이름</th>
									<th style="width: 65%;">회원 아이디</th>
									<th style="width: 15%;">쿠폰 이름</th>
									<th style="width: 20%">쿠폰 기간</th>
								</tr>
							</thead>
							<tbody>
							<c:choose>
								<c:when test="${empty coupons }">
									<tr>
										<td class="text-center" colspan="6">등록된 도서 정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="coupons" items="${coupons }" varStatus="loop">
										<tr>
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</section>
		</div>
	</div>
<script type="text/javascript">



</script>
</body>
</html>