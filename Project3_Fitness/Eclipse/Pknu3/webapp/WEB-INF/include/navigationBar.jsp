<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<script>

function myTicket(){
	var logininfo =  "${login.mname}";
	var url= "/myTicket?mid=${login.mid}"
	var name = "이용권조회"
	var option = "width =700, height=800, top = 100 , left = 200, location= no"
	if(logininfo!= ""){
	window.open(url,name,option);}
	else{alert("로그인이 필요합니다");}
}
function myInfo(){
	var url= "/myInfo?mid=${login.mid}"
	var name = "내 정보"
	var option = "width =800, height=500, top = 100 , left = 200, location= no"
		window.open(url,name,option);
}
</script>
<!-- 상단 네비게이션  -->
   <div id="topNav">
		<div id="logo">
			<span id="logoMsg">P#3 Fitness</span>
		</div>
		<input id="selBtn" type="button" value="이용권 조회" onclick="myTicket()"/>
		<div id="barRight">
			<div id="barRight1">
			<ul>
				<li>
					<a href="/LoginForm">
						<img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
						<div>로그인</div>
					</a>
				</li>
				<li>
					<a href="/AssignForm">
						<img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
						<div>회원가입</div>
					</a>
				</li>
			</ul>
			</div>
			<div id="barRight2">
			<ul>
				<li >
					<a href="#"onclick="myInfo()">
						<img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
						<div>${login.mname}님</div>
						</a>
				</li>
				<li>
					<a href="/logout">
						<img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
						<div>로그아웃</div>
					</a>
				</li>
			</ul>
			</div>
		</div>	
	</div>
   <!-- 왼쪽 네비게이션 -->
   <div id="leftNav">
      <ul>
      	 <li><a class="categorys" href="/"><img width="40px" height="40px" alt="HOME" src="/img/home.png"></a></li>
         <li><a class="categorys" href="/Schedule/ScheduleList"><img width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li> 
         <li><a class="categorys" href="/Subject/List"><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
         <li><a class="categorys" href="/Table"><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
         <li><a class="categorys" href="/Statistics/StatisticsList"><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
         <li><a class="categorys" href="/MBoard"><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <li><a class="categorys" href="/Trainers/TrainersInfo"><img width="40px" height="40px" alt="info" src="/img/megaphone.png"></a></li>
         <li><a class="categorys" href="/maps"><img width="40px" height="40px" alt="map" src="/img/map.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>
	