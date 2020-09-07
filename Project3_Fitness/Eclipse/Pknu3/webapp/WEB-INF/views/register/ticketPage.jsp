<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 충전 안내</title>
<link href="https://fonts.googleapis.com/css2?family=Do+Hyeon&family=Russo+One&display=swap" rel="stylesheet">
<link rel="stylesheet" href="/dist/css/adminlte.min.css">
<style>
	* {
		font-family: 'Russo One', 'Do Hyeon', sans-serif;
		font-size: 20px;
	}
	div {
		text-align: center;
		margin:10px;
	}
	
	#btnCharge {
		width: 350px;
		height: 50px;
		display: block;
		margin:15px auto;
		font-size: 21px;
	}
	
	#btnClose{
		width: 150px;
		height: 50px;
		margin:0 auto;
		display: block;
		font-size: 21px;
	}
	
	#toTicketPage {
		display : block;
		color : lightgray;
		text-align: center;
		margin:5px auto;
	}
	
	#toTicketPage:hover {
		color : #07D88E;
		font-size: 22px;
	}
	
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		 var oCode = "${ map.oCode }";
		
		if( oCode == 'ERR005'){
			$('#space1').hide();
			
			$('#msg').html("${ map.oMsg }");
			$('#msg').css({
				'font-size' :'45px',
				'margin' : '45px auto 20px auto'
				});
			
			$('#btnClose').click(function(){
				close();
			});
		}else {
			$('#space2').hide();
			$('#btnCharge').click(function(){
				
				$.ajax({
					
					url  : '/Ticket/Charge',
					data : 'mId=${map.mId}&pId=${map.pId}',
					type : 'POST',
					success : function(){
						$('#qMsg').html("[ 이용권이 충전되었습니다. ]");
					},
					error : function(){
						$('#qMsg').html( " 충전에 실패하셨습니다. ");
					}
				});
				
				
				$('#errMsg').css('visibility', 'hidden');
				$('#qMsg').css({
					'font-size' :'28px',
					'margin-bottom' : '30px'
					});
				
				$('#btnCharge').hide();
		
			});
			
			
			$('#toTicketPage').click(function(){
				
				window.opener.location.href="/Subject/ticketList";
				close();
			});
		
		}
		
	});
</script>
</head>
<body>
	<div id="space1">
		<div id="errMsg">[ ${ map.oMsg } ]</div>
		<div id="qMsg">이용권을 충전하시겠습니까?</div>
		<input type="button" id="btnCharge" value="이용권 충전" class="insertBtn btn btn-block btn-outline-primary btn-sm"/>
		<a id="toTicketPage">다른 이용권 목록을 보시겠습니까?</a>
	</div>
	<div id="space2">
		<div id="msg"></div>
		<input type="button" id="btnClose" value="닫기" class="insertBtn btn btn-block btn-outline-primary btn-sm"/>
	</div>
</body>
</html>