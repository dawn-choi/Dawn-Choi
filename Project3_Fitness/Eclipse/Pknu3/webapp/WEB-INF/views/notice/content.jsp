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
			
			<!--타이틀-->
			var strHTML_Title = '';	
			
			<!--메뉴 와 타이틀-->
			var strHTML_MT = '';
			
			<!--본문 내용--> 
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
			console.log(datas);
			var islike = datas;
			if(islike == '')
				{
				  $('#likeImg').attr('src', '/img/notice_unlike2.png');  
				  $('#inputLike').attr('value', 'no');
				}
			else
				{
				  $('#likeImg').attr('src', '/img/notice_like2.png');
				  $('#inputLike').attr('value', 'yes');
				}		
		},
		error : function(){
			alert("err");
		}
	})
	
	showLike(idx);
}

<!-- 좋아요 버튼 누르면 이미지 재업로드, 처리 -->
var switchLike = function(){
	var idx = ${map.idx};
	var mid = '${login.mid}';
	<!-- 좋아요 할거야 -->
	if($('#inputLike').val() == 'no')
		{
			$.ajax({
				url : '/Notice/switchLike',
				data : {idx : idx, mid : mid},
				success : function(){
					settingLike();
				},
				err : function(){
					alert('switchLike 에러');
				}
			})
		}
	else
		{
		$.ajax({
			url : '/Notice/switchUnLike',
			data : {idx : idx, mid : mid},
			success : function(){
				settingLike();
			},
			err : function(){
				alert('switchUnLike 에러');
			}
		})
		}
}

<!-- 해당 개시물에 대한 최신 좋아요 정보 표시 -->
var showLike = function(idx){
	
	$.ajax({
		url : '/Notice/showLike',
		dataType : 'text',
		data : {idx : idx},
		success: function(data){
			$('#CountSpan').text(data);
		},
		err : function(){
			alert('showLike err');
		}
	})
}


<!-- 등록했던 파일 가져오기 -->
var fileLoad = function(){
	var idx = ${map.idx};
	$.ajax({
		url : '/Notice/fileLoad',
		dataType : 'json',
		data : {idx : idx},
		success : function(datas){
			var strHTML = '';
			var isfiles = datas;
			
			if(isfiles == '')
			{
				strHTML += '<table id = "fileAndBtn" style = "width: 100%;">';
				strHTML += '<tr id = thistr>';
				strHTML	+= '<td style="width: 50%; text-align:left;">';
				strHTML	+= '다운로드 파일 : '
				strHTML += '<b style = "color : red;"> 첨부된 파일이 없습니다.</b>'
				strHTML	+= '</td>';
				strHTML	+= '</tr>';    
				strHTML	+= '</table>';
			}
			
			else
			{
				strHTML += '<table id = "fileAndBtn" style = "width: 100%;">';
				strHTML += '<tr id = thistr>';
				strHTML	+= '<td style="width: 50%; text-align:left;">';
				strHTML	+= '다운로드 파일 : '
					$.each(datas, function(index, item){
						var reindex = index + 1;
						strHTML	+=	'<a href = /download/external/' + item.filename + '>'+ ' ' + reindex + '.' +item.filename + '</a>';
							
						});
				strHTML	+= '</td>';	
				strHTML	+= '</tr>';    
				strHTML	+= '</table>';
				
			}
			
			$('#writeButtons').html(strHTML);
			
			showBtns();
		},
		error : function(){
			alert("fileLoad Error");
		}
	})
}

<!-- 현재 로그인한 id와 해당 개시글의 mid를 비교하여 버튼 출력 -->
var showBtns = function(){
	var idx = ${map.idx};
	$.ajax({
		url : '/Notice/showBtns',
		dataType : 'text',
		data : {idx : idx},
		success : function(data){
			var strHTML = '';
			if(data == '${login.mid}')
			{
			
			strHTML	+= '<td style="width: 50%; text-align:right">';
			strHTML	+= '<a href=/NoticeWriteUpdateForm?idx='+ ${map.idx} +'><button class = writeBtn id = writeBtn1 ><span>수정하기</span></button></a>';
			strHTML	+= ' <a href=/NoticeDelete?idx='+ ${map.idx} +'><button class = writeBtn id = writeBtn2 ><span>삭제하기</span></button></a>';
			strHTML	+= '</td>';	
			
			}
			$('#thistr').append(strHTML);
			
			
		},
		error : function(){
			alert("showBtnsERR");
		}
		
		
	});
}

</script>


<script>
$(document).ready(
		
		function(){
			var logininfo =  "${login.mname}";
		  	
		 
			getContent();
			
			settingLike();
			
			fileLoad();
			
			
			
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
							<button id = "LikeBtn" onclick="switchLike()"> 	
							 <div id = "BtnDiv">
								<img id="likeImg" alt = "like" src = "" />
								<input type = "hidden" value="" id = "inputLike"/>
							 </div>							 
							
							 <div id = "CountDiv">
							 	<span id = "CountSpan"></span>
							 </div>
							</button>								 
						</div>
						<!--  좋아요 ajax 끝 -->
						
						
						<!--  파일 ajax 시작 -->
					 <div class="writeInfoDiv" id = "writeButtons" >

					</div>
					<!--  파일 ajax 끝 -->
					
								 
					</div>
					
				</div>

			</div>
		</div>
	</div>
   
 

</body>
</html>