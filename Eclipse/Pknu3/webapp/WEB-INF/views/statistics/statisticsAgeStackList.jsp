<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html>
<head>
	<title>차트</title>
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
	<div style="width: 50%"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
		<canvas id="canvas" style="display: block; width: 836px; height: 418px;" width="836" height="418" class="chartjs-render-monitor"></canvas>
	</div>
	<button id="randomizeData">Randomize Data</button>
	<script>
		var barChartData = {
			labels: ['10대 이하', '20대', '30대', '40대', '50대', '60대 이하'],
			datasets: [{
				label: '필라테스',
				backgroundColor: window.chartColors.red,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: '스피닝',
				backgroundColor: window.chartColors.blue,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}, {
				label: '핫요가',
				backgroundColor: window.chartColors.green,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			},
			{
				label: '에어로빅',
				backgroundColor: window.chartColors.purple,
				data: [
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor(),
					randomScalingFactor()
				]
			}]

		};
		window.onload = function() {
			var ctx = document.getElementById('canvas').getContext('2d');
			window.myBar = new Chart(ctx, {
				type: 'bar',
				data: barChartData,
				options: {
					title: {
						display: true,
						text: '연령대 별 인기있는 상품'
					},
					tooltips: {
						mode: 'index',
						intersect: false
					},
					responsive: true,
					scales: {
						xAxes: [{
							stacked: true,
						}],
						yAxes: [{
							stacked: true
						}]
					}
				}
			});
		};

		document.getElementById('randomizeData').addEventListener('click', function() {
			barChartData.datasets.forEach(function(dataset) {
				dataset.data = dataset.data.map(function() {
					return randomScalingFactor();
				});
			});
			window.myBar.update();
		});
	</script>

</body>

</html>