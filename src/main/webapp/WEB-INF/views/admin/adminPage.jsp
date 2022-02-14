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
		
			<h3 class="dashboard-title ms-4">전체</h3>
			<section class="dashboard-summary">
			 	<div class="card-wrapper">
		              <div class="card">
			               <div class="card-header">
			               		<h3 class="card-title">총 수강생 수</h3>
			               		<a href="/admin/adminUser" class="move-button">
			               			<p class="move-button-text">더보기</p>
			               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
			               		</a>
			               	</div>
			                
			                <div class="card-body d-flex flex-column justify-content-end">
			                  <div class="card-summary-body">
			                    <div class="card-body-content">
			                      <p class="font-sans-serif lh-1 mb-1 fs-4">${adminPage.totalUserCount }명</p>
			                    </div>
			                  </div>
			                </div>
			           </div>
			           
			      </div>
			      <div class="card-wrapper">
		              <div class="card">
			               <div class="card-header">
			               		<h3 class="card-title">총 강의 수</h3>
			               		<a href="/admin/adminClass" class="move-button">
			               			<p class="move-button-text">더보기</p>
			               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
			               		</a>
			               	</div>
			                
			                <div class="card-body d-flex flex-column justify-content-end">
			                  <div class="card-summary-body">
			                    <div class="card-body-content">
			                      <p class="font-sans-serif lh-1 mb-1 fs-4">${adminPage.totalClassCount }개</p>
			                    </div>
			                  </div>
			                </div>
			           </div>
			      </div>
			      <div class="card-wrapper">
		              <div class="card">
			               <div class="card-header">
			               		<h3 class="card-title">평점</h3>
			               	</div>
			                
			                <div class="card-body d-flex flex-column justify-content-end">
			                  <div class="card-summary-body">
			                    <div class="card-body-content">
			                      <p class="font-sans-serif lh-1 mb-1 fs-4">﻿<fmt:formatNumber value="  ${adminPage.totalClassGradeAvr }" pattern=".00"/>점</p>
			                    </div>
			                  </div>
			                </div>
			           </div>
			      </div>
			      <div class="card-wrapper">
		              <div class="card">
			               <div class="card-header">
			               		<h3 class="card-title">총 결제 건수</h3>
			               	</div>
			                
			                <div class="card-body d-flex flex-column justify-content-end">
			                  <div class="card-summary-body">
			                    <div class="card-body-content">
			                      <p class="font-sans-serif lh-1 mb-1 fs-4">${adminPage.totalOrderCount }건</p>
			                    </div>
			                  </div>
			                </div>
			           </div>
			      </div>
			      <div class="card-wrapper" style="width: 66.6%">
		              <div class="card">
			               <div class="card-header">
			               		<h3 class="card-title">강의 총 수익</h3>
			               	</div>
			                
			                <div class="card-body d-flex flex-column justify-content-end">
			                  <div class="card-summary-body">
			                    <div class="card-body-content">
			                      <p class="font-sans-serif lh-1 mb-1 fs-4"><fmt:formatNumber value="${adminPage.totalIncome}" type="number"/>원</p>
			                    </div>
			                  </div>
			                </div>
			           </div>
			      </div>
		      </section>
		      
		      <h3 class="dashboard-title ms-4 mt-4">처리</h3>
			      <section class="dashboard-summary">
			      		<div class="card-wrapper" style="width: 50%">
				              <div class="card">
					               <div class="card-header">
					               		<h3 class="card-title">강의 개설 요청</h3>
					               		<a href="/admin/adminClass?opt=강의상태&value=제출" class="move-button">
					               			<p class="move-button-text">더보기</p>
					               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
					               		</a>
					               	</div>
					                
					                <div class="card-body d-flex flex-column justify-content-end">
					                  <div class="card-summary-body">
					                   <div class="row" style="width: 100%;">
							                    <div class="process-card-body-content col-6">
							                    		<h5>미처리</h5>
								                      	<p class="font-sans-serif lh-1 mb-1 fs-4" style="color: red;">${adminPage.submitClassCount }건</p>
							                    </div>
							                    <div class="process-card-body-content col-6">
								                    	<h5>중지</h5>
								                      	<p class="font-sans-serif lh-1 mb-1 fs-4">${adminPage.stopClassCount }건</p>
							                    </div>
							                 </div>
					                  </div>
					                </div>
					           </div>
			      		</div>
					    <div class="card-wrapper" style="width: 50%">
				              <div class="card">
					               <div class="card-header">
					               		<h3 class="card-title">미해결 질문 리스트</h3>
					               		<a href="" class="move-button" id="btn-noAnswer-list" data-bs-toggle="modal" data-bs-target="#noAnswerListModal">
					               			<p class="move-button-text">더보기</p>
					               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
					               		</a>
					               	</div>
					                
					                <div class="card-body d-flex flex-column justify-content-end">
					                  <div class="card-summary-body">
					                    <div class="card-body-content">
					                      <p class="font-sans-serif lh-1 mb-1 fs-4">${adminPage.noAnswerCount }개</p>
					                    </div>
					                  </div>
					                </div>
					           </div>
					     </div>
					    
			      </section>
<!-- 강의 수익 시작 -->
			      <h3 class="dashboard-title ms-4 mt-4">강의 수익</h3>
			      <section class="dashboard-summary">
			      		<div class="graph-wrapper" style="width: 50%">
				              <div class="card">
					               <div class="card-header">
					               		<h3 class="card-title">이번달 현황</h3>
					               		<a href="" class="move-button">
					               			<p class="move-button-text">더보기</p>
					               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
					               		</a>
					               	</div>
					                
					                <div class="card-body d-flex flex-column justify-content-end">
					                  <div class="graph-body-content">
			                     		<p class="font-sans-serif lh-1 mb-1"><fmt:formatNumber value="${adminPage.getIncomeForThisMonth}" type="number"/>원</p>
			                    	  </div>
					                  <div class="card-summary-body">
					                    <div style="width: 70%; height: 100%;">
			   								<canvas id="profitChartOfThisMonth"></canvas>
			      						</div>
					                  </div>
					                </div>
					           </div>
					     </div>
			      		<div class="graph-wrapper" style="width: 50%">
				              <div class="card">
					               <div class="card-header">
					               		<h3 class="card-title">강의 수익 분포</h3>
					               		<a href="" class="move-button">
					               			<p class="move-button-text">더보기</p>
					               			<svg class="move-button-icon" fill="none" width="14" height="26" viewBox="0 0 14 26" xmlns="http://www.w3.org/2000/svg"><path clip-rule="evenodd" d="M.397 25.592c.529.544 1.387.544 1.916 0l11.29-11.607c.53-.544.53-1.426 0-1.97L2.313.408C1.783-.136.926-.136.397.408c-.53.544-.53 1.426 0 1.97L10.729 13 .397 23.622c-.53.544-.53 1.426 0 1.97z" fill="#495057" fill-rule="evenodd"></path></svg>
					               		</a>
					               	</div>
					                
					                <div class="card-body d-flex flex-column justify-content-end">
					                  <div class="card-summary-body">
					                    <div style="width: 100%; height: 100%;">
			   								<canvas id="myChart2" style="display: block; box-sizing: border-box; height: 100%; width: 100%;" width="100%" height="65px"></canvas>
			      						</div>
					                  </div>
					                </div>
					           </div>
					     </div>
					</section>
					
					
					<!--  
					<c:forEach var="monthIncome" items="${monthIncome}">
							<p>${monthIncome.payMonth}</p>
							<p>${monthIncome.totalPrice}</p>
					</c:forEach>-->
					
		</div>
		<div class="modal fade" id="noAnswerListModal" tabindex="-1" role="dialog" aria-labelledby="writeBoardLabel" aria-hidden="true">
				<div class="modal-dialog modal-lg" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="writeBoardLabel">미답변 리스트</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
						</div>
						<table class="table" id="table-books">
				<thead>
					<tr>
						<th style="width: 5%;">번호</th>
						<th style="width: 7%;">분류</th>
						<th style="width: 20%;">제목</th>
						<th style="width: 10%;">상태</th>
						<th style="width: 5%">글쓴이</th>
					</tr>
				</thead>
				<tbody>
					<c:choose>
						<c:when test="${empty noAnswer }">
							<tr>
								<td class="text-center" colspan="6">미해결 글이 없습니다.</td>
							</tr>
							</c:when>
								<c:otherwise>
									<c:forEach var="noAnswer" items="${noAnswer }" varStatus="loop">
										 <tr>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${noAnswer.no}}">
									    			${noAnswer.no }
									  			</label>
							  				</td>
							  				<td>
									  			<label class="form-check-label" for="coupon-check-${noAnswer.no}">
									    			${noAnswer.category}
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${noAnswer.no}">
									    			${noAnswer.title}
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${noAnswer.no}">
									    			${noAnswer.status}
									  			</label>
									  		</td>
									  		<td>
									  			<label class="form-check-label" for="coupon-check-${noAnswer.no}">
									    			${noAnswer.name}
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
		</div>
	</div>
<script type="text/javascript">


	function getFormatDate(date,num){
		
		var year = date.getFullYear();
		var month = (1+ date.getMonth());
		
		
		year = month-num<1? year-1:year;
		month= month-num<1?14-num:month-num; 
		
		month= month>=10?month:'0'+month;
		return year+'/'+month;
	}
	
	var date= new Date();
	
	let monthIncomes = [];
	let hi = ["hi","hello"];
	$(function(){
		
		$.getJSON('/rest/admin', function(MonthIocomeDto){
			$.each(MonthIocomeDto,function(index,item){
				monthIncomes.push(item);
			})
		})
		
	});
	
	console.log(monthIncomes);
	console.log(monthIncomes[0]);
	
	const pieLabels = [
	    '개발 · 프로그래밍',
	    '보안 · 네트워크',
	    '데이터 사이언스'
	  ];
	
	const barLabels = [
		getFormatDate(date,6),
		getFormatDate(date,5),
		getFormatDate(date,4),
		getFormatDate(date,3),
		getFormatDate(date,2),
		getFormatDate(date,1)
	    
	  ];

	  const monthProfitData = {
	    datasets: [{
	      label: 'My First dataset',
	      backgroundColor: [
	    	  	'rgb(255, 99, 132)',
	    	  	'rgb(54, 162, 235)',
	    	  	'rgb(255, 205, 86)'
	    	  	],
	      data: [${adminPage.developerIncomeForThisMonth},${adminPage.securityIncomeForThisMonth} , ${adminPage.dataScienceIncomeForThisMonth}],
	    }],
	    labels: pieLabels
	  };
	  
	  const recentProfitData = {
			    datasets: [{
			      label: 'My First dataset',
			      backgroundColor: [
			    	  	'rgb(255, 99, 132)',
			    	  	'rgb(54, 162, 235)',
			    	  	'rgb(255, 205, 86)'
			    	  	],
			      data: [${adminPage.developerIncomeForThisMonth},${adminPage.securityIncomeForThisMonth} , ${adminPage.dataScienceIncomeForThisMonth}],
			    }],
			    labels: barLabels
			  };

	  const config = {
	    type: 'doughnut',
	    data: monthProfitData,
	    options: {
	        plugins: {
	            legend: {
					position : 'right',
	            }
	        }
	    }
	  };
  
	  const config2 = {
	    type: 'bar',
	    data: recentProfitData,
	    options: {}
	  };

	  const myChart = new Chart(
		document.getElementById('profitChartOfThisMonth'),
		config
		);
	  
	  const myChart2 = new Chart(
		document.getElementById('myChart2'),
		config2
		);

</script>
</body>
</html>