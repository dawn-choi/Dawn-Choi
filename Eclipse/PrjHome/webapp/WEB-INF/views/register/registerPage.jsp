<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 신청 페이지</title>
<link rel="stylesheet" href="/css/commons.css">
<style>
	#wrapper {
	margin-left: 60px;
	margin-top: 60px;
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
			<li><a class="category" href="/RegisterPage"><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
			<li><a class="category" href=""><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
			<!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
		</ul>
	</div>
	<div id="wrapper">
		<div id="searchWrap">
			<div id="filter">
				<select id="">
					<option  value="">선택</option>
					<!-- 그룹명 - GRNAME -->
					<c:forEach var="grpVo" items="${ groupList }">
						<option value="${ grpVo.grId }" >${ grpVo.grName }</option>
					</c:forEach>
				</select>
			</div>
			<!-- 여기 상품 목록이 출력 될 것임 -->
			<div id="search">
				<select id="">
					<option value="">선택</option>
					<option value="1">수업명</option>
					<option value="2">강사명</option>
				</select>
				<input type="text" id="searchText" />
				<input type="button" id="searchBtn" value="검색" />
			</div>
		</div>
	
		<table border="1">
			<tr>
				<th>종류</th>
				<th>수업명</th>
				<th>요일</th>
				<th>시간</th>
				<th>강의실</th>
				<th>강사명</th>
				<th>수업료</th>
				<th>신청</th>
			</tr>
			<!-- 아래에 리스트 ROW 반복 -->
			<c:set	var="old"	value=" " />
			<c:forEach	var="subjectVo" items="${ subjectList }">
			<tr>
			<c:choose>
				<c:when test="${ old ne subjectVo.lId }">
					<td rowspan="${ subjectVo.lCnt }">${ subjectVo.grName }</td>
					<td rowspan="${ subjectVo.lCnt }">${ subjectVo.lName  }</td>
					<td>${ subjectVo.dDay	}</td>
					<td>${ subjectVo.dTime	}</td>
					<td rowspan="${ subjectVo.lCnt }">${ subjectVo.rName  }</td>
					<td rowspan="${ subjectVo.lCnt }">${ subjectVo.tName  }</td>
					<td rowspan="${ subjectVo.lCnt }">${ subjectVo.pCost  }</td>
					<td rowspan="${ subjectVo.lCnt }">
						<a href="/Subject/Register?mId=${ subjectVo.mId }&lId=${ subjectVo.lId}" id="insertBtn">신청</a>
					</td>
				</c:when>
				<c:otherwise>
					<td>${ subjectVo.dDay	}</td>
					<td>${ subjectVo.dTime	}</td>
				</c:otherwise>
			</c:choose>	
			</tr>
				<c:set	var="old"	value="${ subjectVo.lId }" />	
			</c:forEach>
		</table>
	</div>
	<!-- 페이지네이션 넣을까 말까? ADMINLTE 사용 예정-->
	
</body>
</html>