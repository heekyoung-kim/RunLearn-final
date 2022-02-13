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
			<h3 class="dashboard-title ms-4">유저 목록</h3>
		</div>
		<div class="row mb-3 mt-4">
				<div class="col-10">
					<form id="form-search-user" class="row row-cols-lg-auto g-3 align-items-center" method="get" action="adminUser">
						<input type="hidden" name="classPage" value="1"/>
						<div class="col-12">
							<select class="form-select" name="opt">
								<option value="이름" selected ${'이름' eq param.opt ? 'selected' : ''}>이름</option>
								<option value="유저번호" ${'유저번호' eq param.opt ? 'selected' : ''}>유저번호</option>
								<option value="전화번호" ${'전화번호' eq param.opt ? 'selected' : ''}>전화번호</option>
								<option value="가입일" ${'가입일' eq param.opt ? 'selected' : ''}>가입일</option>
							</select>
						</div>
						<div class="col-12">
							<input type="text" class="form-control" name="value" value="${param.value }">
						</div>
						<div class="col-12">
							<button type="submit" class="btn btn-outline-secondary btn-sm" id="btn-search-user">검색</button>
						</div>
						<div class="col-12">
							<button type="button" class="btn btn-danger btn-sm float-end mt-2" id="btn-delete-user">삭제</button>
							<button type="button" class="btn btn-primary btn-sm float-end mt-2" id="btn-restore-user">복구</button>
						</div>
					</form>
				</div>
				<div class="col-2 text-end" id="sort-form">
						<form class="sort" method="get" action="adminUser">
							<select class="form-select-sm" name="sort">
								<option value="번호순" ${'번호순' eq param.sort ? 'selected' : ''}>번호순</option>
								<option value="낮은가입일" ${'낮은가입일' eq param.sort ? 'selected' : ''}>가입일▽</option>
								<option value="높은가입일" ${'높은가입일' eq param.sort ? 'selected' : ''}>가입일△</option>
								<option value="지식공유자순" ${'지식공유자순' eq param.sort ? 'selected' : ''}>지식공유자순</option>
								<option value="삭제여부순" ${'삭제여부순' eq param.sort ? 'selected' : ''}>삭제여부순</option>
							</select>
						</form>
				</div>
		</div>
		
		<div class="col-12 checkbox">
			<table class="table" id="table-class">
				<thead>
					<tr>
						<th style="width: 5%;"></th>
						<th style="width: 5%;">번호</th>
						<th style="width: 8%;">이름</th>
						<th style="width: 31%;">전화번호</th>
						<th style="width: 10%;">가입일</th>
						<th style="width: 10%;">포인트</th>
						<th style="width: 10%">지식공유자 여부</th>
						<th style="width: 10%">삭제 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty users }">
							<tr>
								<td class="text-center" colspan="6">등록된 회원이 없습니다.</td>
							</tr>
							</c:when>
								<c:otherwise>
									<c:forEach var="users" items="${users }" varStatus="loop">
										 <tr>
							  				<td>
							  					<input class="form-radiobox-input" type="radio" name="user" id="user-radio-${users.no}"  value="${users.no}">
							  				</td>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}}">
									    			${users.no }
									  			</label>
							  				</td>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
									  				${users.name }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
										  			${users.tel }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
									    			${users.createdDate }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
									    			${users.point }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
									    			${users.teacherYN }
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${users.no}">
									    			${users.deletedYN }
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
				<c:if test="${pagination.totalRecords gt 0 }">
					<!-- 페이지 내비게이션 표시 -->
					<div class="row mt-3 mb-3">
						<div class="col">
							<nav>
					  			<ul class="pagination justify-content-center">
					    			<li class="page-item ${pagination.existPrev ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/adminUser?page=${pagination.prevPage }&sort=${criteria.sort}" data-page="${pagination.prevPage }&sort=${criteria.sort}">이전</a>
					    			</li>
				
					    			<c:forEach var="num" begin="${pagination.beginPage }" end="${pagination.endPage }">
						    			<li class="page-item ${pagination.pageNo eq num ? 'active' : '' }">
						    				<a class="page-link" href="/admin/adminUser?page=${num }&sort=${criteria.sort}" data-page="${num }&sort=${criteria.sort}">${num }</a>
						    			</li>	    			
					    			</c:forEach>
				
					    			<li class="page-item ${pagination.existNext ? '' : 'disabled' }">
					      				<a class="page-link" href="/admin/adminUser?page=${pagination.nextPage }&sort=${criteria.sort}" data-page="${pagination.nextPage }&sort=${criteria.sort}">다음</a>
					    			</li>
					  			</ul>
							</nav>
						</div>
					</div>
				</c:if>
			</section>
</div>
</div>	
<script type="text/javascript">
	//강의 검색 클릭시
	$("#form-search-user").submit(function(){
		var opt = $("select[name=opt]").val();
		var value = $.trim((":input[name=value]").val());
		
		if(opt && value){
			$("#form-search-user").trigger("submit");
		}
		
	});
	
	// 유저 복구 버튼
	$("#btn-restore-user").click(function(){
		
		var userNo;
		$(".form-radiobox-input").each(function(){
			if($(this).is(":checked"))
				userNo = $(this).val();
		})
		
		$.getJSON({
			type: "post"
			,url: "/rest/restoreUser"
			,dataType: "json"
			,data: {
				userNo : userNo
			},
			success : function(response){
				if(response.status == "OK"){
					alert("회원이 복구 되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
	});
	
	// 유저 삭제 버튼
	$("#btn-delete-user").click(function(){
		
		var userNo;
		$(".form-radiobox-input").each(function(){
			if($(this).is(":checked"))
				userNo = $(this).val();
		})
		
		$.getJSON({
			type: "post"
			,url: "/rest/deleteUser"
			,dataType: "json"
			,data: {
				userNo : userNo
			},
			success : function(response){
				if(response.status == "OK"){
					alert("회원이 삭제 되었습니다.");
					location.reload(true);
				}else{
					$("#alert-error-register").show().text(response.error);
				}	
			}
		})
	});
	
	// sort 정보를 서버에 전달
	$("#sort-form select").on("change", function(){
		var sortValue = $(this).val();
		
		$(".sort").trigger("submit");
	});
	
</script>
</body>
</html>