<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시간표</title>
<link rel="stylesheet" href="/css/commons.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">

<style>
	#all{
			width: 1900px;
		}
		
	* {
		font-family: 'Russo One', 'Do Hyeon', sans-serif;
	}
	table, th, td{
					border : 2px solid #07D88E;
					border-collapse:collapse;
					text-align : center;
					line-height : 55px;
				 }
				 
	table {width: 1500px; margin: 100px auto;}
	
	a {
		color: white;
		text-decoration: none;
		text-line : none;
		
	}
	
	.titles {
		  color : black;
		  font-family: 'Russo One', 'Do Hyeon', sans-serif;
	 }  
	 
	 .titles:hover{
	 		color: purple;
	 		}
	 		
	td > a {
		display:block;
		width:100%;
		height:100%;
		background-color: lightgreen;
	} 
	th {
	      background-color:#07D88E;
	      color :white;
	      font-family: 'Russo One', 'Do Hyeon', sans-serif;
		  font-size: 30px;
	   }
	   
	td{
	  font-family: 'Russo One', 'Do Hyeon', sans-serif;
		  font-size: 25px;
		  padding : 2px;
	  }
	
	td:nth-of-type(1) {width: 50px;}
	td:nth-of-type(2) {width: 300px;}
	td:nth-of-type(3) {width: 300px;}
	td:nth-of-type(4) {width: 300px;}  
	td:nth-of-type(5) {width: 300px;}  
	
</style>
   <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
   <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
   <script>
		  $(document).ready(function() {
		    var logininfo =  "${login.mname}";
		  	
		    if(logininfo!=""){
		    	$("#barRight1").hide();
		    }
		    else{
		    	$("#barRight2").hide();
		    }
		});

   	
   </script>
</head>
<body>
	<%@include file="/WEB-INF/include/navigationBar.jsp" %>

	<div id="all">
	
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
				<a class= "titles" href="/Schedule/ScheduleView?mid=${scheduleList.mid}&lid=${scheduleList.lid}&lname=${scheduleList.lname}
						&dday=${scheduleList.dday}&dtime=${scheduleList.dtime}&rtime=${scheduleList.rname}&tname=${scheduleList.tname}
						&pid=${scheduleList.pid}&ptot=${scheduleList.ptot}&pcost=${scheduleList.pcost}&cname=${scheduleList.cname}">
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