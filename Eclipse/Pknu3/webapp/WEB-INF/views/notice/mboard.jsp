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
<link rel="stylesheet" href="/css/mboard.css">

<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
$(document).ready(
		
		
		
		
		function(){
			
			 var strHTML = "";
		        
		        $.ajax({
		                 url :"/kwi_ajax",
		                 datatype: "json",
		                 success : function(datas) {
		                 
		                 strHTML += "<table width = '1450' cellpadding = '0' cellspacing ='0' id = 'userboard'>";
						 strHTML += "<tr class = 'headtr'>";
						 strHTML +=	"<td>번호</td>";
						 strHTML += "<td>제목</td>";
						 strHTML += "<td>작성자</td>";
						 strHTML += "<td>날짜</td>";
						 strHTML += "<td>조회수</td>";
						 strHTML += "</tr>";
		                     
		                 $.each( datas,function(index, item)
		                
		                {
		                	 strHTML += "<tr class = 'MainUL' >";
		                	 strHTML +=	"<td><h1 style = 'color:#07D88E'>1</h1></td>";
		                	 strHTML +=	"<td class = 'itemtd' >";			
		                	 strHTML +=	"<div class = 'textdiv'>";
		                	 strHTML +=	"최선생님 이두박근 보고 있으면...";
		                	 strHTML +=	"</div>";
		                	 strHTML +=	"<div class = 'imgdiv'>";
		                	 strHTML +=	"<img alt= 'Schedule' src= '/img/main.jpg' width = '90'/>";
		                	 strHTML +=	"</div>";
		                	 strHTML +=	"</td>";
		                	 strHTML += "<td>이두박근 성애자</td>";
		                	 strHTML += "<td>2020.08.05</td>";
		                	 strHTML += "<td>20</td>";
		                	 strHTML += "</tr>"
		                }
		                         
		                 );
		                 strHTML += "</table>";
		                     
		                 $("#" + mb_tableDiv).html(strHTML);
		                 
		                 },
		                 error: function(){
		                         alert("err");
		                 }
		        });
		}
		
		
		
);
</script>


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
					<!-- 테이블 -->
				</div>
			</div>
			
	    </div>
</div>

<!--  
<table width = "1450" cellpadding = "0" cellspacing ="0" id = "userboard">
						<tr class = "headtr">
							<td>번호</td>
							<td>제목</td>
							<td>작성자</td>
							<td>날짜</td>
							<td>조회수</td>
						</tr>
						<tr class = "MainUL" >
							<td><h1 style = "color:#07D88E">1</h1></td>
							<td class = "itemtd" >			
								<div class = "textdiv">
									최선생님 이두박근 보고 있으면...
								</div>
								<div class = "imgdiv">
								 	<img alt="Schedule" src="/img/main.jpg" width = "90"/>
								</div>
							</td>
							<td>이두박근 성애자</td>
							<td>2020.08.05</td>
							<td>20</td>
						</tr>
						
						
					</table>-->
	


</body>
</html>