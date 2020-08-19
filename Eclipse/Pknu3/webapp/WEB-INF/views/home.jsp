<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03 프로젝트 메인</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">

</head>
<body>
	   <!-- 상단 네비게이션  -->
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
               <a href="/SignUpForm">
                  <img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
                  <div>회원가입</div>
               </a>
            </li>
         </ul>
      </div>
   </div>
   <!-- 왼쪽 네비게이션 -->
   <div id="leftNav">
      <ul>
      	 <li><a class="categorys" href="/"><img width="40px" height="40px" alt="HOME" src="/img/home.png"></a></li>
         <li><a class="categorys" href="/Schedule/ScheduleList"><img width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li> 
         <li><a class="categorys" href="/Subject/List"><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
         <li><a class="categorys" href="/Statistics/StatisticsList"><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>
	
	<!-- 메인 -->
	<div id="wrapper">
		<div id="wrapMain">
			<div id="mainImg">
				<img width="1000px" height="420px" "alt="메인 이미지" src="/img/main.jpg">
			</div>
			<!-- 간단 정보 -->
			<div id="mainInfo">
				<div id="infoWrap">
					<div id="infoIcon1">
						<img alt="수업 운영 시간 아이콘" src="/img/homeCalendar.png">
						<p>CLASS TIME</p>
						<p>9:00am ~ 06:00pm</p>
					</div>
					<div id="infoIcon2">
						<img alt="센터 운영 시간 아이콘" src="/img/clock.png">
						<p>HOURS</p>
						<p>Open&Close - 9:00am ~ 01:00am</p>
						<p>Break Time - 12:00am ~ 01:00pm</p>
					</div>
					<div id="infoIcon3">
						<img alt="센터 위치 아이콘" src="/img/location.png">
						<p>LOCATION</p>
						<p>부산광역시 어딘가</p>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>