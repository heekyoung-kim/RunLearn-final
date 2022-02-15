<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <title></title>
   	<style>
		#filter-btn-group .checked{color: #1dc078;}
		.card{positon:relative;}
		.modal-card{display:none; position:absolute; top:0;}
		.card:hover .modal-card{display:block; background:#000; font-size:14px; opacity:.9; z-index:10;}
		.modal-active-btn{position:absolute; right:0; bottom:0; z-index:1000; cursor:pointer;}
		.modal-active-btn i{color:#fff;}
	</style>
</head>
<body>
<%@ include file="../../common/nav.jsp" %>
<div class="container">
  	<div class="row mt-3">
		<div class="col-3">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-9 my-4">
			<div class="mt-2">
				<span>정렬기준</span>
				<select>
					<option value="new">최신순</option>
					<option value="studentCnt">학생수순</option>
					<option value="title">제목순</option>
					<option value="stars">평점순</option>
				</select>
			</div>
			<div class="row row-cols-1 row-cols-md-2 row-cols-xl-4 mt-3 gx-4">
			<c:forEach var="wishlist" items="${wishlists}">
				<div class="col mb-3" id="card-${wishlist.wishNo }">
					<div class="card h-100">
						<a href="/course/${wishlist.classNo}" class="stretched-link" data-course-no="${wishlist.classNo}"></a>
						<img src="/resources/images/course/${wishlist.image}" class="card-img-top" alt="...">
						<div class="card-body">
							<!-- <h5 class="card-title">Card title</h5> -->
							<p class="card-text">${wishlist.title}</p>
						</div>
						<ul class="list-group list-group-flush">
							<li class="list-group-item">${wishlist.teacherName}</li>
							<li class="list-group-item">★★★★★()</li>
							<li class="list-group-item">&#8361;${wishlist.price} &#8361;${wishlist.discountPrice}</li>
						</ul>
						<div class="modal-card p-2 h-100">
							<a href="/course/${wishlist.classNo}" class="stretched-link text-light text-decoration-none" data-course-no="${wishlist.classNo}">
								<p class="course_title">${wishlist.title }</p>
								<div class="back_course_metas">
									<div class="course_level">
										<span>
											<svg width="16" aria-hidden="true" data-prefix="fal" data-icon="signal-alt"	class="svg-inline--fa fa-signal-alt fa-w-20" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 640 512">
											<path fill="currentColor" d="M576 32v448h-32V32h32M416 160v320h-32V160h32M256 288v192h-32V288h32M96 416v64H64v-64h32M576 0h-32c-17.67 0-32 14.33-32 32v448c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V32c0-17.67-14.33-32-32-32zM416 128h-32c-17.67 0-32 14.33-32 32v320c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V160c0-17.67-14.33-32-32-32zM256 256h-32c-17.67 0-32 14.33-32 32v192c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32V288c0-17.67-14.33-32-32-32zM96 384H64c-17.67 0-32 14.33-32 32v64c0 17.67 14.33 32 32 32h32c17.67 0 32-14.33 32-32v-64c0-17.67-14.33-32-32-32z"></path>
											</svg>
											${wishlist.difficulty}
										</span>
									</div>
									<div>
										<span>
											<svg width="16" aria-hidden="true" focusable="false" data-prefix="fal" data-icon="folder-tree" class="svg-inline--fa fa-folder-tree fa-w-18" role="img"xmlns="http://www.w3.org/2000/svg" viewBox="0 0 576 512">
											<path fill="currentColor" d="M288 224h224a32 32 0 0 0 32-32V64a32 32 0 0 0-32-32H400L368 0h-80a32 32 0 0 0-32 32v64H64V8a8 8 0 0 0-8-8H40a8 8 0 0 0-8 8v392a16 16 0 0 0 16 16h208v64a32 32 0 0 0 32 32h224a32 32 0 0 0 32-32V352a32 32 0 0 0-32-32H400l-32-32h-80a32 32 0 0 0-32 32v64H64V128h192v64a32 32 0 0 0 32 32zm0 96h66.74l32 32H512v128H288zm0-288h66.74l32 32H512v128H288z"></path></svg>
										  ${wishlist.category }		
										</span>
									</div>
								</div>
							</a>
							<div class="modal-active-btn p-1 m-1">
								<div class="add_cart e_cart_action mb-1 me-1">
						<%--  
									<i class="fas fa-cart-plus fa-lg" id="cart-${wishlist.classNo}" data-no="${wishlist.classNo}"></i>
						 --%>		
								</div>
								<div class="add_cart e_cart_action mb-1">
									<i class="fas fa-heart fa-lg text-danger" id="wishlist-${wishlist.classNo}" data-no="${wishlist.classNo}"></i>
								</div>
							</div>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</div>
<%@ include file="../../common/footer.jsp" %>
</div>
<script type="text/javascript">
	// 장바구니담기 ajax
	$(".fa-cart-plus").click(function(){
		alert("기능구현")
		var classNo = $(this).data("no")
		var addDelete = 0;
		
		if($(this).hasClass('text-warning')){
			$(this).removeClass('text-warning')
			$("#wishlist-"+ classNo).trigger("click")
			$("#wishlist-"+ classNo).removeClass()
			addDelete = 0;
		}else{
			$(this).addClass('text-warning')
			addDelete = 1;
		}

		$.ajax({
			type:"Post"
			,url:"/rest/addDeleteCart"
			,dataType:"json"
			,data:{
				classNo: classNo,
				addDelete: addDelete
			}
			,success:function(response){
				if(response.status == "OK"){
					alert("적용되었습니다.")
				}else{
					alert(response.error);
				}
			}
		})
	})
	
	
	// 위시리스트담기 ajax
	$(".fa-heart").click(function(){
		var classNo = $(this).data("no")
		var addDelete = 0;
		
		if($(this).hasClass('text-danger')){
			$(this).removeClass('text-danger')
			addDelete = 1;
		}else{
			$(this).addClass('text-danger')
			addDelete = 0;
		}

		$.ajax({
			type:"Post"
			,url:"/rest/addDeleteWishlist"
			,dataType:"json"
			,data:{
				classNo: classNo,
				addDelete: addDelete
			}
			,success:function(response){
				if(response.status == "OK"){
					alert("삭제되었습니다.")
				}else{
					alert(response.error);
				}
			}
		})	
	})
</script>
</body>
</html>