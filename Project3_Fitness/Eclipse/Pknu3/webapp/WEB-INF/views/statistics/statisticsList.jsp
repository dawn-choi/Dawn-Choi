<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>차트 리스트</title>
<link rel="stylesheet" href="/css/commons.css">
<link
   href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
   rel="stylesheet">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="../js/utils.js"></script>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<style>
	canvas {
			-moz-user-select: none;
			-webkit-user-select: none;
			-ms-user-select: none;
		  }
		  
    #gen{
	    	margin-left : 100px;
	    	float : left;
    	}
    	
   #trn{
	   		margin-right : 100px;
	   		float : right;
   		} 	
   			
 	#age{
 	    	margin  : 100px auto;
 	    	clear   : both;
 	    	padding : 30px;
 	    }
 	
 	h2{
 	  	
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
	$(document).ready (
		      function() {
		    	  
		    	  $.ajax({
		               url : '/Statistics/AgeBarList',
		               type : 'POST',
		               success : function(datas) {

		                     var labelList     = [];
		                     var ageList       = [];
		                     var dataList      = [ [], [], [], [], [], [], []];

		                  $.each ( datas , function(index, item) {
		                        
		                     var isLabel     = ListCheck(labelList, item.pname);
		                     var isAge       = ListCheck(ageList,   item.str);
		                     
		                     if ( !isLabel ) labelList.push(item.pname);
		                     if ( !isAge)     ageList.push(item.str);
		                     
		                     for(var i=0; i < ageList.length; i++){
		                        if ( item.str == ageList[i]) {
		                     dataList[i].push(item.agecnt);
		                  }
		                     }
		                  
		                  });
		                  
		                  var color = Chart.helpers.color;
		                  
		                  var chartData = {
		                     labels : labelList,
		                     datasets : [{
		                        label: ageList[0],
		                        backgroundColor : color(window.chartColors.red).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.red,
		                        borderWidth : 1,
		                        data : dataList[0]
		                     },
		                     {
		                        label: ageList[1],
		                        backgroundColor : color(window.chartColors.orange).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.orange,
		                        borderWidth : 1,
		                        data : dataList[1]
		                     },
		                {
		                        label: ageList[2],
		                        backgroundColor : color(window.chartColors.yellow).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.yellow,
		                        borderWidth : 1,
		                        data : dataList[2]
		                     },
		                {
		                        label: ageList[3],
		                        backgroundColor : color(window.chartColors.green).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.green,
		                        borderWidth : 1,
		                        data : dataList[3]
		                     },
		                {
		                        label: ageList[4],
		                        backgroundColor : color(window.chartColors.blue).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.blue,
		                        borderWidth : 1,
		                        data : dataList[4]
		                     },
		                {
		                        label: ageList[5],
		                        backgroundColor : color(window.chartColors.purple).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.purple,
		                        borderWidth : 1,
		                        data : dataList[5]
		                     },
		                {
		                        label: ageList[6],
		                        backgroundColor : color(window.chartColors.grey).alpha(0.5).rgbString(),
		                        borderColor : window.chartColors.grey,
		                        borderWidth : 1,
		                        data : dataList[6]
		                     }
		                     ]
		                  
		                  };
		                  
		                  var barChart = new Chart($('#ageChart'), {
		                     type: 'bar',
		                     data: chartData,
		                     options : {
		                        responsive    : true,
		                        legend      : {
		                           position : 'top'
		                        },
		                        scales : {
		                           yAxes : [{
		                              display: true,
		                              ticks : {
		                                 beginAtZero : true,
		                                 stepSize : 1     
		                              }
		                           }]
		                        }
		                     }               
		                  });
		                  
		                  var colorNames = Object.keys(window.chartColors);
					         console.log(labelList);
					         console.log(ageList);
					         console.log(dataList);

		                  },
		               error : function() {
		                  alert("차트 데이터 불러오기 실패");
		               }
		            });
		    	  
		    	   $.ajax({
		    	         url : '/Statistics/GenList',
		    	         type : 'POST',
		    	         success : function(datas) {

		    	               var labelList     = [];
		    	               var genderList    = [];
		    	               var dataList1     = [];
		    	               var dataList2     = [];

		    	            $.each ( datas , function(index, item) {
		    	                  
		    	               var isLabel     = ListCheck(labelList, item.pname);
		    	               var isGender    = ListCheck(genderList, item.mgender);
		    	               
		    	               if ( !isLabel ) labelList.push(item.pname);
		    	               if ( !isGender) genderList.push(item.mgender);
		    	               
		    	               if ( item.mgender == genderList[0]) {
		    	                  dataList1.push(item.gencnt);
		    	               } else {
		    	                  dataList2.push(item.gencnt);
		    	               }
		    					
		    	            });
		    	            
		    	            var color = Chart.helpers.color;
		    	            
		    	            var chartData = {
		    	               labels : labelList,
		    	               datasets : [{
		    	                  label: genderList[0],
		    	                  backgroundColor : color(window.chartColors.red).alpha(0.5).rgbString(),
		    	                  borderColor : window.chartColors.red,
		    	                  borderWidth : 1,
		    	                  data : dataList1
		    	               },
		    	               {
		    	                  label: genderList[1],
		    	                  backgroundColor : color(window.chartColors.blue).alpha(0.5).rgbString(),
		    	                  borderColor : window.chartColors.blue,
		    	                  borderWidth : 1,
		    	                  data : dataList2
		    	               }
		    	               ]
		    	            
		    	            };
		    	            
		    	            var barChart = new Chart($('#genChart'), {
		    	               type: 'bar',
		    	               data: chartData,
		    	               options : {
		    	                  responsive    : true,
		    	                  legend      : {
		    	                     position : 'top'
		    	                  },
		    	                  scales : {
		    	                	  yAxes : [{
		    	                		  display: true,
		    	                		  ticks : {
		    	                			  beginAtZero : true,
		    	                			  stepSize : 1     
		    	                		  }
		    	                	  }]
		    	                  }
		    	               }               
		    	            });
		    	            
		    	            var colorNames = Object.keys(window.chartColors);
		    	               
		    	        	console.log(genderList[0]);
		    	       		console.log(dataList1);
		    	       		console.log(genderList[1]);
		    	       		console.log(dataList2);
		    	            
		    	            },
		    	         error : function() {
		    	            alert("차트 데이터 불러오기 실패");
		    	         }
		    	      });	  
		     
		
		    	  $.ajax({
		              url : '/Statistics/TrnList'
		            , success : function(datas) {
		               
		               var labelList = [];
		               var trnList   = [];
		               
		               $.each(datas, function(index, item) {
		            	   labelList.push(item.tname);
		            	   trnList.push(item.trncnt);
		               });
		               
		               var config = new Chart($('#trnChart'), {
		                  type: 'doughnut',
		                  data: {
		                     labels:labelList,
		                     datasets: [{
		                        data: trnList,
		                        backgroundColor: [
		                           window.chartColors.yellow,
		                           window.chartColors.red,
		                           window.chartColors.orange,
		                           window.chartColors.green,
		                           window.chartColors.blue,
		                        ],
		                     }],
		                  },
		                  
		      			options: {
		    				responsive: true,
		    				legend: {
		    					position: 'top',
		    				},
		    				animation: {
		    					animateScale: true,
		    					animateRotate: true
		    				}
		    			}
		                  
		               });
		            }
		            , error : function() {
		               alert("ERROR");
		            }
		         });
		         
		         
		      }      
		   );

		var colorNames = Object.keys(window.chartColors);
		
		   function ListCheck ( list, value ) {
	            return list.includes(value);
	         }
	</script>

</head>
<body>
      <%@include file="/WEB-INF/include/navigationBar.jsp" %>
      
      <div id = "wrapper">
		  <!-- 성별 -->
		  <div id="gen" style="width:40%">
			<h2>성별에 따른 인기 상품</h2>
			<canvas id="genChart"></canvas>
		  </div>
		  
		  <!-- 강사 선호도 -->
		  <div id="trn" style="width:40%">
		  	<h2>강사선호도</h2>
			<canvas id="trnChart"></canvas>
		  </div>
		  
	      <!-- 연령대 -->
	      <div id="age" style="width:50%">
		  	<h2>상품별 수강 연령대</h2>
			<canvas id="ageChart"></canvas>
		  </div>
	  </div>
</body>
</html>