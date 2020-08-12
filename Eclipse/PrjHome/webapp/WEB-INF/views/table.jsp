<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품관리</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="//cdn.datatables.net/1.10.10/css/jquery.dataTables.min.css">
<style>
#tablesort{
  margin : 0 auto;
}

.bdetail {
	width: 700px;
	display: none;
}

.detailleft {
	width: 100px;
	display: none;
}

.detailright {
	width: 250px;
	display: none;
}

.firsttr th:nth-child(even) {
  background-color : #8C9AB5;
  color : white;
  font-weight : bold;
}
.firsttr th:nth-child(odd) {
  background-color : #515D75;
  color : white;
  font-weight : bold;
}
</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
    $(document).ready(function() {
      var deltr =  $("td").html();;
    	
      for (var i = 1; i <= $('tr').length; i++) {
	    $("#selone").val(i).change(function(){
		 if(deltr != "")
			  $('tr').eq(i+1).hide();  
	    });
      };
	    
	    for (var i = 1; i <= $('tr').length; i++) {
		    $("#seltwo").val(i).change(function(){
			 if(deltr != "")
				  $('tr').eq(i+1).hide();  
		    });
	    };     

	    
	    $("td").click(function(){
			// alert("클릭됨");
		    	if($(".bdetail").css("display") == "none"){   
		    		$(".bdetail").show();   
		    		$(".bdetail > div").show();   
		        } else {  
		        	$(".bdetail").hide();   
		    		$(".bdetail > div").hide();   
		        }  
		    }); // td.click
	  
    });
      
	  /* $("#selone").val("2").change(function()
		  if(deltr != "")
			  $('tr:nth-child(2)').hide();	  
	  );
	  
	  $("#seltwo").val("3").change(function()
		  if(deltr != "")
			  $('tr:nth-child(2)').hide();
	  );
	  
	  $("#seltwo").val("4").change(function()
		  if(deltr != "")
			  $('tr:nth-child(2)').hide();
	  ); */
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
				<li><a href="/LoginForm"> <img class="imgSet" width="35px"
						height="35px" alt="Login" src="/img/login.png">
						<div>로그인</div>
				</a></li>
				<li><a href="/SignUpForm"> <img class="imgSet" width="35px"
						height="35px" alt="SignUp" src="/img/submit.png">
						<div>회원가입</div>
				</a></li>
			</ul>
		</div>
	</div>
	<!-- 왼쪽 네비게이션 -->
	<div id="leftNav">
		<div id="toHome">
			<a href="/"><img width="40px" height="40px" alt="HOME"
				src="/img/home.png"></a>
		</div>
		<ul>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Schedule" src="/img/calendar.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Class register" src="/img/registration.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Product List" src="/img/gym.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Statistics" src="/img/result.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Board" src="/img/meeting.png"></a></li>
			<!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
		</ul>
	</div>

	<!-- 메인 -->
	<div id="wrapper">
		<div style="margin-bottom: 10px">
			<form id="user" action="join" method="post">
				<select id="selone">
					<option value="">종류별</option>
					<option value="1">개인운동</option>
					<option value="2">그룹수업</option>
				</select> 
				<select id="seltwo">
					<option value="">가격별</option>
					<option value="3">높은가격순</option>
					<option value="4">낮은가격순</option>
				</select>
			</form>

			<a href="/SideBar">사이드바</a>
		</div>
		<table id="tablesort" style="width: 700px; height: 300px">
			<tr class="firsttr">
				<th width="60">번호</th>
				<th width="200">회원권</th>
				<th width="200">회원권명</th>
				<th width="150" >사용기한/세션</th>
				<th width="80" >가격</th>
			</tr>

			<c:forEach var="bdata" items="${spBoardList}" varStatus="status">
				<tr class="datarow">
					<td class="${status.count}">${bdata.count}</td>
					<td class="${status.count}" >${bdata.pname}</td>
					<td class="${status.count}" >${bdata.category}</td>
					<td class="${status.count}" >${bdata.cname}</td>
					<td class="${status.count}" >${bdata.pcost}
					<!-- <div class="bdetail">
						<div class="detailleft">회원권명</div>
						<div class="detailright">회원권명</div>
						<div class="detailleft">사용기간</div>
						<div class="detailright">회원권명</div>

						<div class="detailleft">가격</div>
						<div class="detailright">회원권명</div>
						<div class="detailleft">수업요일</div>
						<div class="detailright">회원권명</div>

						<div class="detailleft">수업시간대</div>
						<div class="detailright">회원권명</div>
						<div class="detailleft">총인원</div>
						<div class="detailright">회원권명</div>
					</div> -->
					</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>