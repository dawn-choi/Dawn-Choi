<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>차트</title>
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
</style>
</head>
<body>
<body>
	<div id="canvas-holder" style="width: 40%">
		<div class="chartjs-size-monitor">
			<div class="chartjs-size-monitor-expand">
				<div class=""></div>
			</div>
			<div class="chartjs-size-monitor-shrink">
				<div class=""></div>
			</div>
		</div>
		<canvas id="chart-area"
			style="display: block; width: 519px; height: 259px;" width="519"
			height="259" class="chartjs-render-monitor"></canvas>
	</div>
	<input type="button" id="statisticsBtn" value="차트 보기" size="10" />
	<script>
		$(document).ready(function (){
			$('#statisticsBtn').click(
					function(){
						alert("statisticsBtn");
						
						 $.ajax({
					         url      : '/Statistics/StatisticsList',
					           data   : '',
					           type   : 'POST',
					           success : function(datas){
					              console.log(datas);
					              
					              var chartLabels =	[];
					              var chartData	  = [];
					              
					              $.each(datas, function(index, statisticsVo){
					            	  chartLabels.push(statisticsVo.tname);
					                  chartData.push(statisticsVo.imp);
					                  
					                  console.log(chartLabels);
					                  console.log(chartData);
					               });
					              
					      		var randomScalingFactor = function() {
					    			return Math.round(Math.random() * 100);
					    		};

					    		var config = {
					    			type: 'doughnut',
					    			data: {
					    				datasets: [{
					    					data: [
					    						30,
					    						20,
					    						10,
					    						20,
					    						20,
					    					],
					    					backgroundColor: [
					    						window.chartColors.red,
					    						window.chartColors.orange,
					    						window.chartColors.yellow,
					    						window.chartColors.green,
					    						window.chartColors.blue,
					    					],
					    					label: 'Dataset 1'
					    				}],
					    				labels: [
					    					'유아름',
					    					'김수현',
					    					'김두환',
					    					'고유빈',
					    					'정진석'
					    						]			
					    			},
					    			options: {
					    				responsive: true,
					    				legend: {
					    					position: 'top',
					    				},
					    				title: {
					    					display: true,
					    					text: '강사 선호도'
					    				},
					    				animation: {
					    					animateScale: true,
					    					animateRotate: true
					    				}
					    			}
					    		};

					    		window.onload = function() {
					    			var ctx = document.getElementById('chart-area').getContext('2d');
					    			window.myDoughnut = new Chart(ctx, config);
					    		};

					    		var colorNames = Object.keys(window.chartColors);
							},
							 error: function(){
					              alert("차트 데이터 불러오기 실패");
					        }
					});
			  });
		});		


	</script>

</body>

</html>