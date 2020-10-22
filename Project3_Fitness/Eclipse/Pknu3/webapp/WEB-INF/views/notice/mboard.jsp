<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>03 프로젝트 자유게시판</title>

<!-- Theme style -->
<link rel="stylesheet" href="../../dist/css/adminlte.min.css">
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/css/mboard.css">



<script
  src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>

// 전체 조회 - idx 순으로 나열 
var getListAll = function(kindValue){
       $.ajax({
                url :'/NoticeList',
                dataType: 'json',
                data : {menu_id : kindValue} ,
                success : function(datas) {
                 var strHTML = '<table width = 1450 cellpadding = 0 cellspacing =0 id = userboard>';
				 strHTML += '<tr class = headtr>';
				 strHTML +=	'<td>번호</td>';
				 strHTML += '<td>제목</td>';
				 strHTML += '<td>작성자</td>';
				 strHTML += '<td>날짜</td>';
				 strHTML += '<td>조회수</td>';
				 strHTML += '</tr>';
                $.each( datas,function(index, item)
               {
               	 strHTML += '<tr class = MainUL>';
               	 strHTML +=	'<td><h1 style = color:#07D88E>'+ item.idx +'</h1></td>';
               	 strHTML +=	'<td class = itemtd >';			
               	 strHTML +=	'<div class = textdiv>';
               	 strHTML += '<a href=/GoContent?idx='+ item.idx +'>';
              	 strHTML +=	 item.title;
              	 strHTML +=	'</a>';
               	 strHTML +=	'</div>';
               	 strHTML +=	'<div class = imgdiv>';
               	 strHTML +=	'<img alt=Schedule  src= '+ item.sumnail + '  width = 80 height = 80 />';
               	 strHTML +=	'</div>';
               	 strHTML +=	'</td>';
               	 strHTML += '<td>'+ item.mname     +'</td>';
               	 strHTML += '<td>'+ item.regdate   +'</td>';
               	 strHTML += '<td>'+ item.readcount + '</td>';
               	 strHTML += '</tr>'
               }
                        
                );
                strHTML += '</table>'; 
                strHTML += '<table width = 1450 cellpadding = 0 cellspacing =0 id = writeButton>';
                strHTML += '<tr class = write_TR>';
                strHTML += '<td></td>';
                strHTML += '<td></td>';
                strHTML += '<td></td>';
                strHTML += '<td></td>';
                strHTML += '<td><a href=/NoticeWriteForm?mid=${ login.mid }&bnum=0&lvl=0&step=0&nref=0><button id = writeBtn ><span>새글쓰기</span></button></a></td>';
                strHTML += '</tr>';
                $('#mb_tableDiv').html(strHTML);
                
                },
                error: function(){
                        alert('err');
                }
       });
};


//부분 조회 - bnum 순으로 나열 
var getListKind = function(kindValue){

       $.ajax({
                url :'/NoticeList',
                dataType: 'json',
                data : {menu_id : kindValue} ,
                success : function(datas) {
                
                 var strHTML = '<table width = 1450 cellpadding = 0 cellspacing =0 id = userboard>';
				 strHTML += '<tr class = headtr>';
				 strHTML +=	'<td>번호</td>';
				 strHTML += '<td>제목</td>';
				 strHTML += '<td>작성자</td>';
				 strHTML += '<td>날짜</td>';
				 strHTML += '<td>조회수</td>';
				 strHTML += '</tr>';
                    
                $.each( datas,function(index, item)
               
               {
               	 strHTML += '<tr class = MainUL>';              
               	 strHTML +=	'<td><h1 style = color:#07D88E>'+ item.bnum +'</h1></td>';             	 
               	 strHTML +=	'<td class = itemtd >';			
               	 strHTML +=	'<div class = textdiv>';
               	 strHTML += '<a href=/GoContent?idx='+ item.idx +'>';
               	 strHTML +=	 item.title;
               	 strHTML +=	'</a>';
               	 strHTML +=	'</div>';
               	 strHTML +=	'<div class = imgdiv>';
               	 strHTML +=	'<img alt=Schedule  src= '+ item.sumnail + '  width = 80 height = 80 />';
               	 strHTML +=	'</div>';
               	 strHTML +=	'</td>';
               	 strHTML += '<td>'+ item.mname     +'</td>';
               	 strHTML += '<td>'+ item.regdate   +'</td>';
               	 strHTML += '<td>'+ item.readcount + '</td>';
               	 strHTML += '</tr>'
               }
                        
                );
                strHTML += '</table>'; 
                strHTML += '<table width = 1450 cellpadding = 0 cellspacing =0 id = writeButton>';
                strHTML += '<tr class = write_TR>';
                strHTML += '<td><a href=/NoticeWriteForm?mid=${ login.mid }&bnum=0&lvl=0&step=0&nref=0><button id = writeBtn ><span>새글쓰기</span></button></a></td>';
                strHTML += '</tr>';
                $('#mb_tableDiv').html(strHTML);
                
                },
                error: function(){
                        alert('err');
                }
       });
};


var getFilter = function() {
	$.ajax({
		url : '/FilterList',
		dataType : 'json',
		success : function(datas) {
			
			var strHTML = '<select name = kind id = kind class=form-control >';
			strHTML += '<option value = all > 전체 </option>';
			$.each( datas,function(index, item)
			{
				strHTML += '<option value =' + item.menu_id +  '>';
				strHTML += item.menu_name + '</option>';
			});
			
			strHTML += '</select>';

			$('#select_kind').append(strHTML);
			
			
			getListAll('all');
			
			$('#kind').change(function(){
				if($('#kind').val() != 'all')
					{
					getListKind($('#kind').val());
					}
				else{
					getListAll('all');
				}
			});
		},
		error: function(datas){
			console.log(datas);
            alert("strerr");
        }
		
	})
	
};


var searchContent = function () {
	var ss1 = $("#st").val();
	var ss2 = $("#searchKeyword").val();
	
	$.ajax({
		url: '/SearchNoticeList',
		dataType: 'json',
		data: {searchType : ss1, searchKeyword : ss2},
		success : function(datas){
			var strHTML = '<table width = 1450 cellpadding = 0 cellspacing =0 id = userboard>';
			 strHTML += '<tr class = headtr>';
			 strHTML +=	'<td>번호</td>';
			 strHTML += '<td>제목</td>';
			 strHTML += '<td>작성자</td>';
			 strHTML += '<td>날짜</td>';
			 strHTML += '<td>조회수</td>';
			 strHTML += '</tr>';
               
           $.each( datas,function(index, item)
          
          {
          	 strHTML += '<tr class = MainUL>';              
          	 strHTML +=	'<td><h1 style = color:#07D88E>'+ item.idx +'</h1></td>';             	 
          	 strHTML +=	'<td class = itemtd >';			
          	 strHTML +=	'<div class = textdiv>';
          	 strHTML += '<a href=/GoContent?idx='+ item.idx +'>';
          	 strHTML +=	 item.title;
          	 strHTML +=	'</a>';
          	 strHTML +=	'</div>';
          	 strHTML +=	'<div class = imgdiv>';
          	 strHTML +=	'<img alt=Schedule  src= '+ item.sumnail + '  width = 80 height = 80 />';
          	 strHTML +=	'</div>';
          	 strHTML +=	'</td>';
          	 strHTML += '<td>'+ item.mname     +'</td>';
          	 strHTML += '<td>'+ item.regdate   +'</td>';
          	 strHTML += '<td>'+ item.readcount + '</td>';
          	 strHTML += '</tr>'
          }
                   
           );
           
           strHTML += '</table>'; 
           strHTML += '<table width = 1450 cellpadding = 0 cellspacing =0 id = writeButton>';
           strHTML += '<tr class = write_TR>';
           strHTML += '<td><a href=/NoticeWriteForm?mid=${ login.mid }&bnum=0&lvl=0&step=0&nref=0><button id = writeBtn ><span>새글쓰기</span></button></a></td>';
           strHTML += '</tr>';

			
           
           $('#mb_tableDiv').html(strHTML);
		},
		error : function(){
			alert(searchContentFail);
		}
	})
	
}

$(document).ready(
		
		function(){
			getFilter();
			
			var logininfo =  "${login.mname}";
		  	
		    if(logininfo!=""){
		    	$("div[name=barRight1]").hide();
		    }
		    
		    else{
		    	$("div[name=barRight2]").hide();
		    }
		}
		)
		
		
</script>


</head>
<body>

<%@include file="/WEB-INF/include/navigationBar.jsp" %>


 <div id="wrapper">
		<div id="wrapMain">
			<div id = "mb_head">
				<div id = "mb_title"><h1>회원게시판</h1></div>
				<div id = "select_kind">
					<select name = "searchType" id = "st"  class=form-control >
						<option value = searchTitle> 제목 </option>
						<option value = searchCont>  내용 </option>
						<option value = searchWriter> 작성자 </option>
					</select> 
						<input type = "text" id = "searchKeyword"  placeholder = "찾을 키워드를 입력하세요."  class = "form-control"/>
						<button id = writeBtn  onclick = "searchContent()"><span>게시글 찾기</span></button></td>
					
				</div>
			</div>
			
			<div id = "mb_tableWrap">
				<div id = "mb_tableDiv">
					<!-- 테이블 -->			
				</div>
			</div>

	    </div>
</div>


</body>
</html>