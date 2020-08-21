<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>



<head>
<meta charset="UTF-8">
<title>03 프로젝트 자유게시판</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/noticewrite.css">
<link rel="stylesheet" href="/css/noticecontent.css">
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bnum같은 애들이 이 페이지로 넘어올때 숫자값으로 넘어옴 -->
<!-- 컨트롤 부분에서 활용할때 String -->
<!-- 
var goUnlike = function(){
	alert('싫어요!');
	document.getElementById("likeImg").src = "/img/notice_unlike.png";
}
-->



<script>
<!-- 본문 내용 ajax 시작 -->
var getContent = function()
{
	var idx = ${map.idx};
	$.ajax({
		url: '/Notice/getContent',
		dataType: 'json',
		data : {idx : idx },
		success : function(datas){
			console.log(datas);
			
			// 타이틀
			var strHTML_Title = '';	
			
			// 메뉴 와 타이틀 
			var strHTML_MT = '';
			
			// 본문 내용 
			var strHTML_Cont = datas[0].cont;
			
			strHTML_Title += '<table class = "writeTr">';
			strHTML_Title += '<tr>';
			strHTML_Title += '<td><h3 class="card-title" style = "font-size:30px;">게시글 보기</h3></td>';
			strHTML_Title += '<td>';
			strHTML_Title += '<h3 style = "font-size:20px;">작성자:'+ datas[0].mname +'</h3>';
			strHTML_Title += '<h3 style = "font-size:20px;">작성일: '+ datas[0].regdate +'</h3>';
			strHTML_Title += '</td> </tr> </table>';    
			
			$('#chDiv').html(strHTML_Title);
			
			strHTML_MT += '<input type="text" value ="'+ datas[0].menu_name +'" readonly/>';
			strHTML_MT += '<input type="text" value ="'+ datas[0].title +'" readonly/>'
			  
			$('#writeMT').html(strHTML_MT);
			
			
			$('#writeContent').html(strHTML_Cont);
			
		},
		error: function(){
			alert('err');
		}
	})
		
}
<!-- 본문 내용 ajax 끝 -->

<!-- 좋아요 ajax 시작 -->

var settingLike = function(){
	var idx = ${map.idx};
	var mid = '${login.mid}';
	
	$.ajax({
		url : '/Notice/settingLike',
		dataType : 'json',
		data : {idx : idx, mid : mid},
		success : function(datas){
			var islike = datas;
			if(islike == '')
				{
				   
				}
			else
				{
				 alert('있네');
				}
			

		},
		error : function(){
			alert("err");
		}
	})
}

var switchLike = function(){
	
}


</script>


<script>
$(document).ready(
		
		function(){
		
			getContent();
			
			settingLike();
			
		})



</script>



</head>
<body>

<%@include file="/WEB-INF/include/navigationBar.jsp" %>

   <div id="wrapper">
		<div id="wrapDiv">
			<div id="writeFormDiv">
				<div class="card card-success" >
				<!-- 타이틀 -->
					<div class="card-header" id ="chDiv" style="background-color:#07D88E; color:white;">
					
					</div>
				<!-- 타이틀 끝 -->
				
					
					
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
						<!-- 본문 내용 ajax 시작  -->
						<div class = "writeInfoDiv" id = "writeMT">
					     
						 </div>
						 
						 
						 <div class = "writeInfoDiv" id = "writeContent">
					     
					     </div>
						<!-- 본문 내용 ajax 끝  -->
						
						
						
						<!--  좋아요 ajax 시작 -->
						<div class="writeInfoDiv" id = "LikeDiv" >
							<button id = "LikeBtn" onclick="goUnlike()"> 	
							 <div id = "BtnDiv">
								<img id="likeImg" alt = "like" src = "/img/notice_unlike.png" />
							 </div>							 
							
							 <div id = "CountDiv">
							 	<span>1112</span>
							 </div>
							</button>								 
						</div>
						<!--  좋아요 ajax 끝 -->
						
						
						<!--  파일 ajax 시작 -->
					 <div class="writeInfoDiv" id = "writeButtons" >
						
						     <table id = "fileAndBtn" style = "width: 100%;">
						     	<tr>
						     		<td style="width: 50%; text-align:left;">
						     	 		다운로드 파일 : <a href = "/MBoard">파일1번</a>, <a href = "/MBoard">파일2번</a>, <a href = "/MBoard">파일3번</a>, <a href = "/MBoard">파일4번</a>
						     	 	</td>
						     	 	<td style="width: 50%; text-align:right">
						     	 		<a href=/NoticeWriteUpdateForm?idx=1><button class = writeBtn id = writeBtn1 ><span>수정하기</span></button></a>
						 		  	    <a href=/NoticeDelete?idx=1><button class = writeBtn id = writeBtn2 ><span>삭제하기</span></button></a>
						     	 	</td>	
						     	<tr>     
						     </table>
					</div>
					<!--  파일 ajax 끝 -->
					
								 
					</div>
					
				</div>

			</div>
		</div>
	</div>
   
 

</body>
</html>