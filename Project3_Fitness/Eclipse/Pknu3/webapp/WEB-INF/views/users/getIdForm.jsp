<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
	rel="stylesheet">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>

<style>
#mainImg {
	background-image: url('/img/main.jpg');
	background-size: 1000px 420px;
	background-position: center center;
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
	box-shadow: 0 0 20px 0 rgba(0, 0, 0, 0.2), 0 5px 5px 0
		rgba(0, 0, 0, 0.24);
}

.form input {
	font-family: 'Russo One', 'Do Hyeon', sans-serif;
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

.form button:hover, .form button:active, .form button:focus {
	background: #43A047;
}

.form .message {
	color: #4CAF50;
	font-size: 30px;
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
	background: -webkit-linear-gradient(right, #8DC26F, #07D88E);
	background: -moz-linear-gradient(right, #8DC26F, #07D88E);
	background: -o-linear-gradient(right, #8DC26F, #07D88E);
	background: linear-gradient(to left, #8DC26F, #07D88E);
	font-family: 'Russo One', 'Do Hyeon', sans-serif;
	-webkit-font-smoothing: antialiased;
	-moz-osx-font-smoothing: grayscale;
}

#selBtn {
	font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
</style>


</head>
<script>
$(function(){
	var responseMessege = "<c:out value ="${count}"/>"; 
	var responseMessege2 = "<c:out value ="${mid}"/>"; 
	if(responseMessege == "1"){
		if(responseMessege2=="" ||responseMessege2==null ){
		alert("제대로 입력해 주세요.");
			
		}else{
		alert(" 고객님의 아이디는 '<c:out value ="${mid}"/>' 입니다. ");}
	}
})



	function formCheck() {
		var mname = document.getElementById('mname');
		var memail = document.getElementById('memail');

		if (mname.value == '' || mname.value == null) {
			alert('이름을 입력하세요');
			focus.mname;
			return false;
		}
		if (memail.value == '' || memail.value == null) {
			alert('이메일을 입력하세요');
			focus.mname;
			return false;
		}else{
			var find = document.getElementById('find');

			find.submit();


		}

	}
</script>
<body>
		<%@include file="/WEB-INF/include/navigationBar.jsp" %>
	<!-- 메인 -->
	<div id="wrapper">
		<div id="wrapMain">
			<div id="mainImg">
				<div class="login-page">
					<div class="form">

						<p class="message">아이디 찾기</p>
						<form class="login-form" action="/getId" method="POST" id="find">
							<input type="text" placeholder="이름" name="mname" id="mname" /> <input
								type="text" placeholder="이메일주소" name="memail" id="memail" />
							<button onclick="formCheck();">제출</button>
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
