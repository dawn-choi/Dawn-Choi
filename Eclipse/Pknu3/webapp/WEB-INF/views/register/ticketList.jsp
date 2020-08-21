<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 충전 페이지</title>
<link rel="stylesheet" href="/css/commons.css">
<link rel="stylesheet" href="/css/mainPage.css">
<!-- DataTables -->
<link rel="stylesheet" href="/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
<link rel="stylesheet" href="/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
<!-- Theme style -->
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<style>
	
	table {
		font-size: 20px;
		font-family: 'Russo One', 'Do Hyeon', sans-serif;
		font-size: 24px;
	}
	
	.form-control {
		display: inline-block;
	}
	
	#example {
		margin-bottom: 30px;
	}
	
	#example> thead th {
		font-size:26px;
		height:50px;
		line-height: 50px;
	}
	#msgWrap {
		margin:15px auto;
		font-size:35px;
		float:right;
		border-bottom: 5px dotted #07D88E;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		var logininfo =  "${login.mname}";
	  	
	    if(logininfo!=""){
	    	$("div[name=barRight1]").hide();
	    }
	    
	    else{
	    	$("div[name=barRight2]").hide();
	    }
	    
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

		var grSelect  	 = $('#grSelect');
		var classSelect  = $('#classSelect');
		var termSelect	 = $('#termSelect');
			
		classSelect.hide();
		termSelect.hide();
		
		$('#grSelect').change( function(){
			
			termSelect.hide();
			classSelect.val('');
			termSelect.val('');
			
			console.log(grSelect.val());
			
			if(grSelect.val()=='') {
				classSelect.hide();
				termSelect.hide();
				
			}else {
				
				$.ajax({
					
					url : '/Ticket/ClassList',
					data : 'grId=' + grSelect.val(),
					dataType : 'json',
					type : 'POST',
					success : function(data){
						
						console.log(data);
						
						var strHTML = '';	
						strHTML += '<option value="">선택</option>';
						
						$.each(data, function(index, item){
							strHTML += '<option value="'+ item.pName +'">' + item.pName + '</option>';
						});
						
						classSelect.html(strHTML);						
					},
					error : function(){
						alert("classList Ajax Err");
					}
					
				});
				
				classSelect.show();
			}
			
			getTicketList( grSelect.val(), classSelect.val(), termSelect.val());

			console.log( grSelect.val());
			console.log( classSelect.val());
			console.log( termSelect.val());
			
		});
		
		$('#classSelect').change(function(){
			termSelect.hide();
			termSelect.val('');
			
			if(classSelect.val()==''){
				termSelect.hide();
			}else{
				
				$.ajax({
					url : '/Ticket/TermList',
					data: 'pName=' + classSelect.val(),
					type: 'POST',
					dataType : 'json',
					success : function(data){
						var strHTML = '';
						strHTML += '<option value="">선택</option>';
						
						console.log(data);
						
						$.each(data, function(index, item){
							strHTML += '<option value="'+ item.term +'">' + item.term + '</option>';
						});
						
						termSelect.html(strHTML);	
					},
					error : function(){
						alert("TermList ajax Err");
					}
					
				});
				
				termSelect.show();
			}
			
			getTicketList( grSelect.val(), classSelect.val(), termSelect.val());
			
			console.log( grSelect.val());
			console.log( classSelect.val());
			console.log( termSelect.val());
			
		});
		
		$('#termSelect').change(function(){
			
			getTicketList( grSelect.val(), classSelect.val(), termSelect.val());

			console.log( grSelect.val());
			console.log( classSelect.val());
			console.log( termSelect.val());
			
		})
		
		
	});
	
	function getTicketList(grId, pName, term) {
		
		console.log("GRID : " + grId);
		console.log("PNa : " + pName);
		console.log("Ter : " + term);
		
		if( pName == null){
			pName = '';
		}
		if( term == null){
			term = '';
		}
		
		console.log("GRID : " + grId);
		console.log("PNa : " + pName);
		console.log("Ter : " + term);
		
		$.ajax({
			
			url : "/Ticket/TicketList",
			data : 'grId=' + grId + '&pName=' + pName + '&term=' + term,
			type : 'POST',
			dataType : 'json',
			success : function(data){
				
				console.log(data);
				
				var strHTML = '';
          	 	
				strHTML += '<thead>';
            	strHTML += '<tr>';
                strHTML += '<th>종류</th>';
                strHTML += '<th>프로그램명</th>';
                strHTML += '<th>구분</th>';
                strHTML += '<th>단위</th>';
                strHTML += '<th>수업료</th>';
                strHTML += '<th>인원수</th>';
                strHTML += '<th>신청</th>';
                strHTML += '</tr>';
                strHTML += '</thead>';
                strHTML += '<tbody>';
			
                $.each(data, function(index, item){
                	 strHTML += '<tr>';
                	 strHTML += '<td>' + item.grName 	+ '</td>';
                     strHTML += '<td>' + item.pName   	+ '</td>';
                     strHTML += '<td>' + item.gubun   	+ '</td>';
                     strHTML += '<td>' + item.term   	+ '</td>';
                     strHTML += '<td>' + item.pCost  	+ '</td>';
                     strHTML += '<td>' + item.pTot		+ '</td>';
                     strHTML += '<td>';
                     strHTML += '<button onclick="ticketCharge(\'${mId}\', \'' + item.pId + '\', \'' 
                    		 + 	item.pName + '\', \'' + item.term + '\', \'' + item.gubun + '\' );" ' 
                     		 +   'class="insertBtn btn btn-block btn-outline-primary btn-sm">충전</button>';
                     strHTML += '</td>';                     
                });
                
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
			},
			error : function(){
				alert(" TicketList Err ");
			}
			
		});
		
	}
	
	function ticketCharge( mId, pId, pName, term, gubun){
		
		$('#msgWrap').html("");
		
		$.ajax({
			url  : '/Ticket/Charge',
			data : 'mId=' + mId + '&pId=' + pId,
			type : 'POST',
			success : function(){
				
				var strHTML = pName + " ["+ gubun + " " + term + "] " + "이용권을 충전하셨습니다.";
				
				$('#msgWrap').html(strHTML);
			},
			error : function(){
				alert( "Charge Err ");
			}
			
		});
		
	}

	function myTicket(){
		var logininfo =  "${login.mname}";
		var url= "/myTicket?mid=${login.mid}"
		var name = "이용권조회"
		var option = "width =700, height=800, top = 100 , left = 200, location= no"
		if(logininfo!= ""){
		window.open(url,name,option);}
		else{alert("로그인이 필요합니다");}
	}
</script>
</head>
<body>
	<%@include file="/WEB-INF/include/navigationBar.jsp" %>
	
	<!-- 메인 -->
	<div id="wrapper">
		<div class="container-fluid">
  		 <div class="row">
          <div class="col-12">
             <div class="card">
              <div class="card-header">
              	 <div id="searchWrap">
			         <div class="form-group">
			            <select id="grSelect" class="form-control" style="width:150px;">
			               <option value="">선택</option>
			               <c:forEach var="grVo" items="${ grSelect }">
			               	<option value="${ grVo.grId}">${ grVo.grName } </option>
			               </c:forEach>
			            </select>
			            <select id="classSelect" class="form-control" style="width:150px;">
			            </select>
			            <select id="termSelect" class="form-control" style="width:150px;">
			            </select>
			            <div id="msgWrap"></div>
			         </div>
			     
			         </div>
			   
              </div>
              <!-- /.card-header -->
				  <div class="card-body">
					<table id="example" class="table table-bordered table-striped">
					<thead id="exampleThead">
					  <tr>
			            <th>종류</th>
			            <th>프로그램명</th>
			            <th>구분</th>
			            <th>단위</th>
			            <th>수업료</th>
			            <th>인원수</th>
			            <th>충전</th>
			         </tr>
			         </thead>
			         <tbody id="exampleTbody">
			         <!-- 아래에 리스트 ROW 반복 -->
			         <c:forEach   var="ticket" items="${ ticketList }">
			         <tr>
			               <td>${ ticket.grName }</td>
			               <td>${ ticket.pName  }</td>
			               <td>${ ticket.gubun  }</td>
			               <td>${ ticket.term   }</td>
			               <td>${ ticket.pCost  }</td>
			               <td>${ ticket.pTot   }</td>
			               <td>
			               		<button onclick="ticketCharge('${mId}', '${ticket.pId }', '${ ticket.pName }', '${ ticket.term }', '${ ticket.gubun }' );" 
			               			class="insertBtn btn btn-block btn-outline-primary btn-sm">충전</button>
			               </td>			           
			         </tr>
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