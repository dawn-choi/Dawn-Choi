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
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script>
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
</head>
<body>
	<%@include file="/WEB-INF/include/navigationBar.jsp" %>
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