<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">

<style>
 #mainImg {
 	background-image : url('/img/main.jpg');
 	background-size : 1000px 420px;
 	background-position : center center;
 	background-repeat: no-repeat;
 	
 }
 </style>


</head>
<body>
<div id="topNav">
		<div id="logo">
			<span>로고 위치</span>
		</div>
		<input id="selBtn" type="button" value="이용권 조회" onclick="" />
		<div id="barRight">
			<ul>
				<li>
					<a href="/LoginForm">
						<img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
						<div>로그인</div>
					</a>
				</li>
				<li>
					<a href="/AssignForm">
						<img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
						<div>회원가입</div>
					</a>
				</li>
			</ul>
		</div>
	</div>
	<!-- 왼쪽 네비게이션 -->
	<div id="leftNav">
		<div id="toHome"><a href="/"><img width="40px" height="40px" alt="HOME" src="/img/home.png"></a></div>
		<ul>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li> 
			<li><a class="category" href=""><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
			<!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
		</ul>
	</div>
	
	<!-- 메인 -->
	<div id="wrapper" >
		<div id="wrapMain">
			<div id="mainImg">
		
  </div>
</div>
				
			</div>
		
</body>
</html>