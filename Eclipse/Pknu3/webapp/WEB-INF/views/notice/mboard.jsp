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


//부분 조회 - idx 순으로 나열 
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

			$('#select_kind').html(strHTML);
			
			
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


$(document).ready(
		
		function(){
			getFilter()
		}
		)
		
		
</script>


</head>
<body>

<!-- 상단 네비게이션  -->
	<<div id="all">
		   <!-- 상단 네비게이션  -->
   <div id="topNav">
      <div id="logo">
         <span>로고 위치</span>
      </div>
      <input id="selBtn" type="button" value="이용권 조회" onclick="" />
      <div id="barRight">
         <ul>
            <li>
               <a href="/LoginForm">
                  <img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
                  <div>${ login.mname }님</div>
               </a>
            </li>
            <li>
               <a href="/SignUpForm">
                  <img class="imgSet" width="35px" height="35px" alt="SignUp" src="/img/submit.png">
                  <div>회원가입</div>
               </a>
            </li>
         </ul>
      </div>
   </div>
   <!-- 왼쪽 네비게이션 -->
   <div id="leftNav">
      <ul>
      	 <li><a class="categorys" href="/"><img width="40px" height="40px" alt="HOME" src="/img/home.png"></a></li>
         <li><a class="categorys" href="/Schedule/ScheduleList"><img width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li> 
         <li><a class="categorys" href="/Subject/List"><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
         <li><a class="categorys" href="/MBoard"><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>



 <div id="wrapper">
		<div id="wrapMain">
			<div id = "mb_head">
				<div id = "mb_title"><h1>회원게시판</h1></div>
				<div id = "select_kind">
					
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