<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>03 프로젝트 자유게시판</title>



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

$(document).ready(
		
		function(){
			getFilter();
			
			$('#title').keyup(function(){
				if($(this).val().length > 50){
					alert("제목의 최대 길이는 50자입니다.")
					$(this).val($(this).val().substring(0, 50));
				}
			});

			});
			
			
function formCheck(){
	
	var title = document.forms[0].title.value;
	var cont = document.forms[0].cont.value;
	
	if(title == null || title == ""){
		alert("제목을 입력하세요.")
		return false;
	}
	
	if(cont == null || cont == ""){
		alert("본문을 작성해주세요.")
		return false;
	}
	
}

</script>

<script type = "text/javascript">
        window.parent.CKEDITOR.tools.callFunction('${CKEditorFuncNum}','${filePath}', '업로드완료');   
        
</script>


</head>
<body>

	<%@include file="/WEB-INF/include/navigationBar.jsp" %>

	<div id="wrapper">
		<div id="wrapDiv">
			<div id="writeFormDiv">
				<div class="card card-success" >
					<div class="card-header" style="background-color:#07D88E; color:white;">
						<h3 class="card-title" style = "font-size:30px;">게시글 작성</h3>
					</div>
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
					<!-- form 테그 시작 -->
						 <form action ="/Write" method = "post" id = "writeform" enctype="multipart/form-data" onsubmit="return formCheck();">
						 					 
						 <div id = "select_kind"></div>
						 
						 <input type = "text" id="title" name="title"  placeholder = "제목을 입력하세요." size = 50 maxlength=50/>
					
						
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
						 <input type="file" name="upfile1" />	
						 <input type="file" name="upfile2" />		 
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
