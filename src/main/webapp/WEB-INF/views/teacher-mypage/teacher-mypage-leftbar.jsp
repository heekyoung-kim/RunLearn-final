<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
	.menu-container{
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
	}
	
	.menu-list{
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    color: #000a12;
    box-sizing: inherit;
    margin: 0;
    padding: 0;
    list-style: none;
    line-height: 1.25;	
	}
	
	.menu-label{
	-webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-weight: 400;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    box-sizing: inherit;
    padding: 0;
    margin: 0;
    line-height: 1.6;
    color: #cfcfcf;
    font-size: .75em;
    letter-spacing: .1em;
    text-transform: uppercase;
    margin-top: 1em;
    margin-bottom: 1em;
    }
    
    .btn_wrap{
    -webkit-font-smoothing: antialiased;
    -webkit-tap-highlight-color: transparent;
    --swiper-theme-color: #007aff;
    font-family: Noto Sans KR,-apple-system,"system-ui",BlinkMacSystemFont,Apple SD Gothic Neo,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif,Oxygen,Ubuntu,Cantarell,Fira Sans,Droid Sans,Helvetica;
    font-size: 1rem;
    font-weight: 400;
    text-rendering: optimizeSpeed;
    text-size-adjust: 100%;
    list-style: none;
    line-height: 1.25;
    box-sizing: inherit;
    text-decoration: none;
    cursor: pointer;
    border-radius: 2px;
    color: #454545;
    display: block;
    padding: .5em .75em;    
    }
    
    .body{
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
    padding: 20px;
    background-color: #f7f7f7;
    }
    
    .sidebar_left{
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
    display: block;
    flex: none;
    width: 16.6666666667%;
    padding: .5rem;
    }
</style>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
			<aside class="column is-2 sidebar_left">
				    <div class="menu_container">
			          <p class="menu-label">HOME</p>
				          <ul class="menu-list">
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor" >
			                    <span>대시보드</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/profile" >
			                    <span>프로필</span> 
			                  </a>
			                </li>
				          </ul>
			          <p class="menu-label">강의관리</p>
				          <ul class="menu-list">
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/courses" >
			                    <span>강의관리</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/questions" >
			                    <span>질문리스트</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/reviews" >
			                    <span>수강평리스트</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/news" >
			                    <span>강의소식관리</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/instructor/incomes" >
			                    <span>수익확인</span> 
			                  </a>
			                </li>
				          </ul>
			          <p class="menu-label">강의만들기</p>
				          <ul class="menu-list">
			                <li>
			                  <a class="btn_wrap is_active " href="" >
			                    <span>강의만들기</span> 
			                  </a>
			                </li>
				          </ul>
				    </div>
		 </aside>
</body>
</html>