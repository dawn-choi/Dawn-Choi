<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
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
	
	<!-- 메인 -->
	<div id="wrapper">
		<div style="margin-bottom: 10px">
			<select>
				<option value="">종류</option>
			<c:forEach var="bsel" items="${spBoardList}">
				<option value="${ bsel.pname }">${ bsel.pname }</option>
			</c:forEach>	
			</select> <select>
				<option value="">가격별</option>
				<option value="">높은가격순</option>
				<option value="">낮은가격순</option>
			</select> <a href="/SideBar">사이드바</a>
		</div>
		<table id="tablesort" style="width: 700px; height: 300px">
			<tr>
				<th width="60">번호</th>
				<th width="200">회원권</th>
				<th width="200">회원권명</th>
				<th width="150" align="right">사용기한/세션</th>
				<th width="80" align="right">가격</th>
			</tr>

			<c:forEach var="bdata" items="${spBoardList}">
				<tr>
					<td>${bdata.index}</td>
					<td>${bdata.pname}</td>
					<td>${bdata.category}</td>
					<td>${bdata.cname}</td>
					<td>${bdata.pcost}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>