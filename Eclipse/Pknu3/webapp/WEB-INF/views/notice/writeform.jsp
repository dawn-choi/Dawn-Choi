<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/noticewrite.css">

<link
	href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap"
	rel="stylesheet">


<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">

<!--  
<script type="text/javascript" src="/smarteditor2/js/HuskyEZCreator.js" charset="utf-8"></script>
-->
 <!--  
<script src="https://cdn.ckeditor.com/4.10.1/standard/ckeditor.js"></script>
-->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- bnum같은 애들이 이 페이지로 넘어올때 숫자값으로 넘어옴 -->
<!-- 컨트롤 부분에서 활용할때 String -->
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<script type="text/javascript" src="/ckeditor/ckeditor.js"></script>

<script>
var getFilter = function() {
	$.ajax({
		url : '/FilterList',
		dataType : 'json',
		success : function(datas) {
			
			var strHTML = '<select name = menu_id id = kind class=form-control  >';
			
			$.each( datas,function(index, item)
			{
				strHTML += '<option value =' + item.menu_id +  '>';
				strHTML += item.menu_name + '</option>';
			});
			
			strHTML += '</select>';

			$('#select_kind').html(strHTML);
			
		},
		error: function(datas){
			console.log(datas);
            alert("strerr");
        }
		
	})
	
};

/*
//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
var submitContents = function() {
	 // 에디터의 내용이 textarea에 적용된다.
	 oEditors.getById["cont"].exec("UPDATE_CONTENTS_FIELD", []);

	 // 에디터의 내용에 대한 값 검증은 이곳에서
	 // document.getElementById("ir1").value를 이용해서 처리한다.
	 
	 $('#writeform').submit(function(){
			
			submitContents();
		    
		});
	 
	 var oEditors = [];

	    nhn.husky.EZCreator.createInIFrame({
	      oAppRef : oEditors,
	      elPlaceHolder : "cont",
	      sSkinURI : "/smarteditor2/SmartEditor2Skin.html",
	      fCreator : "createSEditor2",
	      htParams : {
	            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseToolbar : true,             
	            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseVerticalResizer : false,     
	            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
	            bUseModeChanger : true
	        }

	     });

}
*/


$(document).ready(
		
		function(){
			getFilter();

			});

</script>

<script type = "text/javascript">
        window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${filePath}', '업로드완료');   
        
</script>


</head>
<body>

	<!-- 상단 네비게이션  -->
	<div id="topNav">
		<div id="logo">
			<span>로고 위치</span>
		</div>
		<input id="selBtn" type="button" value="이용권 조회" onclick="" />
		<div id="barRight">
			<ul>
				<li><a href="/LoginForm"> <img class="imgSet" width="35px"
						height="35px" alt="Login" src="/img/login.png">
						<div>로그인</div>
				</a></li>
				<li><a href="/SignUpForm"> <img class="imgSet" width="35px"
						height="35px" alt="SignUp" src="/img/submit.png">
						<div>회원가입</div>
				</a></li>
			</ul>
		</div>
	</div>
	<!-- 왼쪽 네비게이션 -->
	<div id="leftNav">
		<div id="toHome">
			<a href="/"><img width="40px" height="40px" alt="HOME"
				src="/img/home.png"></a>
		</div>
		<ul>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Schedule" src="/img/calendar.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Class register" src="/img/registration.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Product List" src="/img/gym.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Statistics" src="/img/result.png"></a></li>
			<li><a class="category" href=""><img width="40px"
					height="40px" alt="Board" src="/img/meeting.png"></a></li>
			<!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
		</ul>
	</div>

	<div id="wrapper">
		<div id="wrapDiv">
			<div id="writeFormDiv">
				<div class="card card-success" >
					<div class="card-header" style="background-color:#07D88E; color:white;">
						<h3 class="card-title" style = "font-size:30px;">게시글 작성</h3>
					</div>
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
					<!-- form 테그 시작 -->
						 <form action ="/Write" method = "post" id = "writeform" enctype="multipart/form-data">
						 <div id = "select_kind"></div>
						 
						 <div class="writeInfoDiv" ><input type = "text" name="title" placeholder = "제목을 입력하세요."/></div>
					
						
						 <!-- 본문 에디터 -->
						  <!-- Ckeditor4 에디터 불러오기 크기 조절 최대치 설정 실패... 하...-->
					    <div class = "writeInfoDiv">
					    
					    <textarea id = "cont" name = "cont"
					    style = "width:100%;"></textarea>
					    
					    <script type="text/javascript">
						$(function(){
							CKEDITOR.replace('cont',{
								filebrowserUploadUrl: '/imageUpload.do'
							});
						});
						</script>
					    </div>
						
						
						 <div class="writeInfoDiv">
						 <input type="file" name="upfile" />		 
						 </div>
						 
						 <div class="writeInfoDiv" id = "writeOkDiv" >
						 <table>
						 	<tr class = "writeTr">
						 		<td><input type = "submit"  id = "writeOk" value="작성" />
						        </td>
						 	</tr>
						 </table>
						 </div>
						 
						 
						 
						 <!-- 숨겨진 정보 -->
						 <input type="hidden" name = "mid" value = "<c:out value= '${map.mid}'/>"/>
						 <input type="hidden" name="bnum" value="<c:out value='${ map.bnum}' />" />
   						 <input type="hidden" name="lvl" value="<c:out value='${ map.lvl}' />" />
   						 <input type="hidden" name="step" value="<c:out value='${ map.step}' />" />
   						 <input type="hidden" name="nref" value="<c:out value='${ map.nref}' />" />	
   						 <input type="text" name="sumnail" value="${filePath}" />	
   						 <div id = "sumnailDiv"></div>		 
   						 	
						 </form>
					<!-- form 테그 끝 -->	 
					</div>
					
				</div>

			</div>
		</div>
	</div>

	

</body>
</html>
