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
	
	#btnMove {
		width: 400px;
		height: 50px;
		display: block;
		margin:15px auto;
	}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
	$(document).ready(function(){
		
		$('#btnMove').click(function(){
			
			window.opener.location.href="/Subject/ticketList";
			close();
		});
		
	});
</script>
</head>
<body>
	<div>[ ${ oMsg } ]</div>
	<div>이용권을 충전하시겠습니까?</div>
	<input type="button" id="btnMove" value="이용권 충전" class="insertBtn btn btn-block btn-outline-primary btn-sm"/>
</body>
</html>