<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<title>03 프로젝트 자유게시판</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/noticewrite.css">
<link rel="stylesheet" href="/css/noticecontent.css">
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bnum같은 애들이 이 페이지로 넘어올때 숫자값으로 넘어옴 -->
<!-- 컨트롤 부분에서 활용할때 String -->



</head>
<body>
<!-- 상단 네비게이션  -->
	<<div id="all">
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
         <li><a class="categorys" href="/MBoard"><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>
   
   <div id="wrapper">
		<div id="wrapDiv">
			<div id="writeFormDiv">
				<div class="card card-success" >
					<div class="card-header" style="background-color:#07D88E; color:white;">
					
					<table class = "writeTr">
						<tr >
						<td><h3 class="card-title" style = "font-size:30px;">게시글 작성</h3></td>
						<td>
							<h3 style = "font-size:20px;">작성자: 유아름</h3>
							<h3 style = "font-size:20px;">작성일: 2020-08-19</h3>
						</td>
						</tr>
					</table>
						
						
					</div>
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
				
						<div class = "writeInfoDiv" id = "writeMT">
					     <input type="text" value ="메뉴" readonly/>
						 
						 <input type="text" value ="타이틀" readonly/>
						 </div>
						 
						 <!-- 본문 내용  -->
						 <div class = "writeInfoDiv" id = "writeContent">
					    	<p><img alt="" src="files/79.gif" style="height:532px; width:300px" /></p>
					    	<p><span style="color:#e74c3c">
					    	<span style="font-size:18px">핵 귀요미~~</span>
					    	</span>&nbsp;<img alt="blush" src="http://localhost:9090/ckeditor/plugins/smiley/images/embarrassed_smile.png" style="height:23px; width:23px" title="blush" /></p>
					    </div>
						
						
						 <div class="writeInfoDiv" id = "writeFiles">
						 	 
						 </div>
						 
						 <div class="writeInfoDiv" id = "writeButton" >
						 <table class = "writeTr">
						 	<tr>
						 		  <td id ="UpdateTD">
						 		  	
						 		  </td>
						 		  <td id ="DeleteTD">
						 		  	<a href=/NoticeWriteUpdateForm?idx=1><button class = writeBtn id = writeBtn1 ><span>수정하기</span></button></a>
						 		  	<a href=/NoticeDelete?idx=1><button class = writeBtn id = writeBtn2 ><span>삭제하기</span></button></a>
						 		  </td>
						 	</tr>
						 </table>
						 </div>			 
					</div>
					
				</div>

			</div>
		</div>
	</div>
   
 

</body>
</html>