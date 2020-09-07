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


<style>
.deletefileBtn{
	
}

</style>

<script>
var getFilter = function() {
    var selectIdx = ${map.idx};
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
			
			<!--본문 내용--> 
			var strHTML_Cont = datas[0].cont;
			
			strHTML_Title += '<table class = "writeTr">';
			strHTML_Title += '<tr>';
			strHTML_Title += '<td><h3 class="card-title" style = "font-size:30px;">게시글 수정</h3></td>';
			strHTML_Title += '<td>';
			strHTML_Title += '<h3 style = "font-size:20px;">작성자:'+ datas[0].mname +'</h3>';
			strHTML_Title += '<h3 style = "font-size:20px;">작성일: '+ datas[0].regdate +'</h3>';
			strHTML_Title += '</td> </tr> </table>';    
			
			$('#chDiv').html(strHTML_Title);
			
			$('#title').attr('value', datas[0].title);

			$('#cont').html(strHTML_Cont);
			
			$('select option[value='+ datas[0].menu_id +']').attr('selected', true);
			
		},
		error: function(){
			alert('err');
		}
	})
};


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
				strHTML	+= '<br>첨부된 파일 : '
				strHTML += '<b style = "color : red;"> 첨부된 파일이 없습니다.</b>'
				strHTML	+= '</td>';
				strHTML	+= '<td style="width: 50%; text-align:left;">';
				strHTML	+= '<br> 추가할 파일 <br>'
				strHTML += '<input type="file" name="upfile" />';
				strHTML += '<input type="file" name="upfile1" />';
				strHTML += '<input type="file" name="upfile2" />';
				strHTML	+= '</td>';
				strHTML	+= '</tr>';    
				strHTML	+= '</table>';
			}
			
			else
			{
				strHTML += '<table id = "fileAndBtn" style = "width: 100%;">';
				strHTML += '<tr id = thistr>';
				strHTML	+= '<td style="width: 50%; text-align:left;">';
				strHTML	+= '<br> 첨부된 파일 <br> '
					$.each(datas, function(index, item){
						var reindex = index + 1;
						strHTML	+=	'<p style = "color : blue;">'+ reindex +'.'+ ' ' + item.filename + ' '
						            + '<button class = deletefileBtn type = button onclick=deletefile('+ item.file_num +')>첨부 삭제</button>' +'</p>';
						});
				strHTML	+= '</td>';
				strHTML	+= '<td style="width: 50%; text-align:left;">';
				strHTML	+= '<br> 추가할 파일 <br>'
				strHTML += '<input type=file name=upfile />';
				strHTML += '<input type=file name=upfile1 />';
				strHTML += '<input type=file name=upfile2 />';
				strHTML	+= '</td>';
				strHTML	+= '</tr>';    
				strHTML	+= '</table>';
				
			}
			
			$('#writefiles').html(strHTML);
		},
		error : function(){
			alert("fileLoad Error");
		}
	})
}

<!-- 첨부파일 삭제 버튼 이벤트 -->
function deletefile(filenum){
	
	$.ajax({
		url: '/Notice/FileDelete',
		data : {filenum : filenum},
		success : function(){
			fileLoad();
		},
		error : function(){
			alert("FileDelete Error");
		}
	});
	
}



$(document).ready(
		
		function(){
			getFilter();
			
			getContent();
			
			fileLoad();
			
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
};

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
					<div class="card-header"  id ="chDiv" style="background-color:#07D88E; color:white;">
						
					</div>
					<div class="card-body" id = "writeBody"  style = "height: 88%;">
					<!-- form 테그 시작 -->
						 <form action ="/WriteUpdate" method = "post" id = "writeform" enctype="multipart/form-data" onsubmit="return formCheck();">
						 					 
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

						<!--  파일 ajax 시작 -->
					 <div class="writeInfoDiv" id = "writefiles" >

					</div>
						 
						 <div class="writeInfoDiv" id = "writeOkDiv" >
						 <table>
						 	<tr class = "writeTr">
						 		<td><input type = "submit"  id = "writeOk" value="수정" />
						        </td>
						 	</tr>
						 </table>
						 </div>
						 
						 <input type = "hidden" name = "idx" value = "${map.idx}"/>
						 				 	
						 </form>
					<!-- form 테그 끝 -->	 
					</div>
					
				</div>

			</div>
		</div>
	</div>

	

</body>
</html>
