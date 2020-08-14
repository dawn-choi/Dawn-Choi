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
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.min.js"></script>


<script src="/css/sidebar-accordion.js"></script>
<link rel="stylesheet" href="/css/sidedemo.css">
<link rel="stylesheet" href="/css/sidebar-accordion.css">

<style>

 table {
  border-spacing: 1px;
  table-layout: fixed; 
}
#tablesort{
  margin : 0 auto;
  table-layout: fixed;
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
  max-width:60%;
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

article {
  float: left;
  display :inline-block;
  max-width:40%;
}
</style>

<script>
    $(document).ready(function() {
    	// $("#tablesort").tablesorter();

    	/*
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
	    */
	    
	  
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
		    //event.stopPropagation();
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
	  // 0.모든종류 1.개인운동 2. 그룹수업 3 높은가격 4 낮은가격
	  /*
	   function selonechg(selObj){
		   var leng = $('td').length;
		   // 0 ~ 124 -> datarow
		   if(selObj == 0){
			     for( var i = 10; i < leng; i+=11 ) {
			     var tddata = $("td").eq(i).html().substring(5);
		        	  //console.log(tddata);
			        
			        	$("tbody tr").show();
			        }
			     }   
			        
		   
		   
		   if(selObj == 1){
		     for( var i = 10; i < leng; i+=11 ) {
		     var tddata = $("td").eq(i).html().substring(5);
		     var num0 = parseInt(4*(i/11))-3;
	        	  console.log(num0);
		        
		        if(tddata != "1"  &&  tddata !="제한없음"){
		        	$("tbody tr").eq(num0).hide();
		        }
		        else{
		        	$("tbody tr").eq(num0).show();
		        }
		     }   
		        
		   }
		   
		   
		   if(selObj == 2){
			     for( var i = 10; i < leng; i+=11 ) {
			     var tddata = $("td").eq(i).html().substring(5);
			     var num0 = parseInt(4*(i/11))-3;
		        	  //console.log(tddata);
			        
			        if(tddata != "1" && tddata != "제한없음" ){
			        	$("tbody tr").eq(num0).show();
			          
			        }
			        else{
			        	$("tbody tr").eq(num0).hide();
			        }
			     }   
			        
			   }
	   }
	   */
       /* 
       function seltwochg(selObj){
       
         var leng   = $('td').length;
		   if(selObj == 3){
			   
		     for( var i =4; i < leng; i+=11 ) {
			     var num0 = parseInt(4*(i/11))-1;
			     var rows = $("tbody tr").rows;
			     
		    	 var tddata  = parseInt($("td").eq(i).html());
		    	 var tddata2 = parseInt($("td").eq(i+11).html());
		    	 
		    	 var tr = $("tbody tr").eq(num0);
	    	     //console.log(num0);
	    	     //console.log(tr.next());
		    	 //console.log(rows);
		    	 console.log(tddata);
		    	 console.log(tddata2);
		    	 if (tddata > tddata2){
		    		 tr.next().next().next().next().insertBefore(tr); 
		    		 tr.next().next().next().next().next().insertBefore(tr); 
		    		 tr.next().next().next().next().next().next().insertBefore(tr); 
		    		 tr.next().next().next().next().next().next().next().insertBefore(tr); 
		    		 //tr.next().next().next().before($("tbody tr").eq(num0+4));
		    	 }
		    	 else{
		    		 console.log("else"); 
		    	
		    	 }
	         }
		   }  
	   }  */
	  
	
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
	
	<div id="leftSide">
    </div>	
		  
  <article>
	<div class="contenedor-menu">
		<!-- <a href="" class="btnMenu">Menu <i class="fa fa-bars"></i></a> -->

		<ul class="menu">
			<li><a href="#">전체</a></li>
			<li><a href="#">시설이용 <i class="fa fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">헬스</a></li>
				</ul>
			</li>
			<li><a href="#">1:1 수업 <i class="fa fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">PT</a></li>
				</ul>
			</li>
			<li><a href="#">그룹수업 <i class="fa fa-chevron-down"></i></a>
				<ul>
					<li><a href="#">스피닝</a></li>
					<li><a href="#">에어로빅</a></li>
					<li><a href="#">필라테스</a></li>
					<li><a href="#">헬스</a></li>
				</ul>
			</li>
		</ul>
	</div>
  
  
  </article>
 
	 

	
	<div id="mainbody">
		<div id="seldiv">
		<form action="/TableSelect" method="POST">
				<select id="selone" name="selone" onchange="selonechg(this.value)">
					<option value="1">개인운동</option>
					<option value="2">그룹수업</option>
				</select> 
				<select id="seltwo" name="seltwo" onchange="seltwochg(this.value)">
					<option value="DESC">높은가격순</option>
					<option value="ASC">낮은가격순</option>
				</select>
				<input type="button" value="전체상품조회" onClick="location.href='/Table'">
				<input type="submit" value="검색"/> 
        </form>
		</div>
		<table id="tablesort" class="tablesorter" style="width: 720px;" >
		    <thead>
			<tr class="firsttr">
				<th width="80"  height="21" style="word-break:break-all">상품번호</th>
				<th width="180" height="21" style="word-break:break-all">회원권</th>
				<th width="210" height="21" style="word-break:break-all">회원권명</th>
				<th width="150" height="21" style="word-break:break-all">사용기한/세션</th>
				<th width="90"  height="21" style="word-break:break-all">가격</th>
			</tr>
			</thead>
			<tbody class="tbodys">
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
			<tbody>
		</table>
		</div>
	</div>
</body>
</html>