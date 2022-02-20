# final-project(강의 사이트 제작)
![image](https://user-images.githubusercontent.com/95058221/154825066-1a8b16ba-78fd-4e02-8e94-24e8c97af04f.png)

![메인화면](https://user-images.githubusercontent.com/95058221/154825095-545720b0-e0ea-4b4b-ba03-b3b767003586.png)

* 5명 팀프로젝트
  *   [업무분담 및 디렉토리구조도](https://github.com/heekyoung-kim/RunLearn-final/files/8104530/_._4.pdf)


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
- 

### 구현 목적
0. Spring MVC패턴, model2방식의 웹사이트 구현
1. 외부 API 연동을 통해 다양한 개발경험쌓기 (결제API, 로그인API)
2. 로그인 유효성검사
3. AJAX 비동기 로그인 이외에 ajax로 데이터(json형식) 주고받기 (화면전환을 줄여 사용성 높이기)
4. 쿠폰,포인트사용등 디테일한 결제 기능 구현.
5. jquery, jstl, el표현식을 사용해 jsp에서 동적 기능 구현
6. mybatis를 이용한 crud 작업.

### 작업일지
- (22/01/19) 로그인기능  - `commit` : [ec59a79](https://github.com/carbancle/final-project/pull/2/commits/ec59a795160e1430ec46ccb81fb7aa1e6a07fb7d)
- (22/01/20) 카카오로그인 수정- `commit` : [d9ef6a9](https://github.com/carbancle/final-project/pull/11/commits/d9ef6a9953ed231af85b030065ef682cb2588a0e)
- (22/01/25) 회원가입  -`commit` : [63a7ff5](https://github.com/carbancle/final-project/pull/12/commits/63a7ff56426cc13a3e41cc50ff07e0542a8262b7)
- (22/01/26) 카트기능 기초작업(mapper, service, jsp), 회원가입 유효성체크  - `commit` : [9c7cbdd](https://github.com/carbancle/final-project/pull/18/commits/9c7cbdd6d481b9ceb7a6235f3c6ecbc276fa8fb5)
- (22/01/27) 로그인 수정(권한에 따른 네브바기능추가),카트 mapper, 카트 jsp, 쿠폰 vo.  -`commit` : [c7ebb3d](https://github.com/carbancle/final-project/pull/20/commits/c7ebb3d3006db4d794246d38f635f639fd05a023)
- (22/01/28) 장바구니 강의 조희, 결제/쿠폰/위시리스트 vo,mapper,Service 셋팅   -`commit` : [4750ddc](https://github.com/carbancle/final-project/pull/24/commits/4750ddc3cc11662ef3abc78fe45449cab68063ec)
- (22/02/03) 장바구니 총가격, 쿠폰조회   -`commit` : [f38579e](https://github.com/carbancle/final-project/pull/27/commits/f38579ec642aa8114e810c424ee8d9e7a191a75b)
- (22/02/04) 위시리스트이동, 장바구니삭제, 쿠폰사용시 결제가격변동.   -`commit` : [84e7eca](https://github.com/carbancle/final-project/pull/30/commits/84e7eca283a27fe9f791d475946357195ee3b2be)
- (22/02/07) 장바구니쿠폰/포인트 적용, 위시리스트이동, 장바구니 전체삭제  -`commit` : [84ff321](https://github.com/carbancle/final-project/pull/32/commits/84ff3213e2e8481519d99f20dc31efc9fd9c831b)
- (22/02/08) dto에 쿠폰마감기한추가, 쿠폰추가기능구현, 쿠폰d-day기능구현  -`commit` : [64299a6](https://github.com/carbancle/final-project/pull/38/commits/64299a6ea9017688fb53095c0f4301e1fb6f4f82)
- (22/02/09) 위시리스트담기(비동기), 장바구니담기(비동기), 쿠폰조회수정, 위시리스트조회, 포인트조회  -`commit` : [
880a910](https://github.com/carbancle/final-project/pull/40/commits/880a9108d438cc198ad043a3309cd76b949e4f0b)
- (22/02/11) 주문하기로직(ORDER, ORDERITEM, PAYMENT 정보저장,수강중 강좌 추가, 카트 전체삭제), DETAIL에서 비동기로 카트/위시리스트 담기, 학습중과 수강신청하기 분리, 비밀번호 암호화, 프로필 / 결제내역 조회 JSP,위시리스트 조회.  -`commit` : [5c96b55](https://github.com/carbancle/final-project/pull/48/commits/5c96b557e20589e1b1519f991d2f4f3dbda7ef4a)
- (22/02/12) 카카오페이결제, 결재내역조회, 쿠폰함 수정(사용완료, 기한만료조회),프로필수정, 비밀번호발급/변경, 탈퇴하기(+로그인시 탈퇴회원예외처리), 강사신청jsp  -`commit` : [e7ed134](https://github.com/carbancle/final-project/pull/55/commits/e7ed1340cca341afd0c6b8234bad1387aa3493bf)
- (22/02/15) 카트 포인트사용 오류수정, 강사등록 구현, 위시리스트삭제 구현, 학생마이페이지 대시보드 구현.   -`commit` : [
b768cb1](https://github.com/carbancle/final-project/pull/65/commits/b768cb167edc9a7d62469185c9acecf821a1e8c3)
- (22/02/20) 404,500 예외처리, 쿠폰스케줄 처리   -`commit` : [6fceaed](https://github.com/carbancle/final-project/pull/72/commits/6fceaed85293501d605e36e8838571f5afdc21b9)



