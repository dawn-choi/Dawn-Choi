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
		<canvas id="genChart"
			style="display: block; width: 1000px; height: 500px;" width="1000"
			height="500" class="chartjs-render-monitor"></canvas>
	</div>
	<script>
$(document).ready(function() {
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
                  title : {
                     display : true,
                     text   : '성별에 따른 인기 상품'
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
   });

   function ListCheck ( list, value ) {
      return list.includes(value);
   }
</script>

</body>
</html>