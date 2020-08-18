<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
<title>Bar Chart</title>
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
<style type="text/css">/* Chart.js */
@
keyframes chartjs-render-animation {
	from {opacity: .99
}

to {
	opacity: 1
}

}
.chartjs-render-monitor {
	animation: chartjs-render-animation 1ms
}

.chartjs-size-monitor, .chartjs-size-monitor-expand,
	.chartjs-size-monitor-shrink {
	position: absolute;
	direction: ltr;
	left: 0;
	top: 0;
	right: 0;
	bottom: 0;
	overflow: hidden;
	pointer-events: none;
	visibility: hidden;
	z-index: -1
}

.chartjs-size-monitor-expand>div {
	position: absolute;
	width: 1000000px;
	height: 1000000px;
	left: 0;
	top: 0
}

.chartjs-size-monitor-shrink>div {
	position: absolute;
	width: 200%;
	height: 200%;
	left: 0;
	top: 0
}
</style>
</head>

<body>
	<div id="container" style="width: 75%;">
		<div class="chartjs-size-monitor">
			<div class="chartjs-size-monitor-expand">
				<div class=""></div>
			</div>
			<div class="chartjs-size-monitor-shrink">
				<div class=""></div>
			</div>
		</div>
		<canvas id="canvas"
			style="display: block; width: 1000px; height: 500px;" width="1000"
			height="500" class="chartjs-render-monitor"></canvas>
	</div>
	<script>
		$(document).ready(function() {

			$.ajax({
				url : '/Statistics/StatisticsGenList',
				data : '',
				type : 'POST',
				success : function(datas) {
					alert("ajax 성공");
					var chartLabels = [];
					var chartData = [];
					
					$.each(datas, function(index, statisticsVo) {
						chartLabels.push(statisticsVo.mgender);

						console.log(chartLabels);
					});
					
				},
				error : function() {
					alert("차트 데이터 불러오기 실패");
				}
			});

		});

	
		var color = Chart.helpers.color;
		var barChartData = {
			labels : [ '필라테스', '스피닝', '핫요가', '에어로빅' ],
			datasets : [
					{
						label : '남성',
						backgroundColor : color(window.chartColors.red).alpha(
								0.5).rgbString(),
						borderColor : window.chartColors.red,
						borderWidth : 1,
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					},
					{
						label : '여성',
						backgroundColor : color(window.chartColors.blue).alpha(
								0.5).rgbString(),
						borderColor : window.chartColors.blue,
						borderWidth : 1,
						data : [ randomScalingFactor(), randomScalingFactor(),
								randomScalingFactor(), randomScalingFactor() ]
					} ]

		};

		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type : 'bar',
				data : barChartData,
				options : {
					responsive : true,
					legend : {
						position : 'top',
					},
					title : {
						display : true,
						text : 'Chart.js Bar Chart'
					}
				}
			});

		};

		var colorNames = Object.keys(window.chartColors);
	</script>

</body>
</html>