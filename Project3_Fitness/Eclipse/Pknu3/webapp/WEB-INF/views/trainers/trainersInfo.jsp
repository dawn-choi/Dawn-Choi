<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용안내</title>
<link rel="stylesheet" href="/css/commons.css">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
   rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style>

.btn {
   margin: 0; auto;
   padding: 50px 0 0 50px;
}

button {
   width: 300px;
   height: 50px;
   background-color: #66ffc2;
   border: 1px solid #66ffc2;
   color: white;
   border-radius: 10px;
   font-size: 30px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

button:hover {
   background-color: #66ffc2;
   border: 1px solid #66ffc2;
   font-size: 30px;
   color: black;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

<!-- 시설 안내 -->
#main {
   margin: 150px;
     }

table {
   width: 1500px;
   margin: 100px auto;
}

table, th, td {
   border: 2px solid gray;
   border-collapse: collapse;
   text-align: center;
   line-height: 55px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 20px;
}

#fthead, #sthead{
  background-color: #FFFFF2;
  }

td:nth-of-type(1) {
   width: 500px;
}

td:nth-of-type(2) {
   width: 500px;
}

td:nth-of-type(3) {
   width: 500px;
}

<!-- 수업 안내 -->
.w3-display-container mySlides{
                  margin: 150px;
                  font-family: 'Russo One', 'Do Hyeon', sans-serif;
                  clear: both;     
                       }

#w3-display-topright w3-large w3-container w3-padding-hor-16 w3-black{
                                                font-family: 'Russo One', 'Do Hyeon', sans-serif;
                                                font-size: 20px;
                                                    }

p {
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   text-align: center;
   font-size: 30px;
}

h1 {
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

a {
		font-family: 'Russo One', 'Do Hyeon', sans-serif;
		color: white;
		text-decoration: none;
		text-line : none;
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
   $(document).ready(function() {

      $('#fac').click(function() {
         $('#facility').show();
         $('.w3-content').hide();
         $('#trainers').hide();
      });

      $('#cla').click(function() {
         $('.w3-content').show();
         $('#facility').hide();
         $('#trainers').hide();
      });
      
      $('#tra').click(function() {
          $('#trainers').show();
          $('.w3-content').hide();
          $('#facility').hide();
       });


   });
</script>

<style>
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
   background: #7CFFCB;
}

table.type07 thead th {
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 30px;
   vertical-align: top;
   color: white;
}

table.type07 tbody th {
   width: 150px;
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 25px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
   background: #BFFFF1;
}

table.type07 td {
   width: 350px;
   padding: 10px;
   font-family: 'Russo One', 'Do Hyeon', sans-serif;
   font-size: 25px;
   vertical-align: top;
   border-bottom: 1px solid #ccc;
}

</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="/lib/w3.css">
</head>
<body>
	<%@include file="/WEB-INF/include/navigationBar.jsp" %>
	
	 <div id="wrapper1">
         <div id="wrapper">

            <div id="btn" style="padding-left : 400px; padding-top: 30px;">
               <button id="fac">시설 안내</button>
               <button id="cla">수업 안내</button>
               <button id="tra">강사 안내</button>
            </div>

            <!-- 시설안내 -->
            <div id="facility">
               <table>
               	<thead id="fthead">
                  <tr>
                     <td>시설</td>
                     <td>운영시간</td>
                     <td>휴관일</td>
                  </tr>
				 </thead>
				 
				 <tbody id="fbody">
                  <tr>
                     <td>강의실</td>
                     <td>09:00~18:00</td>
                     <td rowspan="3">일요일 및 법정 공휴일</td>
                  </tr>

                  <tr>
                     <td>헬스장</td>
                     <td>06:00~24:00</td>
                  </tr>

                  <tr>
                     <td>샤워실</td>
                     <td>06:00~24:00</td>
                  </tr>
                  </tbody>
               </table>
                  
                  
               <table>
               	  <thead id="sthead">
                  <tr>
                     <td>구분</td>
                     <td>시설명</td>
                     <td>용도</td>
                  </tr>
				 </thead>
				 
				 <tbody id="stbody">
                  <tr>
                     <td>필라테스 강의실</td>
                     <td>101호, 203호</td>
                     <td>케딜락 4대, 리포머 5대, 체어 6대, 바렐 8대 보유</td>
                  </tr>

                  <tr>
                     <td>스피닝 강의실</td>
                     <td>102호, 201호</td>
                     <td>최고급 사양 스핀바이크 20대 보유</td>
                  </tr>

                  <tr>
                     <td>핫요가 강의실</td>
                     <td>103호, 202호</td>
                     <td>-</td>
                  </tr>

                  <tr>
                     <td>에어로빅 강의실</td>
                     <td>104호, 204호</td>
                     <td>-</td>
                  </tr>

                  <tr>
                     <td>헬스장</td>
                     <td>105호, 205호</td>
                     <td>유산소 기구 총 20종, 웨이트기구 10종, 체성분 분석기 보유</td>
                  </tr>
                  </tbody>
               </table>

               <div id="main" style="margin: 150px;"> 
                  <img src="/img/health.jpg" alt="헬스장"
                     style="width: 750px; height: 500px;" /> 
                  <img src="/img/shower.jpg" alt="샤워실"
                     style="width: 750px; height: 500px;" />
               </div>
            </div>
      
   <!-- 수업안내 -->   
   <div class="w3-content" style="max-width: 800px; position: relative; margin: 0 auto;">

      <div class="w3-display-container mySlides">
         <h1>필라테스</h1>
         <img src="/img/pilates.jpg" alt="필라테스" style="width: 750px; height: 500px;" />
         <div id="w3-display-topright w3-large w3-container w3-padding-hor-16 w3-black">
            <p>필라테스는 몸의 유연성을 길러주는 요가와 근육을 부드럽게 풀어주는 스트레칭, 그리고 근육의 힘을 키우는 웨이트
               트레이닝의 장점만을 모아놓은 운동</p>
         </div>
      </div>

      <div class="w3-display-container mySlides">
         <h1>스피닝</h1>
         <img src="/img/spining.jpg" alt="스피닝" style="width: 750px; height: 500px;" />
         <div id="w3-display-topleft w3-large w3-container w3-padding-hor-16 w3-black">
            <p>스피닝(Spinning)은 페달을 밟아 바퀴를 돌리면서 하는 운동이라는 뜻의 자전거를 이용한 체력관리 시스템</p>
         </div>
      </div>

      <div class="w3-display-container mySlides">
         <h1>핫요가</h1>
         <img src="/img/classroom.jpg" alt="핫요가" style="width: 750px; height: 500px;" />
         <div id="w3-display-bottomright w3-large w3-container w3-padding-hor-16 w3-black">
            <p>요가 발생지인 인도의 환경을 그대로 옮겨 실내온도 38도씨의 전용스튜디오에서 진행하는 요가로, 뜨거운 환경에서
               근육이 잘 이완되기 때문에 몸의 유연성을 높이는데 효과적이며 부상을 방지</p>
         </div>
      </div>


      <div class="w3-display-container mySlides">
         <h1>에어로빅</h1>
         <img src="/img/aerobics.jpg" alt="에어로빅" style="width: 750px; height: 500px;" />
         <div id="w3-display-bottomleft w3-large w3-container w3-padding-hor-16 w3-black">
            <p>aerobics exercise의 준말로 일정 시간 동안 몸 안의 최대한 많은 양의 산소를 공급함으로 폐와
               심장 기능을 촉진시켜 신체의 건강을 증진시키는 유산소 운동</p>
         </div>
      </div>

      <a class="w3-btn-floating w3-hover-dark-grey" 
         style="position: absolute; top: 52%; left: 0; border: 1px solid black;" onclick="plusDivs(-1)">❮</a> 
      <a class="w3-btn-floating w3-hover-dark-grey"
         style="position: absolute; top: 52%; right: 0; border: 1px solid black;" onclick="plusDivs(1)" >❯</a>
   </div>
</div>
</div>
   <script>
      var slideIndex = 1;
      showDivs(slideIndex);

      function plusDivs(n) {
         showDivs(slideIndex += n);
      }

      function showDivs(n) {
         var i;
         var x = document.getElementsByClassName("mySlides");
         if (n > x.length) {
            slideIndex = 1
         }
         if (n < 1) {
            slideIndex = x.length
         }
         ;
         for (i = 0; i < x.length; i++) {
            x[i].style.display = "none";
         }
         x[slideIndex - 1].style.display = "block";
      }
   </script>
	
	<!-- 강사 안내 -->
	<div id="trainers">
	<c:forEach var="trainersVo" items="${trainersInfo}">
	<table class="type07" style="width:700px; float: left;">
		<thead>
			<tr>
				<th scope="cols">제목</th>
				<th scope="cols">내용</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">이름</th>
				<td>${trainersVo.tname}</td>
			</tr>
			<tr>
				<th scope="row">성별</th>
				<td>${trainersVo.tgender}</td>
			</tr>
			<tr>
				<th scope="row">나이</th>
				<td>${trainersVo.tage}</td>
			</tr>
			<tr>
				<th scope="row">경력</th>
				<td>${trainersVo.tcareer}</td>
			</tr>
			
			<tr>
				<th scope="row">자격증</th>
				<td>${trainersVo.tlicense}</td>			
			</tr>
			
	</table>
	</c:forEach>
	</div>
	
	
</body>
</html>
