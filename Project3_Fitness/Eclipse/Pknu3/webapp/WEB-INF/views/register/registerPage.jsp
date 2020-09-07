
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
  <link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">


  <!-- Ionicons -->
  <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/dist/css/adminlte.min.css">

<link rel="stylesheet" href="/css/commons.css">
<style>
   * {
      font-family: 'Russo One', 'Do Hyeon', sans-serif;
      font-size: 24px;
   }
   
   table {
      font-size: 20px;
   }

   .dupli {
      /*
      visibility: hidden;
      */
   }
   
   .dupli > span{
      visibility : hidden;
   }
   
   #searchText {
      height:54px;
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
   
   #example> thead th {
      font-size:26px;
      height:50px;
      line-height: 50px;
   }
   
   #exampleThead th:nth-of-type(1){ width:170px; }
   #exampleThead th:nth-of-type(2){ width:135px; }
   #exampleThead th:nth-of-type(3){ width:90px; }
   #exampleThead th:nth-of-type(4){ width:170px; }
   #exampleThead th:nth-of-type(5){ width:150px; }
   #exampleThead th:nth-of-type(6){ width:140px; }
   #exampleThead th:nth-of-type(7){ width:220px; }
   #exampleThead th:nth-of-type(8){ width:145px; }

   
   #example > tbody > tr {
      border-bottom: 1px solid red;
   }
   
   #msgWrap{
      float:right;
   }
   
   #msgGet {
      display: inline-block;
      font-size: 30px;
   }
   
   #logoMsg {
      font-size : 35px;
   }
   
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<script>
   $(document).ready(
         //필터 ←  / 이름검색
         $(function(){
            
        	 var logininfo =  "${login.mname}";
 		  	
	 		    if(logininfo!=""){
	 		    	$("#barRight1").hide();
	 		    }
	 		    else{
	 		    	$("#barRight2").hide();
	 		    }
       
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
            var pId   = "${ pId   }";
            
            if( oCode != 'Success' && oCode != ' ') {
               
               var url       = "/Subject/ticketPage?oMsg=${ oMsg }&pId=${ pId }&oCode=${oCode}";
               var name    = "이용권 충전 안내";
               var width    = "500";
               var height    = "200";
               var x      = (window.screen.width/2) - ( width / 2);
               var y      = (window.screen.height/2) - ( height / 3);
               
               var option = "width=" + width + ", height= " + height + ", left=" + x + ", top=" + y
                     + ", location=no";
               
               window.open(url, name, option);
            }   
                        
            var grSelect = $("#grSelect").val();
            
            $("#grSelect").change(function(){
                  var changeGr = $("#grSelect").val();
              
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
                                   strHTML += '<a href="/Subject/Register?mId=${mId}&lId='+ subjectVo.lId + '&pId=' + subjectVo.pId +'" class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>';
                                   strHTML += '</td>';

                              }
                              else {
                                    strHTML += '<td class="dupli" ><span>' + subjectVo.grName + '</span></td>';
                                     strHTML += '<td class="dupli"><span>' + subjectVo.lName   + '</span></td>';
                                     strHTML += '<td >' + subjectVo.dDay   + '</td>';
                                      strHTML += '<td>' + subjectVo.dTime  + '</td>';
                                      strHTML += '<td class="dupli"><span>' + subjectVo.rName  + '</span></td>';
                                       strHTML += '<td class="dupli"><span>' + subjectVo.tName  + '</span></td>';
                                       strHTML += '<td class="dupli"><span>' + subjectVo.pCost  + '</span></td>';
                                       strHTML += '<td class="dupli"><span>';
                                     strHTML += '<a href="/Subject/Register?mId=${mId}&lId='+ subjectVo.lId  + '&pId=' + subjectVo.pId + '" class="insertBtn">신청</a>';
                                     strHTML += '</span></td>';
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
                                      strHTML += '<a href="/Subject/Register?mId=${mId}&lId='+ subjectVo.lId + '&pId=' + subjectVo.pId + '" class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>';
                                      strHTML += '</td>';
   
                                 }
                                 else {
                                       strHTML += '<td class="dupli" ><span>' + subjectVo.grName + '</span></td>';
                                        strHTML += '<td class="dupli"><span>' + subjectVo.lName   + '</span></td>';
                                        strHTML += '<td >' + subjectVo.dDay   + '</td>';
                                         strHTML += '<td>' + subjectVo.dTime  + '</td>';
                                         strHTML += '<td class="dupli"><span>' + subjectVo.rName  + '</span></td>';
                                          strHTML += '<td class="dupli"><span>' + subjectVo.tName  + '</span></td>';
                                          strHTML += '<td class="dupli"><span>' + subjectVo.pCost  + '</span></td>';
                                          strHTML += '<td class="dupli"><span>';
                                        strHTML += '<a href="/Subject/Register?mId=${mId}&lId='+ subjectVo.lId + '&pId=' + subjectVo.pId + '" class="insertBtn">신청</a>';
                                        strHTML += '</span></td>';
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
   <%@include file="/WEB-INF/include/navigationBar.jsp" %>
   <div id="wrapper">
     
        <div class="container-fluid">
         <div class="row">   
          <div class="col-12">
                 <div class="card">
              <div class="card-header">
                  <div id="searchWrap">
                  <div class="form-group">
                     <select id="grSelect" class="form-control" style="width:150px;">
                        <option  value="">선택</option> 
                        <!-- 그룹명 - GRNAME -->
                        <c:forEach var="grpVo" items="${ groupList }">
                           <option value="${ grpVo.grId }" >${ grpVo.grName }</option>
                        </c:forEach> 
                     </select>
                  </div>
                  <h2>${ mid }</h2>
                  <!-- 여기 상품 목록이 출력 될 것임 -->
                  <div id="search">
                     <div class="form-group">
                        <select id="typeSelect" class="form-control" style="width:150px;">
                           <option value="0">선택</option>
                           <option value="1">수업명</option>
                           <option value="2">강사명</option>
                        </select>
                      </div>
                     <input type="text" id="searchText"  style="width:250px;"/>
                     <input type="button" id="searchBtn" class="btn btn-block btn-default" value="검색"  style="width:100px;"/>
                  </div>
               </div>
               <div id="msgWrap">
                  <div id="msgGet">
                     ${ oCode }     ${ oMsg }
                     <a href="/Subject/List" class="btn btn-block btn-default" style="width:120px;">처음으로</a>
                  </div>
                  
               </div>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
               <table id="example" class="table table-bordered table-striped">
               <thead id="exampleThead">
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
                  <tbody id="exampleTbody">

                  <!-- 아래에 리스트 ROW 반복 -->
                  <c:set   var="old"   value=" " />
                  <c:forEach   var="subjectVo" items="${ subjectList }">
                  <tr>
                  <c:choose>
                     <c:when test="${ old ne subjectVo.lId }">
                        <td>${ subjectVo.grName }</td>
                        <td>${ subjectVo.lName  }</td>
                        <td>${ subjectVo.dDay   }</td>
                        <td>${ subjectVo.dTime   }</td>
                        <td>${ subjectVo.rName  }</td>
                        <td>${ subjectVo.tName  }</td>
                        <td>${ subjectVo.pCost  }</td>
                        <td>
                           <a href="/Subject/Register?mId=${ mId }&lId=${ subjectVo.lId }&pId=${ subjectVo.pId}"  class="insertBtn btn btn-block btn-outline-primary btn-sm">신청</a>
                        </td>
                     </c:when>
                     <c:otherwise>
                        <td  class="dupli"><span>${ subjectVo.grName }</span></td>
                        <td  class="dupli"><span>${ subjectVo.lName  }</span></td>
                        <td  >${ subjectVo.dDay   }</td>
                        <td  >${ subjectVo.dTime   }</td>
                        <td  class="dupli"><span>${ subjectVo.rName  }</span></td>
                        <td  class="dupli"><span>${ subjectVo.tName  }</span></td>
                        <td  class="dupli"><span>${ subjectVo.pCost  }</span></td>
                        <td  class="dupli">
                           <span>
                           <a href="/Subject/Register?mId=${ mId }&lId=${ subjectVo.lId }&pId=${ subjectVo.pId}"  class="insertBtn" style="border:none">신청</a>
                          </span>
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