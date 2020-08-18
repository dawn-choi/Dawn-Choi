<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/commons.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<!-- 상세 보기 	-->
<style>
.tbl {
	clear: both;
	float: left;
}

table.type07 {
	border-collapse: collapse;
	text-align: left;
	line-height: 1.5;
	border: 1px solid #ccc;
	margin: 100px 100px;
}

table.type07 thead {
	border-right: 1px solid #ccc;
	border-left: 1px solid #ccc;
	background: #fdd0cd;
}

table.type07 thead th {
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	color: #fff;
}

table.type07 tbody th {
	width: 150px;
	padding: 10px;
	font-weight: bold;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
	background: #cdfde8 ;
}

table.type07 td {
	width: 350px;
	padding: 10px;
	vertical-align: top;
	border-bottom: 1px solid #ccc;
}
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | ChartJS</title>
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Font Awesome -->
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
	rel="stylesheet">
<!-- /상세 보기/ 	-->


<!-- 운동 향상량 	-->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="../js/utils.js"></script>

<style>
.imp{
	margin: 100px 100px 0px 0px;
    float: right;
    }

canvas {
	-moz-user-select: none;
	-webkit-user-select: none;
	-ms-user-select: none;
}
</style>

<script>
	var randomScalingFactor = function() {
		return Math.round(Math.random() * 100);
	};

	var color = Chart.helpers.color;
	var config = {
		type : 'radar',
		data : {
			labels : [ '전신', '팔', '복부', '가슴', '엉덩이', '종아리', '허벅지' ],
			datasets : [
					{
						label : '핫요가 1개월',
						backgroundColor : color(window.chartColors.red).alpha(
								0.2).rgbString(),
						borderColor : window.chartColors.red,
						pointBackgroundColor : window.chartColors.red,
						data : [ 27,15,24,15,29,26,24 ]
					},
					{
						label : '핫요가 3개월',
						backgroundColor : color(window.chartColors.blue).alpha(
								0.2).rgbString(),
						borderColor : window.chartColors.blue,
						pointBackgroundColor : window.chartColors.blue,
						data : [ 54,30,48,30,57,51,48 ]
					},
					{
						label : '핫요가 6개월',
						backgroundColor : color(window.chartColors.green)
								.alpha(0.2).rgbString(),
						borderColor : window.chartColors.green,
						pointBackgroundColor : window.chartColors.green,
						data : [ 90,50,80,50,95,85,80 ]
					} ]
		},
		options : {
			legend : {
				position : 'top',
			},
			title : {
				display : true,
				text : '핫요가 운동 향상량'
			},
			scale : {
				beginAtZero : true
			}
		}
	};
	
	window.onload = function() {
		window.myRadar = new Chart(document.getElementById('canvas'), config);
	};
</script>
<!-- /운동 향상량/ 	-->
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
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>


<div id="wrapper">
	<div class="tbl">
		<table class="type07">
			<thead>
				<tr>
					<th scope="cols">타이틀</th>
					<th scope="cols">내용</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">과목명</th>
					<td>${scheduleVo.lname}</td>
				</tr>
				<tr>
					<th scope="row">요일</th>
					<td><c:forEach var="schedule" items="${schedule}">
				${schedule.dday} 
				</c:forEach></td>
				</tr>
				<tr>
					<th scope="row">시간</th>
					<td><c:forEach var="schedule" items="${schedule}">
				${schedule.dtime}
				</c:forEach></td>
				</tr>
				<tr>
					<th scope="row">강의실</th>
					<td><c:forEach var="schedule" items="${schedule}">
				${schedule.rname}
				</c:forEach></td>
				</tr>
				<tr>
					<th scope="row">강사명</th>
					<td>${scheduleVo.tname}</td>
				</tr>
				<tr>
					<th scope="row">인원</th>
					<td>${scheduleVo.ptot}</td>
				</tr>
				<tr>
					<th scope="row">금액</th>
					<td>${scheduleVo.pcost}</td>
				</tr>
				<tr>
					<th scope="row">기간</th>
					<td>${scheduleVo.cname}</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="imp" style="width: 45%">
		<canvas id="canvas"></canvas>
	</div>
</div>

</body>
</html>