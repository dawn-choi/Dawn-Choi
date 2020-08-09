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
table {
  border-spacing: 1px;
  table-layout: fixed;
}
#tablesort{
  margin : 0 auto;
}

#leftmenu{
  width : 300px;
  height : 740px;
  background-color : black;
  float:left;
}
#seldiv{
  
}


#selone {
  margin-left : 25%;
  margin-bottom : 20px;
}

#selone {
}

#mainbody{
  width : 1000px;
  float: left;
}

.bdetail {
	width: 720px;
	display: none; 
}

.detailleft {
	width: 50%;
	display: none;
}

.detailright {
	width: 50%;
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
.datarow { outline : 1px solid gray; }
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
	  
	  
	  function trClick(trObj) {
		    var i = trObj.rowIndex;
	    	//alert(trObj.rowIndex);   // +3 개의 row show
	    	//alert(i);   // +3 개의 row show
	    	
	    	if($("tr").eq(i+1).css('display') == 'none'){
	    	for (var n = 1; n <= 3; n++) {
   		      $("tr").eq(i+n).children().show(); 
	    	  $("tr").eq(i+n).show();   // tr클릭시 다음 3개로우 show()
			  }
	    	}
	    	
	    	else {
		    	for (var n = 1; n <= 3; n++) {
	   		      $("tr").eq(i+n).children().hide(); 
		    	  $("tr").eq(i+n).hide();   // tr클릭시 다음 3개로우 hide()
				}
	    	}
	    	
            //$("tr").eq(i+2).show();   
	    	//$("tr").eq(i+3).show();   
	    	
    		//$("tr").eq(i+2).children().show(); 
     		//$("tr").eq(i+3).children().show(); 
		}
	  
	  // select box 
	  // 1.개인운동 2. 그룹수업 3 높은가격 4 낮은가격
	   function selonechg(selObj){
		   alert(selObj);
		   
		   var leng = $('td').length;
		   alert(leng);
		   if(selObj == 1){
		     for( var i = 10; i < leng; i+=11 ) {
			 console.log($("td").eq(i).html());	   
		     }   
		   }
		   
	   }
	   
	  
       function seltwochg(selObj){
    	   alert(selObj);
	   }
	  
	
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
	</div>.
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
	
	<div id="leftmenu">
	
    </div>	
	
	<div id="mainbody">
		<div id="seldiv">
				<select id="selone" onchange="selonechg(this.value)">
					<option value="">종류별</option>
					<option value="1">개인운동</option>
					<option value="2">그룹수업</option>
				</select> 
				<select id="seltwo" onchange="seltwochg(this.value)">
					<option value="">가격별</option>
					<option value="3">높은가격순</option>
					<option value="4">낮은가격순</option>
				</select>

		</div>
		<table id="tablesort" style="width: 720px; height: 300px">
			<tr class="firsttr">
				<th width="60">번호</th>
				<th width="200">회원권</th>
				<th width="210">회원권명</th>
				<th width="150" >사용기한/세션</th>
				<th width="90" >가격</th>
			</tr>

			<c:forEach var="bdata" items="${spBoardList}" varStatus="status">
				<tr class="datarow" onclick="javascript:trClick(this)" >
					<td class="${status.count}" >${status.count}</td>
					<td class="${status.count}" >${bdata.pname}</td>
					<td class="${status.count}" >${bdata.category}</td>
					<td class="${status.count}" >${bdata.cname}</td>
					<td class="${status.count}" >${bdata.pcost}</td>
				  </tr>
				  
					 <tr class="bdetail">
						<td class="detailleft" colspan="2"  >회원권명 : ${bdata.category}</td>
						<td class="detailright" colspan="2" >사용기간 : ${bdata.cname}</td>
					</tr>
					<tr class="bdetail">
						<td class="detailleft" colspan="2" >가격 : ${bdata.pcost}</td>
						<td class="detailright" colspan="2" >수업요일 : ${bdata.dday} </td>
					</tr>
					<tr class="bdetail">
						<td class="detailleft" colspan="2" >수업시간 : ${bdata.dtime}</td>
						<td class="detailright" colspan="2" >정원 : ${bdata.ptot}</td>
					</tr>
			</c:forEach>
		</table>
		</div>
	</div>
</body>
</html>