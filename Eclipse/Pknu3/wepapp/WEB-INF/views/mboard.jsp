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


<style>


 
 #wrapMain{ 
    background-color: blue; 
    width: 100%;
    height: 1000px;
	 }
	 
 #mb_head{
 	position:relative;
 	height: 100px;
 }
 #mb_title {
 	position:absolute;
 	margin-left : 160px;
 	margin-top  : 30px;
 	
 	position:fixed;
 }
 #select_kind{
 	position:absolute;
 	margin-left : 80%;
 	margin-top  : 70px;
 	width: 100px;
 	position:fixed;
 }

#mb_tableWrap{
	position:relative;
	background-color: green; 
	height: 900px;
}

#mb_tableDiv{
     position:absolute;
     margin-left : 160px;
 	 margin-top  : 20px;
     width: 1450px;
     height: 800px;
     background-color: red; 
     position:fixed;
}

</style>


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



 <div id="wrapper">
		<div id="wrapMain">
			<div id = "mb_head">
				<div id = "mb_title"><h1>회원게시판</h1></div>
				<div id = "select_kind">
					<select name = "kind" id = "kind" style = "width:100px;">
						<option value = "humor1">유머1</option>
						<option value = "humor2">유머2</option>
						<option value = "humor3">유머3</option>
						<option value = "humor4">유머4</option>
					</select>
				</div>
			</div>
			
			<div id = "mb_tableWrap">
				<div id = "mb_tableDiv">
					
				
				</div>
			
			</div>
			
	    </div>
</div>

	


</body>
</html>