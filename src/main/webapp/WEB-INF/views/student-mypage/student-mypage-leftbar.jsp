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
    /*width: 16.6666666667%;*/
    padding: .5rem;
    }
    
    .section-bg .bg-1{background:#333b3d;}
	.section-bg .bg-2{background:#f7f7f7; height:100vh;}
	.navbar-dashboard p{color:#fff;}
	
	.right-instructor .card{height:182px; border-radius:8px; flex-direction:column;}
	.right-instructor .card-header{background:transparent;}
	.right-instructor .card-header .card-title h6{display:inline-block;}
	.right-instructor .card-header .card-title a{font-size:.9rem; text-decoration:none;}
	.right-instructor .card-body{display:flex; width:100%; height:100%;}
	.right-instructor .card-body .card-text{position:relative; width:100%; height:100%;}
	.right-instructor .card-body .card-text div{display:flex; justify-content:center; align-items:center; flex-direction:column; width:100%; height:100%;}
	.right-instructor .card-body p{font-weight:700; font-size:1.5rem; color:#adb5bd;}
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
			                  <a class="btn_wrap is_active " href="/dashboard" >
			                    <span>대시보드</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/profile" >
			                    <span>프로필</span> 
			                  </a>
			                </li>
				          </ul>
			          <p class="menu-label">학습관리</p>
				          <ul class="menu-list">
			                <li>
			                  <a class="btn_wrap is_active " href="../my-course?no=${LOGIN_USER.no }" >
			                    <span>내학습</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="" >
			                    <span>강의노트</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="" >
			                    <span>작성한 게시글</span> 
			                  </a>
			                </li>
				          </ul>
			          <p class="menu-label">수강신청관리</p>
				          <ul class="menu-list">
			                <li>
			                  <a class="btn_wrap is_active " href="/carts" >
			                    <span>수강바구니</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/wishlist" >
			                    <span>위시리스트</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/couponBox" >
			                    <span>쿠폰함</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/point" >
			                    <span>포인트</span> 
			                  </a>
			                </li>
			                <li>
			                  <a class="btn_wrap is_active " href="/orders" >
			                    <span>구매내역</span> 
			                  </a>
			                </li>
				          </ul>
				    </div>
		 </aside>
</body>
</html>