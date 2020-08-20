<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<style>
 #mainImg {
 	background-image : url('/img/main.jpg');
 	background-size : 1000px 420px;
 	background-position : center center;
 	background-repeat: no-repeat;
 	
 }
 </style>
<style>
		@import url(https://fonts.googleapis.com/css?family=Russo One:300);

.login-page {
  width: 700px;
  padding: 8% 0 0;
  margin: auto;
}
.form {
  position: relative;
  z-index: 1;
  background: #FFFFFF;
  max-width: 500px;
  height: 350px;
  margin: 0 auto 100px;
  padding: 45px;
  text-align: center;
  box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0 rgba(0, 0, 0, 0.24);
}
.form input {
  font-family:'Russo One', 'Do Hyeon', sans-serif;
  outline: 0;
  background: #f2f2f2;
  width: 100%;
  border: 0;
  margin: 0 0 15px;
  padding: 15px;
  box-sizing: border-box;
  font-size: 20px;
}
.form button {
  font-family: 'Russo One', 'Do Hyeon', sans-serif;
  text-transform: uppercase;
  outline: 0;
  background: #4CAF50;
  width: 100%;
  border: 0;
  padding: 15px;
  color: #FFFFFF;
  font-size: 14px;
  -webkit-transition: all 0.3 ease;
  transition: all 0.3 ease;
  cursor: pointer;
}
.form button:hover,.form button:active,.form button:focus {
  background: #43A047;
}
.form .message {
  margin: 15px 0 0;
  color: #b3b3b3;
  font-size: 12px;
}
.form .message a {
  color: #4CAF50;
  text-decoration: none;
}
.form .register-form {
  display: none;
}
.container {
  position: relative;
  z-index: 1;
  max-width: 300px;
  margin: 0 auto;
}
.container:before, .container:after {
  content: "";
  display: block;
  clear: both;
}
.container .info {
  margin: 50px auto;
  text-align: center;
}
.container .info h1 {
  margin: 0 0 15px;
  padding: 0;
  font-size: 36px;
  font-weight: 300;
  color: #1a1a1a;
}
.container .info span {
  color: #4d4d4d;
  font-size: 12px;
}
.container .info span a {
  color: #000000;
  text-decoration: none;
}
.container .info span .fa {
  color: #EF3B3A;
}
body {
  background: #07D88E; /* fallback for old browsers */
  background: -webkit-linear-gradient(right,#8DC26F,#07D88E);
  background: -moz-linear-gradient(right, #8DC26F,#07D88E);
  background: -o-linear-gradient(right, #8DC26F,#07D88E);
  background: linear-gradient(to left, #8DC26F,#07D88E);
  font-family:  'Russo One', 'Do Hyeon', sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;      
}
#selBtn{ font-family:  'Russo One', 'Do Hyeon', sans-serif; }
</style>

</head>
<script>
$(function(){
	var responseMessege = "<c:out value ="${pop}" />"; 
	if(responseMessege == "nologoin"){
		alert("로그인이 필요한 서비스입니다.")
	}else if(responseMessege == "noid"){
		alert("아이디를 입력해주세요.")
	}else if(responseMessege == "nopwd"){
		alert("비밀번호를 입력해주세요.")
	}else if(responseMessege == "nocorrect"){
		alert("아이디와 비빌번호를 정확히 입력해 주세요.")
	}
})

$(document).ready(function() {
    var logininfo =  "${login.mname}";
  	
    if(logininfo!=""){
    	alert(logininfo+"님 반갑습니다")
    	$("div[name=barRight1]").hide();
    }
    
    else{
    	$("div[name=barRight2]").hide();
    }
});

function myTicket(){
	var logininfo =  "${login.mname}";
	var url= "/myTicket?mid=${login.mid}"
	var name = "이용권조회"
	var option = "width =700, height=800, top = 100 , left = 200, location= no"
	if(logininfo!= ""){
	window.open(url,name,option);}
	else{alert("로그인이 필요합니다");}
}

</script>

<body>
		<div id="topNav">
		<div id="logo">
			<span>로고 위치</span>
		</div>
		<input id="selBtn" type="button" value="이용권 조회" onclick="myTicket()"/>
		<div id="barRight" name="barRight1">
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
		<div id="barRight" name="barRight2">
			<ul>
				<li >
						<img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
						<div>${login.mname}님</div>
				</li>
				<li>
					<a href="/logout">
						<img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
						<div>로그아웃</div>
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
					<div class="login-page">
  <div class="form">
    
    <form class="login-form" action="/loginProcess" method="POST">
      <input type="text" placeholder="userid" name= "mid"/>
      <input type="password" placeholder="userpass" name= "mpwd"/>
      <button>login</button>
      <p class="message">Not registered? <a href="/AssignForm">Create an account</a></p>
      <p class="message">Forgot ID? <a href="/GetIdForm">Find it!</a></p>
      <p class="message">Forgot Password? <a href="/GetPwdForm">Find it!</a></p>
    </form>
  </div>
</div>
				
			</div>
		</div>
	</div>
</body>
</html>

<!-- 
<form class="register-form">
      <input type="text" placeholder="name"/>
      <input type="password" placeholder="password"/>
      <input type="text" placeholder="email address"/>
      <button>create</button>
      <p class="message">Already registered? <a href="#">Sign In</a></p>
    </form> -->
