<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
<%@ include file="../../common/nav.jsp" %>
<div class="container">
  	<div class="row mt-3">
		<div class="col-3">
			<%@include file="../student-mypage-leftbar.jsp" %>
		</div>
		<div class="col-9 my-4">
			<div><strong>내 쿠폰함</strong></div>
		  	<div class="row border border-1 mt-2">
			  	<div class="col-6 p-3">
			  		<span>사용가능한 쿠폰</span>
			  		<h4>${totalNotUseCoupons} 개</h4>
			  	</div>
			  	<div class="col-6 p-3">
			  		<span>사용완료 쿠폰</span>
			  		<h4>${totalUseCoupons} 개</h4>
			  	</div>
		  	</div>
			<div class="row mt-3">
				<div class="col px-0">
					<nav>
						<div class="nav nav-tabs" id="nav-tab" role="tablist">
							<button class="nav-link text-secondary active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button" role="tab" aria-controls="nav-home" aria-selected="true">사용가능(${totalNotUseCoupons})</button>
							<button class="nav-link text-secondary" id="nav-profile-tab" data-bs-toggle="tab" data-bs-target="#nav-profile" type="button" role="tab" aria-controls="nav-profile" aria-selected="false">사용완료/기간만료(${totalUseCoupons})</button>
							<button class="nav-link text-secondary" id="nav-contact-tab" data-bs-toggle="tab" data-bs-target="#nav-contact" type="button" role="tab" aria-controls="nav-contact" aria-selected="false">전체쿠폰(${coupons.size()})</button>
						</div>
					</nav>
					<div class="tab-content border border-top-0 bg-light" id="nav-tabContent">
						<div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
							<div class="row p-3">
								<c:forEach var="coupon" items="${coupons}">
									<c:choose>
										<c:when test="${coupon.discountRate eq 0 }">
											<c:if test="${coupon.useStatus eq 'N' && coupon.periodStatus eq 'N'}">
												<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
													<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
													<h6><strong>${coupon.couponName}</strong></h6>
													<div class="d-flex justify-content-between mt-3 rounded">
														<p class="text-secondary"><small>D-${coupon.getRemainDate()}</small></p>
														<h5 class="text-success"><strong> ${coupon.discountPrice}원</strong></h5>
													</div>
												</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${coupon.useStatus eq 'N' && coupon.periodStatus eq 'N'}">
												<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
													<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
													<h6><strong>${coupon.couponName}</strong></h6>
													<div class="d-flex justify-content-between mt-3 rounded">
														<p class="text-secondary"><small>D-${coupon.getRemainDate()}</small></p>
														<h5 class="text-success"><strong> ${coupon.discountRate}%</strong></h5>
													</div>
												</div>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
							<div class="row p-3">
								<c:forEach var="coupon" items="${coupons}">
									<c:choose>
										<c:when test="${coupon.discountRate eq 0 }">
											<c:if test="${coupon.useStatus eq 'Y' || coupon.periodStatus eq 'Y'}">
												<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
													<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
													<h6><strong>${coupon.couponName}</strong></h6>
													<c:if test="${coupon.useStatus eq 'Y'}">
														<div class="d-flex justify-content-between mt-3 rounded">
															<p class="text-secondary"><small>사용만료</small></p>
															<h5 class="text-success"><strong> ${coupon.discountPrice}원</strong></h5>
														</div>
													</c:if>
													<c:if test="${coupon.periodStatus eq 'Y'}">
														<div class="d-flex justify-content-between mt-3 rounded">
															<p class="text-secondary"><small>기간만료</small></p>
															<h5 class="text-success"><strong> ${coupon.discountPrice}원</strong></h5>
														</div>
													</c:if>
												</div>
											</c:if>
										</c:when>
										<c:otherwise>
											<c:if test="${coupon.useStatus eq 'Y' || coupon.periodStatus eq 'Y'}">
												<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
													<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
													<h6><strong>${coupon.couponName}</strong></h6>
													<c:if test="${coupon.useStatus eq 'Y'}">													
														<div class="d-flex justify-content-between mt-3 rounded">
															<p class="text-secondary"><small>사용만료</small></p>
															<h5 class="text-success"><strong> ${coupon.discountRate}%</strong></h5>
														</div>
													</c:if>
													<c:if test="${coupon.periodStatus eq 'Y'}">													
														<div class="d-flex justify-content-between mt-3 rounded">
															<p class="text-secondary"><small>기간만료</small></p>
															<h5 class="text-success"><strong> ${coupon.discountRate}%</strong></h5>
														</div>
													</c:if>
												</div>
											</c:if>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>
						</div>
						<div class="tab-pane fade" id="nav-contact" role="tabpanel" aria-labelledby="nav-contact-tab">
							<div class="row p-3">
								<c:forEach var="coupon" items="${coupons}">
									<c:choose>
										<c:when test="${coupon.discountRate eq 0 }">
											<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
												<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
												<h6 class="${coupon.useStatus eq 'Y' || coupon.periodStatus eq 'Y'  ? 'text-secondary' : ''}"><strong>${coupon.couponName}</strong></h6>
												<div class="d-flex justify-content-between mt-3 rounded">
													<p class="text-secondary"><small>D-${coupon.getRemainDate()}</small></p>
													<h5 class="text-success"><strong> ${coupon.discountPrice}원</strong></h5>
												</div>
											</div>
										</c:when>
										<c:otherwise>
											<div class="col-4 shadow-sm p-3 mb-5 bg-body rounded m-2">
												<p class="text-secondary"><small><fmt:formatDate value="${coupon.periodDate}" type="both" pattern="yyyy-MM-dd [E] a hh:mm:ss"/>까지</small></p>
												<h6 class="${coupon.useStatus eq 'Y' || coupon.periodStatus eq 'Y'  ? 'text-secondary' : ''}"><strong>${coupon.couponName}</strong></h6>
												<div class="d-flex justify-content-between mt-3 rounded">
													<c:if test="${coupon.useStatus eq 'Y'}">													
															<p class="text-secondary"><small>사용완료</small></p>
													</c:if>
													<c:if test="${coupon.periodStatus eq 'Y'}">													
															<p class="text-secondary"><small>기간만료</small></p>
													</c:if>
													<c:if test="${coupon.useStatus eq 'N' && coupon.periodStatus eq 'N'}">
														<p class="text-secondary"><small>D-${coupon.getRemainDate()}</small></p>
													</c:if>												
													<h5 class="text-success"><strong> ${coupon.discountRate}%</strong></h5>
												</div>
											</div>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</div>							
						</div>						
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>