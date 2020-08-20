<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html><head>
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
@keyframes chartjs-render-animation{from{opacity:.99}to{opacity:1}}.chartjs-render-monitor{animation:chartjs-render-animation 1ms}.chartjs-size-monitor,.chartjs-size-monitor-expand,.chartjs-size-monitor-shrink{position:absolute;direction:ltr;left:0;top:0;right:0;bottom:0;overflow:hidden;pointer-events:none;visibility:hidden;z-index:-1}.chartjs-size-monitor-expand>div{position:absolute;width:1000000px;height:1000000px;left:0;top:0}.chartjs-size-monitor-shrink>div{position:absolute;width:200%;height:200%;left:0;top:0}</style></head>

<body>
	<div id="container" style="width: 75%;"><div class="chartjs-size-monitor"><div class="chartjs-size-monitor-expand"><div class=""></div></div><div class="chartjs-size-monitor-shrink"><div class=""></div></div></div>
		<canvas id="ageChart" style="display: block; width: 1000px; height: 500px;" width="1000" height="500" class="chartjs-render-monitor"></canvas>
	</div>
	<script>
   $(document).ready(function() {
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
                        title : {
                           text   : '상품별 수강 연령대',
                           fontSize: 20
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
         });

         function ListCheck ( list, value ) {
            return list.includes(value);
         }
         
   </script>


</body></html>