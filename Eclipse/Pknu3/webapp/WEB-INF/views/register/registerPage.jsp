
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수업 신청 페이지</title>
 <!-- Tell the browser to be responsive to screen width -->
  <meta name="viewport" content="width=device-width, initial-scale=1">


  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">

<link rel="stylesheet" href="/css/commons.css">
<style>
	.dupli {
		color:red;
		visibility: hidden;
	}
	
	#search > .form-group {
		display:inline-block;
	}
	#search  .form-control {
		display:inline-block;
	}
	.btn-block{
		display:inline-block;
	}
	
	#example {
		margin-bottom: 30px;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
   $(document).ready(
         //필터 ←  / 이름검색
         $(function(){
        	 
    	
    		  $('#example').DataTable({
    		      "paging": true,
    		      "lengthChange": false,
    		      "searching": false,
    		      "ordering": false,
    		      "info": true,
    		      "autoWidth": false,
    		      "responsive": true,
    		      "destroy" : true
    		    })
                
            var oCode = "${ oCode }";
            var oMsg  = "${ oMsg  }";
         
            
            if(oCode != '0' || oMsg != '0'){
               
               alert( '[' + oCode + ' : ' + oMsg  + ']' );
            }
            
            
            var grSelect = $("#grSelect").val();
            
            $("#grSelect").change(function(){
                  var changeGr = $("#grSelect").val();
                  alert(changeGr);
                  $.ajax({
                     
                     url    : '/Subject/ListByFilter',
                     data   : 'grId=' + changeGr,
                     type   : 'POST',
                     success : function(datas){
                        console.log(datas);
                        
                        var strHTML = '';
                        	  strHTML += '<thead>';
                          	  strHTML += '<tr>';
                              strHTML += '<th>종류</th>';
                              strHTML += '<th>수업명</th>';
                              strHTML += '<th>요일</th>';
                              strHTML += '<th>시간</th>';
                              strHTML += '<th>강의실</th>';
                              strHTML += '<th>강사명</th>';
                              strHTML += '<th>수업료</th>';
                              strHTML += '<th>신청</th>';
                              strHTML += '</tr>';
                              strHTML += '</thead>';
                              strHTML += '<tbody>';
                        
                        var old = '';
                        
                        
                           $.each(datas, function(index, subjectVo){
                              
                              
                              strHTML += '<tr>';
                              if( old != subjectVo.lId) {
	                                strHTML += '<td>' + subjectVo.grName + '</td>';
	                                strHTML += '<td>' + subjectVo.lName   + '</td>';
	                                strHTML += '<td>' + subjectVo.dDay   + '</td>';
	                                strHTML += '<td>' + subjectVo.dTime   + '</td>';
	                                strHTML += '<td>' + subjectVo.rName  + '</td>';
	                                strHTML += '<td>' + subjectVo.tName  + '</td>';
	                                strHTML += '<td>' + subjectVo.pCost  + '</td>';
	                                strHTML += '<td>';
	                                strHTML += '<a href="/Subject/Register?mId=' + subjectVo.mId  + '&lId="'+ subjectVo.lId + '" class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>';
	                                strHTML += '</td>';

                              }
                              else {
	                            	  strHTML += '<td class="dupli" >' + subjectVo.grName + '</td>';
	                                  strHTML += '<td class="dupli">' + subjectVo.lName   + '</td>';
	                                  strHTML += '<td >' + subjectVo.dDay   + '</td>';
                                      strHTML += '<td>' + subjectVo.dTime  + '</td>';
                                      strHTML += '<td class="dupli">' + subjectVo.rName  + '</td>';
  	                                  strHTML += '<td class="dupli">' + subjectVo.tName  + '</td>';
  	                                  strHTML += '<td class="dupli">' + subjectVo.pCost  + '</td>';
  	                                  strHTML += '<td class="dupli">';
	                                  strHTML += '<a href="/Subject/Register?mId=' + subjectVo.mId  + '&lId="'+ subjectVo.lId + '" class="insertBtn">신청</a>';
	                                  strHTML += '</td>';
                              }
                              
                              old = subjectVo.lId;
                              
                           }); //each
                     
                        strHTML += '</tbody>';
                           
                        $('#example').html(strHTML);
                                          	 	 
                  	 	 $('#example').DataTable({
               		      "paging": true,
               		      "lengthChange": false,
               		      "searching": false,
               		      "ordering": false,
               		      "info": true,
               		      "autoWidth": false,
               		      "responsive": true,
               		      "destroy":true
               		    })
                                                
                     }, //success
                     error   : function(){
                        
                        alert("grSelect Error");
                        
                     }                        
               });//ajax
            })//change func
            //필터 / 이름검색 ←  
            $('#searchBtn').click(
               function(){
                  var selectNum = $("#typeSelect").val();
                  var keyword     = $("#searchText").val();
                  alert(selectNum);
                  
                  $.ajax({
                           
                           url    : '/Subject/ListBySearch',
                           data   : 'inNum=' + selectNum + "&keyword=" + keyword ,
                           type   : 'POST',
                           success : function(datas){
                              console.log(datas);
                              
                              var strHTML = '';
                        	  strHTML += '<thead>';
                          	  strHTML += '<tr>';
                              strHTML += '<th>종류</th>';
                              strHTML += '<th>수업명</th>';
                              strHTML += '<th>요일</th>';
                              strHTML += '<th>시간</th>';
                              strHTML += '<th>강의실</th>';
                              strHTML += '<th>강사명</th>';
                              strHTML += '<th>수업료</th>';
                              strHTML += '<th>신청</th>';
                              strHTML += '</tr>';
                              strHTML += '</thead>';
                              strHTML += '<tbody>';
                        
	                        var old = '';
	                        
	                      
	                           $.each(datas, function(index, subjectVo){
	                              
	                              
	                              strHTML += '<tr>';
	                              if( old != subjectVo.lId) {
		                                strHTML += '<td>' + subjectVo.grName + '</td>';
		                                strHTML += '<td>' + subjectVo.lName   + '</td>';
		                                strHTML += '<td>' + subjectVo.dDay   + '</td>';
		                                strHTML += '<td>' + subjectVo.dTime   + '</td>';
		                                strHTML += '<td>' + subjectVo.rName  + '</td>';
		                                strHTML += '<td>' + subjectVo.tName  + '</td>';
		                                strHTML += '<td>' + subjectVo.pCost  + '</td>';
		                                strHTML += '<td>';
		                                strHTML += '<a href="/Subject/Register?mId=' + subjectVo.mId  + '&lId="'+ subjectVo.lId + '" class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>';
		                                strHTML += '</td>';
	
	                              }
	                              else {
		                            	  strHTML += '<td class="dupli" >' + subjectVo.grName + '</td>';
		                                  strHTML += '<td class="dupli">' + subjectVo.lName   + '</td>';
		                                  strHTML += '<td >' + subjectVo.dDay   + '</td>';
	                                      strHTML += '<td>' + subjectVo.dTime  + '</td>';
	                                      strHTML += '<td class="dupli">' + subjectVo.rName  + '</td>';
	  	                                  strHTML += '<td class="dupli">' + subjectVo.tName  + '</td>';
	  	                                  strHTML += '<td class="dupli">' + subjectVo.pCost  + '</td>';
	  	                                  strHTML += '<td class="dupli">';
		                                  strHTML += '<a href="/Subject/Register?mId=' + subjectVo.mId  + '&lId="'+ subjectVo.lId + '" class="insertBtn">신청</a>';
		                                  strHTML += '</td>';
	                              }
	                              
	                              old = subjectVo.lId;
	                              
	                           }); //each
	                           
	                        strHTML += '</tbody>';
	                           
	                        $('#example').html(strHTML);
	                                          	 	 
	                  	 	 $('#example').DataTable({
	               		      "paging": true,
	               		      "lengthChange": false,
	               		      "searching": false,
	               		      "ordering": false,
	               		      "info": true,
	               		      "autoWidth": false,
	               		      "responsive": true,
	               		      "destroy":true
	               		    })
	                                                      
                           }, //success
                           error   : function(){
                              
                              alert("grSelect Error");
                              
                           }                        
                     });//ajax

               }
               
            );
            
         })//function
      );//ready
   
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
            <li>
               <a href="/LoginForm">
                  <img class="imgSet" width="35px" height="35px" alt="Login" src="/img/login.png">
                  <div>로그인</div>
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
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Schedule" src="/img/calendar.png"></a></li> 
         <li><a class="categorys" href="/Subject/List"><img width="40px" height="40px" alt="Class register" src="/img/registration.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Product List" src="/img/gym.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Statistics" src="/img/result.png"></a></li>
         <li><a class="categorys" href=""><img width="40px" height="40px" alt="Board" src="/img/meeting.png"></a></li>
         <!-- 스케줄 / 수업신청 / 상품  / 통계  / 자유게시판 순 -->
      </ul>
   </div>
   <div id="wrapper">
     
        <div class="container-fluid">
  		 <div class="row">
          <div class="col-12">
                 <div class="card">
              <div class="card-header">
              	 <div id="searchWrap">
			         <div class="form-group">
			            <select id="grSelect" class="form-control" style="width:100px;">
			               <option  value="">선택</option>
			               <!-- 그룹명 - GRNAME -->
			               <c:forEach var="grpVo" items="${ groupList }">
			                  <option value="${ grpVo.grId }" >${ grpVo.grName }</option>
			               </c:forEach>
			            </select>
			         </div>
			         <!-- 여기 상품 목록이 출력 될 것임 -->
			         <div id="search">
				         <div class="form-group">
				            <select id="typeSelect" class="form-control" style="width:100px;">
				               <option value="0">선택</option>
				               <option value="1">수업명</option>
				               <option value="2">강사명</option>
				            </select>
				          </div>
			            <input type="text" id="searchText"  class="form-control"  style="width:250px;"/>
			            <input type="submit" id="searchBtn" class="btn btn-block btn-default" value="검색"  style="width:100px;"/>
			         </div>
			      </div>
              </div>
              <!-- /.card-header -->
				  <div class="card-body">
					<table id="example" class="table table-bordered table-striped">
					<thead>
					  <tr>
			            <th>종류</th>
			            <th>수업명</th>
			            <th>요일</th>
			            <th>시간</th>
			            <th>강의실</th>
			            <th>강사명</th>
			            <th>수업료</th>
			            <th>신청</th>
			         </tr>
			         </thead>
			         <tbody>

			         <!-- 아래에 리스트 ROW 반복 -->
			         <c:set   var="old"   value=" " />
			         <c:forEach   var="subjectVo" items="${ subjectList }">
			         <tr>
			         <c:choose>
			            <c:when test="${ old ne subjectVo.lId }">
			               <td>${ subjectVo.grName }</td>
			               <td >${ subjectVo.lName  }</td>
			               <td>${ subjectVo.dDay   }</td>
			               <td>${ subjectVo.dTime   }</td>
			               <td >${ subjectVo.rName  }</td>
			               <td >${ subjectVo.tName  }</td>
			               <td >${ subjectVo.pCost  }</td>
			               <td>
			                  <a href="/Subject/Register?mId=${ subjectVo.mId }&lId=${ subjectVo.lId }"  class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>
			               </td>
			            </c:when>
			            <c:otherwise>
			               <td  class="dupli">${ subjectVo.grName }</td>
			               <td  class="dupli">${ subjectVo.lName  }</td>
			               <td  >${ subjectVo.dDay   }</td>
			               <td  >${ subjectVo.dTime   }</td>
			               <td  class="dupli">${ subjectVo.rName  }</td>
			               <td  class="dupli">${ subjectVo.tName  }</td>
			               <td  class="dupli">${ subjectVo.pCost  }</td>
			               <td  class="dupli">
			                  <a href="/Subject/Register?mId=${ subjectVo.mId }&lId=${ subjectVo.lId }"  class="insertBtn" style="border:none">신청</a>
			               </td>
			            </c:otherwise>
			         </c:choose>   
			         </tr>
			            <c:set   var="old"   value="${ subjectVo.lId }" />   
			         </c:forEach>
			         </tbody>
			      </table>

				  </div>
				  <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          </div>
          </div>
          </div>
<!-- jQuery -->
<script src="/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables -->
<script src="/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<!-- AdminLTE App -->
<script src="/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/dist/js/demo.js"></script>
<!-- page script -->

</body>
</html>