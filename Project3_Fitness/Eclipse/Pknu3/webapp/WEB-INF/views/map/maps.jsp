<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03 프로젝트 메인</title>
<link rel="stylesheet" href="/css/commons.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<style>
	* {
		font-family: 'Russo One', 'Do Hyeon', sans-serif !important;
	}

	#mapWrap{
		padding-top: 20px;
		
	}
	#map {
		margin:10px auto;
	}	
	#infoWrap{
		width:90%;
		height:100%;
		margin:20px auto;
		
	}
	
	#searchLocation{
		width:400px;
		margin:0 auto;
		text-align: center;
	}
	#locationText{
		width:400px;
		font-size : 20px;
		text-align: center;
	}
	
	#title {
		font-size: 30px;
		text-align: center;
		margin:10px 0px;
	}
	
	.gm-style-mtc > div {
		width:70px;
	}
	
	.gm-style-mtc div > span {
		display: inline-block;
		margin-bottom: 10.5px;
	}
	.gm-style-mtc div > label {
		margin-bottom:0 !important;
	}
	
	table {
		font-size : 18px;
	}
	
	#infoTable1 {
		width:100%;
		text-align: center;
		border:1px solid #07D88E;
		border-collapse: collapse;
		height: 100px;
		margin-bottom: 30px;
	}
	
	#infoTable1 > thead {
		background-color: #07D88E;
		font-size: 20px;
	}
	
	#infoTable2 > thead {
		background-color: #07D88E;
		font-size: 20px;
	}
	
	#infoTable2 > tbody  td {
		height: 55px;
		border-bottom: 2px dotted #07D88E;
	}
	
	#infoTable1 > thead > tr {
		height: 40px;
	}
	
	#infoTable2 > thead > tr {
		height: 40px;
	}
	
	#infoTable2 {
		width:100%;
		text-align: center;
		border:1px solid #07D88E;
		border-collapse: collapse;
		height: 100px;
		margin-bottom: 30px;
	}
	
</style>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script src="https://apis.google.com/js/api.js" type="text/javascript"></script>


<script>
$(document).ready(function() {
    var logininfo =  "${login.mname}";
  	
    if(logininfo!=""){
    	$("div[name=barRight1]").hide();
    }
    
    else{
    	$("div[name=barRight2]").hide();
    }
    
    
});

function getRoute(){ 
		var origin =  $('#locationText').val();
		
		 if(origin == ''){
		    	$('#locationText').focus();
		    	return;
		    	
	    }else {
	    	
	    	$.ajax({
	    		  url: '/getDirection',
	    		  data : { departure 	: $('#locationText').val(),
	        			 	arrival	: '35.115415, 129.0887707'},
	    		  type: 'GET',
	    		  datatype: 'json',
	    		  success: function(data) {
	    		    
	    		    var obj = JSON.parse(data);
	    		    console.log(obj);
	    		    
	    		    var routeInfo = obj.routes[0].legs[0];
	    		    
	    		    var strHTML = '<table id="infoTable1">';
 					strHTML += '<thead>';
 					strHTML += '<tr>';
 					strHTML += '<th>출발지</th>';
 	 				strHTML += '<th>도착지</th>';
 	 				strHTML += '<th>출발 시간</th>';
 	 				strHTML += '<th>도착 시간</th>';
 					strHTML += '<th>총 소요 시간</th>';
 					strHTML += '<th>총 거리</th>';
					strHTML += '</tr>';
 					strHTML += '</thead>';
    		    	strHTML += '<tr>';
					strHTML += '<td>'+ routeInfo.start_address +'</td>';
					strHTML += '<td>'+ routeInfo.end_address +'</td>';
					strHTML += '<td>'+ routeInfo.departure_time.text +'</td>';
					strHTML += '<td>'+ routeInfo.arrival_time.text +'</td>';
					strHTML += '<td>'+ routeInfo.duration.text +'</td>';
					strHTML += '<td>'+ routeInfo.distance.text +'</td>';
    		    	strHTML += '</tr>';
    		    	strHTML += '</table>'; 
    		    	
    		    	strHTML += '<table id="infoTable2">';
    		    	strHTML += '<thead>';
 					strHTML += '<tr>';
 					strHTML += '<th>번호</th>';
 	 				strHTML += '<th>경로</th>';
 	 				strHTML += '<th>수단</th>';
 	 				strHTML += '<th>승차</th>';
 	 				strHTML += '<th>하차</th>';
 	 				strHTML += '<th>소요시간</th>';
 	 				strHTML += '<th>거리</th>';
					strHTML += '</tr>';
 					strHTML += '</thead>';
 					strHTML += '<tbody>';
 					
 					var steps = routeInfo.steps;
 					
 					var i = 1;
 					$.each(steps, function(index, item){
						strHTML += '<tr>';
 						strHTML += '<td>'+ (index + 1) +'</td>';
 						strHTML += '<td>'+ item.html_instructions +'</td>';
 						console.log(item.travel_mode);
 						
 						if( item.travel_mode != 'TRANSIT'){
	 						strHTML += '<td></td>';
	 						strHTML += '<td></td>';
	 						strHTML += '<td></td>';
	 						strHTML += '<td>'+ item.duration.text +'</td>';
	 						strHTML += '<td>'+ item.distance.text +'</td>';
 						} else {
 							var shortName = item.transit_details.line.short_name;
 							
 							if(typeof shortName == 'undefined' || shortName == null || shortName == ""){
 								
 								shortName = ' ';
 							}
 							
 							strHTML += '<td>'+ item.transit_details.line.name 
 									+ ' ' + shortName +'</td>';
	 						strHTML += '<td>'+ item.transit_details.departure_stop.name + '<br/>[ ' + item.transit_details.departure_time.text  +' ]</td>';
	 						strHTML += '<td>'+ item.transit_details.arrival_stop.name + '<br/>[ ' + item.transit_details.arrival_time.text  +' ]</td>';
	 						strHTML += '<td>'+ item.duration.text +'</td>';
	 						strHTML += '<td>'+ item.distance.text 
	 								+ ' <br/>[ ' + item.transit_details.num_stops +' 정거장/역 ]</td>';
 						}
 						strHTML += '</tr>';
	 				
 					});
 					strHTML += '</tbody>';
    		    	strHTML += '</table>'; 
	    		    
	    		    $('#info').html(strHTML);
	    		    
	    		  }
	    		});
	    	
	       
	    }
		 calcRoute();

}



function myTicket(){
	var logininfo =  "${login.mname}";
	var url= "/myTicket?mid=${login.mid}"
	var name = "이용권조회"
	var option = "width =700, height=800, top = 100 , left = 200, location= no"
	if(logininfo!= ""){
	window.open(url,name,option);}
	else{alert("로그인이 필요합니다");}
}
</script>
</head>
<body>

	<%@include file="/WEB-INF/include/navigationBar.jsp" %>

	<!-- 메인 -->
	<div id="wrapper">
		<div id="mapWrap">
			<div id="map" style="width:75%; height:460px">
			<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBs1sXeUkv-P4HYB3LE7ED-8L3qdGaKwuQ&callback=initMap" ></script>
			<script>
				var directionsService = null;
				var directionsRenderer = null;
			
				function initMap(){
					
				directionsService = new google.maps.DirectionsService();
				directionsRenderer = new google.maps.DirectionsRenderer();
				
				var location = { lat : 35.115415 , lng : 129.0887707 };
				var map = new google.maps.Map(document.getElementById('map'), {
						center : location,
						zoom   : 17
					});
				
				var marker = new google.maps.Marker({position: location, title:"P#3 Fitness"});
				
				if (marker) {
                    marker.addListener('click', function() {
                        
                        //중심 위치를 클릭된 마커의 위치로 변경
                        map.setCenter(this.getPosition());
 
                        //마커 클릭 시의 줌 변화
                        map.setZoom(17);
                    });
                }
				marker.setMap(map);
				directionsRenderer.setMap(map);
				
				}
				
				function calcRoute() {
					
					  var start = $('#locationText').val();
					  var end = { lat : 35.115415 , lng : 129.0887707 };
					  if(start == ''){
					    	$('#locationText').focus();
					    	return;
					  }else {
						  var request = {
						    origin: start,
						    destination: end,
						    travelMode: 'TRANSIT'
						  };
						  directionsService.route(request, function(result, status) {
						    if (status == 'OK') {
						      var map = directionsRenderer.getMap();
						      directionsRenderer.setDirections(result);
						      
						      map.setZoom(10);
						      
						    }
						  });
					  }
					}
				
				
			</script>
			</div>
			<div id="infoWrap">
			 	<div id="searchLocation">
			 		<input type="text" placeholder="출발 위치를 입력해주세요"  class="form-control" id="locationText" onkeypress="if( event.keyCode==13 ){ getRoute()}; "/>
			 	</div>
			 	<div id="infoRoute" >
				 	<div id="title">찾아오시는 길</div>
			 		<div id="info">
				 		
			 		</div>
			 	</div>
			</div>
		</div>
	</div>
</body>
</html>