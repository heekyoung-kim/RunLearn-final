# final-project(강의 사이트 제작)
![image](https://user-images.githubusercontent.com/95058221/154825066-1a8b16ba-78fd-4e02-8e94-24e8c97af04f.png)

![메인화면](https://user-images.githubusercontent.com/95058221/154825095-545720b0-e0ea-4b4b-ba03-b3b767003586.png)


## MVC Model2 기반으로 작업 진행
<img src="https://user-images.githubusercontent.com/95058221/154833957-813644c7-9147-44c0-95b0-23e017acf165.jpg" width="600"/>

### 작업 환경
- 운영체제: windows 10
- IDE: eclipse 2021-06 (4.20.0)
- 데이터베이스: oracle database 21.2.1.204 , oracle cloud(공용db)
- 웹애플리케이션 서버: Tomcat 9.0.56, Tomcat 10.0.14
- SQL 개발툴: Oracle SQL Developer 
- 빌드도구 : Maven
- 형상관리도구 : Git
- 백엔드 개발: Java, SQL, JDBC, JSP, Spring Framework, Spring Boot, Mybatis
- 프론트엔드 개발: HTML, CSS, Javascript, jQuery, bootstrap5

### ERD 설계 (23) - oracle
<img src="https://user-images.githubusercontent.com/95058221/154825025-e97b81ab-756f-4d6b-ba47-6019c7bb80c6.png" width="2000" />


### 작업 내역
- BootStrap, html5, css 로 맡은 화면 뷰 구현.
- 로그인(일반로그인, 카카오API 로그인), 회원가입, 회원탈퇴.
- 결제기능구현(카카오 API 결제- RestTemplate으로 연동.)
- 회원프로필 조회및 수정 
- 만료된 쿠폰 스케줄처리.


### 구현 목적
0. Spring MVC패턴, model2방식의 웹사이트 구현
1. 외부 API 연동을 통해 다양한 개발경험쌓기 (결제API, 로그인API)
2. 로그인 유효성검사
3. AJAX 비동기 로그인 이외에 ajax로 데이터(json형식) 주고받기 (화면전환을 줄여 사용성 높이기)
4. 쿠폰,포인트사용등 디테일한 결제 기능 구현.
5. jquery, jstl, el표현식을 사용해 jsp에서 동적 기능 구현
6. mybatis를 이용한 crud 작업.
