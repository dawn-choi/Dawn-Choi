<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html>
<head>
	<title>Doughnut Chart</title>
	<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script
   src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.js"></script>
<script src="../js/utils.js"></script>
	<style>
	canvas {
		-moz-user-select: none;
		-webkit-user-select: none;
		-ms-user-select: none;
	}
	</style>
</head>

<body>
	<div id="canvas-holder" style="width:40%">
		<canvas id="TrnChart"></canvas>
	</div>
	<script>
	$(document).ready (
		      function() {

		    	  $.ajax({
		              url : '/Statistics/TrnList'
		            , success : function(datas) {
		               
		               var labelList = [];
		               var trnList   = [];
		               
		               $.each(datas, function(index, item) {
		            	   labelList.push(item.tname);
		            	   trnList.push(item.trncnt);
		               });
		               
		               var config = new Chart($('#TrnChart'), {
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
		    				title: {
		    					display: true,
		    					text: '강사선호도'
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

	</script>
</body>

</html>
