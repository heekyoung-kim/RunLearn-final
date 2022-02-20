# final-project(강의 사이트 제작)
![image](https://user-images.githubusercontent.com/95058221/154825066-1a8b16ba-78fd-4e02-8e94-24e8c97af04f.png)

![메인화면](https://user-images.githubusercontent.com/95058221/154825095-545720b0-e0ea-4b4b-ba03-b3b767003586.png)


## MVC Model2 기반으로 작업 진행
### 작업 환경
- 운영체제: windows 10
- IDE: eclipse 2021-06 (4.20.0)
- 데이터베이스: oracle database 21.2.1.204
- 웹애플리케이션 서버: Tomcat 9.0.56, Tomcat 10.0.14
- SQL 개발툴: Oracle SQL Developer
- 빌드도구 : Maven
- 형상관리도구 : Git
- 백엔드 개발: Java, SQL, JDBC, JSP, Spring Framework, Spring Boot, Mybatis
- 프론트엔드 개발: HTML, CSS, Javascript, jQuery, bootstrap5

### ERD 설계 (23)
![image](https://user-images.githubusercontent.com/95058221/154825025-e97b81ab-756f-4d6b-ba47-6019c7bb80c6.png)

### 작업 내역
- BootStrap, html5, css 로 맡은 화면 뷰 구현.
- 로그인(일반로그인, 카카오API 로그인), 회원가입, 회원탈퇴.
- 결제기능구현(카카오 API 결제- RestTemplate으로 연동.)
- 회원프로필 조회및 수정 
- 만료된 쿠폰 스케줄처리.

### 작업 후기
새로운 제작방식을 사용하여 작업을 진행하면서 해당 작업방식에 적응하는 것에 미흡한 부분이 많았다.<br>
하지만 스프링 부트와 mybatis를 활용한 MODEL2 구조를 이용한 새로운 방식의 작업을 익히는데 많은 도움이 되었다.<br>
el, jstl 등의 문법을 사용했으며 ajax와 json 같은 비동기 통신 방식으로 데이터를 주고받는 방법도 활용할 수 있었다.
