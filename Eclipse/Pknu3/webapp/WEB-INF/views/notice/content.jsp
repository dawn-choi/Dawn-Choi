<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<title>03 프로젝트 자유게시판</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/noticewrite.css">
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
					
					<table>
						<tr class = "writeTr">
						<td><h3 class="card-title" style = "font-size:30px;">게시글 작성</h3></td>
						<td>
							<h3 style = "font-size:20px;">작성자: 유아름</h3>
							<h3 style = "font-size:20px;">작성일: 2020-08-19</h3>
						</td>
						</tr>
					
					</table>
						
						
					</div>
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
				
					
						 <div class="writeInfoDiv">
						 	
						 </div>
						 
						 <div class="writeInfoDiv" ><input type = "text" name="title" placeholder = "제목을 입력하세요."/></div>
					
						
						 <!-- 본문 에디터 -->
						  <!-- Ckeditor4 에디터 불러오기 크기 조절 최대치 설정 실패... 하...-->
					    <div class = "writeInfoDiv">
					    
					    <textarea id = "cont" name = "cont"
					    style = "width:100%;"></textarea>
					    
					    <script type="text/javascript">
						$(function(){
							CKEDITOR.replace('cont',{
								filebrowserUploadUrl: '/imageUpload.do'
							});
						});
						</script>
					    </div>
						
						
						 <div class="writeInfoDiv">
						 <input type="file" name="upfile" />		 
						 </div>
						 
						 <div class="writeInfoDiv" id = "writeOkDiv" >
						 <table>
						 	<tr class = "writeTr">
						 		<td><input type = "submit"  id = "writeOk" value="작성" />
						        </td>
						 	</tr>
						 </table>
						 </div>
						 
						 
						 
						 <!-- 숨겨진 정보 -->
						 <input type="hidden" name = "mid" value = "<c:out value= '${map.mid}'/>"/>
						 <input type="hidden" name="bnum" value="<c:out value='${ map.bnum}' />" />
   						 <input type="hidden" name="lvl" value="<c:out value='${ map.lvl}' />" />
   						 <input type="hidden" name="step" value="<c:out value='${ map.step}' />" />
   						 <input type="hidden" name="nref" value="<c:out value='${ map.nref}' />" />	
   						 <div id = "sumnailDiv"></div>		 
   						 	
							 
					</div>
					
				</div>

			</div>
		</div>
	</div>
   
 

</body>
</html>