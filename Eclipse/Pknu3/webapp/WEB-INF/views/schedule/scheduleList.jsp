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

<style>
	#all{
			width: 1900px;
		}
	

	table, th, td{
					border : 2px solid #13EBA2;
					border-collapse:collapse;
					text-align : center;
					line-height : 50px;
				 }
				 
	table {width: 1000px; margin: 100px auto;}
	
	h2{
		  color : PowderBlue;
		  text-align : center;
	  }
	  
	a{
		  color : Darkgrey;
		  text-decoration: none;
		  text-line : none;
		  font-family: 'Russo One', 'Do Hyeon', sans-serif;
		  font-size : 17px;

	 }  
	 
	th {
	      background-color:#13EBA2;
	      color :white;
	      font-family: 'Russo One', 'Do Hyeon', sans-serif;
		  font-size: 25px;
	   }
	   
	td{
	  font-family: 'Russo One', 'Do Hyeon', sans-serif;
		  font-size: 17px;
	  }
	
	td:nth-of-type(1) {width: 50px;}
	td:nth-of-type(2) {width: 200px;}
	td:nth-of-type(3) {width: 200px;}
	td:nth-of-type(4) {width: 200px;}  
	td:nth-of-type(5) {width: 200px;}  
</style>

   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   
</head>
<body>
	<div id="all">
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
	
	<div id="wrapper1">
	<div id="wrapper">
	<table>
		<tr>
			<th></th>
			<th>월</th>
			<th>화</th>
			<th>수</th>
			<th>목</th>
			<th>금</th>
			<th>토</th>
		</tr>
		
		<c:forEach var="time" items="${time}">
		<tr id="${time}" >
			<td>${time} </td>
			<c:forEach var="day" items="${day}">
			<td id="${day}" style="width: 50px; height: 50px;"> <c:forEach var="scheduleList" items="${scheduleList}" >
			<c:set var="day" value="${day}"/>
			<c:set var="dday" value="${scheduleList.dday}"/>
			<c:set var="time" value="${time}"/>
			<c:set var="dtime" value="${scheduleList.dtime}"/>
	
			<c:choose>
			<c:when test="${day eq dday && time eq dtime}">
				<a href="/Schedule/ScheduleView?mid=${scheduleList.mid}&lid=${scheduleList.lid}&lname=${scheduleList.lname}
						&dday=${scheduleList.dday}&dtime=${scheduleList.dtime}&rtime=${scheduleList.rname}&tname=${scheduleList.tname}
						&ptot=${scheduleList.ptot}&pcost=${scheduleList.pcost}&cname=${scheduleList.cname}">
				<c:out value="${scheduleList.lname}"/></a>
			</c:when>
			
			<c:otherwise>
				<c:out value=" "/>
			</c:otherwise>
			</c:choose>
			
			</c:forEach>
			</td>
			</c:forEach>
		</tr>
		</c:forEach>
	</table>		
</div>
</div>
</div>
</body>
</html>