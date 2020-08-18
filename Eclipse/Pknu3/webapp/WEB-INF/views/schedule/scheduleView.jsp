<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세정보 보기</title>
<link rel="stylesheet" href="/css/commons.css">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
   rel="stylesheet">
<!-- 상세 보기    -->
<style>
#all {
   width: 1900px;
}

.tbl {
   clear: both;
   float: left;
   padding-left: 100px;
}

table.type07 {
   border-collapse: collapse;
   text-align: center;
   line-height: 1.5;
   border: 1px solid #ccc;
   margin: 100px 100px;
}

table.type07 thead {
   border-right: 1px solid #ccc;
   border-left: 1px solid #ccc;
   background: #fdd0cd;
}

table.type07 thead th {
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 22px;
   vertical-align: top;
   color: white;
}

table.type07 tbody th {
   width: 150px;
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 15px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
   background: #cdfde8;
}

table.type07 td {
   width: 350px;
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 17px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}
</style>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>AdminLTE 3 | ChartJS</title>
<!-- Tell the browser to be responsive to screen width -->
<!-- Font Awesome -->
<link rel="stylesheet" href="/plugins/fontawesome-free/css/all.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
   href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<!-- Google Font: Source Sans Pro -->
<link
   href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700"
   rel="stylesheet">
<!-- /상세 보기/    -->


<!-- 운동 향상량    -->
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="../js/utils.js"></script>

<style>
.imp {
   margin: 100px 100px 0px 0px;
   float: right;
   padding-right: 100px;
}

canvas {
   -moz-user-select: none;
   -webkit-user-select: none;
   -ms-user-select: none;
}

h3 {
   padding-right: 20px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 30px;
}
</style>

<script>
$(document).ready(function (){
      
   $('#impBtn').click(
      function(){
         alert("impBtn");
         
          $.ajax({
               url    : '/Schedule/ImpList',
                 data   : {'pid' : '${scheduleVo.pid}'},
                 type   : 'POST',
                 success : function(datas){
                    console.log(datas);
                    
                    var chartLabels =   [];
                    var chartData     = [];
                    
                    $.each(datas, function(index, scheduleVo){
                       chartLabels.push(scheduleVo.bname);
                        chartData.push(scheduleVo.imp);
                        
                        console.log(chartLabels);
                        console.log(chartData);
                     });
                    
                    var randomScalingFactor = function() {
                        return Math.round(Math.random() * 100);
                     };

                     var color = Chart.helpers.color;
                     var config = {
                        type : 'radar',
                        data : {
                           labels : chartLabels,
                           datasets : [
                                 {
                                    label : '운동향상량',
                                    backgroundColor : color(window.chartColors.red).alpha(
                                          0.2).rgbString(),
                                    borderColor : window.chartColors.red,
                                    pointBackgroundColor : window.chartColors.red,
                                    data : chartData
                                 }]
                        },
                        
                        options : {
                           legend : {
                              position : 'top',
                           },
                           title : {
                              display : true,
                              text : ''
                           },
                           scale : {
                              beginAtZero : true
                           }
                        }
                     };
                     
                     var imp = '${scheduleVo.pid}'
                    alert(imp);
                    var e = $("#imp").html(datas);
             alert(e);
                    
                     //window.location.href = "/Schedule/ScheduleView";
                     console.log("chartLabel2:" + chartLabels);
                     console.log("chartData2:" + chartData);
                 },
                 error: function(){
                    alert("차트 데이터 불러오기 실패");
                 }
         });
          
   });
   
});   
   
</script>
<!-- /운동 향상량/    -->
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
               <li><a href="/LoginForm"> <img class="imgSet" width="35px"
                     height="35px" alt="Login" src="/img/login.png">
                     <div>로그인</div>
               </a></li>
               <li><a href="/SignUpForm"> <img class="imgSet"
                     width="35px" height="35px" alt="SignUp" src="/img/submit.png">
                     <div>회원가입</div>
               </a></li>
            </ul>
         </div>
      </div>
      <!-- 왼쪽 네비게이션 -->
      <div id="leftNav">
         <ul>
            <li><a class="categorys" href="/"><img width="40px"
                  height="40px" alt="HOME" src="/img/home.png"></a></li>
            <li><a class="categorys" href="/Schedule/ScheduleList"><img
                  width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li>
            <li><a class="categorys" href="/Subject/List"><img
                  width="40px" height="40px" alt="Class register"
                  src="/img/registration.png"></a></li>
            <li><a class="categorys" href=""><img width="40px"
                  height="40px" alt="Product List" src="/img/gym.png"></a></li>
            <li><a class="categorys" href=""><img width="40px"
                  height="40px" alt="Statistics" src="/img/result.png"></a></li>
            <li><a class="categorys" href=""><img width="40px"
                  height="40px" alt="Board" src="/img/meeting.png"></a></li>
            <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
         </ul>
      </div>

      <div id="wrapper1">
         <div id="wrapper">
            <div class="tbl">
               <table class="type07">
                  <thead>
                     <tr>
                        <th scope="cols">제목</th>
                        <th scope="cols">내용</th>
                     </tr>
                  </thead>
                  <tbody>
                     <tr>
                        <th scope="row">과목명</th>
                        <td>${scheduleVo.lname}</td>
                     </tr>
                     <tr>
                        <th scope="row">요일</th>
                        <td><c:forEach var="schedule" items="${schedule}">
               ${schedule.dday} 
               </c:forEach></td>
                     </tr>
                     <tr>
                        <th scope="row">시간</th>
                        <td><c:forEach var="schedule" items="${schedule}">
               ${schedule.dtime}
               </c:forEach></td>
                     </tr>
                     <tr>
                        <th scope="row">강의실</th>
                        <td><c:forEach var="schedule" items="${schedule}">
               ${schedule.rname}
               </c:forEach></td>
                     </tr>
                     <tr>
                        <th scope="row">강사명</th>
                        <td>${scheduleVo.tname}</td>
                     </tr>
                     <tr>
                        <th scope="row">인원</th>
                        <td>${scheduleVo.ptot}</td>
                     </tr>
                     <tr>
                        <th scope="row">금액</th>
                        <td>${scheduleVo.pcost}</td>
                     </tr>
                     <tr>
                        <th scope="row">기간</th>
                        <td>${scheduleVo.cname}</td>
                     </tr>
                  </tbody>
               </table>

            </div>

            <div class="imp" style="width: 45%">
               <h3>
                  운동향상량 <input type="button" id="impBtn" value="차트 보기" size="10" />
               </h3>
               <canvas id="${scheduleVo.pid}"></canvas>
            </div>
         </div>
      </div>
   </div>
</body>
</html>