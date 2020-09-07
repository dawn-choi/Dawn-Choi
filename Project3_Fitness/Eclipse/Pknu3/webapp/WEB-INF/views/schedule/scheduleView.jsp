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

a{
  	 	font-family: 'Russo One', 'Do Hyeon', sans-serif;
		color: white;
		text-decoration: none;
		text-line : none;
 }
 
 a:hover{
        color: white;
        }
 
</style>

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

<script>
$(document).ready(function (){
      
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
                    		   labels : chartLabels,
                    		   datasets : [ {
                    		   label : '운동향상량',
                    		   backgroundColor : color(window.chartColors.green).alpha(0.2).rgbString(),   
                    		   borderColor : window.chartColors.green, 
                    		   pointBackgroundColor : window.chartColors.green,
                    		   data : chartData
                    			}] 
                    		};

                    		var chartOptions =  {
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
                    		                        };

                    		var chartImp = $('#impChart');
                    		var radarChart = new Chart( chartImp, {
                    		   type:'radar',
                    		   data:config,
                    		   options: chartOptions
                    		});
                    		
                     //window.location.href = "/Schedule/ScheduleView";
                     console.log("chartLabel2:" + chartLabels);
                     console.log("chartData2:" + chartData);
                 },
                 error: function(){
                    alert("차트 데이터 불러오기 실패");
                 }
         });
          
});   
   
</script>
<!-- /운동 향상량/    -->
<body>
    <%@include file="/WEB-INF/include/navigationBar.jsp" %>
    
   <div id="all">
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
                  운동향상량
               </h3>
               <canvas id="impChart"></canvas>
            </div>
         </div>
      </div>
   </div>
</body>
</html>