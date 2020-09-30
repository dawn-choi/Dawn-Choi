<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>할일 수정하기</title>

<style>
	div{margin: 10px;}
	
	 #wrap{position : absolute;	
		top: 30%;
		left: 40%;
		width: 400px;
		height: 500px;
		width: 100%;
		}
		
	h1{text-align: center;}
		
	a{text-decoration:none;
	  font-weight:bold;
	  color: black;
	}
	
	label{
	 font-size:12px;
	 font-weight:bold;
	 text-align: left;
	 line-height: 2;
	}
	
	.rightButton{
	 background-color: #1AA6E8;
	 color: white;
	 font-weight: bold;
	 border: 1px solid blue;
	}
	
	form{
	 display: inline-block;
	 widhth:100%;
	}
	
	#err{
	color: red;
	}
</style>
<script src="http://code.jquery.com/jquery-1.11.1.min.js"></script>
<script>
	function redirect(){
		location.reload(true);			
	}
	
	function submitCheck(){
		var titleLength = document.querySelector("input[name=title]").value.length;
		var nameLength = document.querySelector("input[name=names]").value.length;
		console.log(nameLength);
		if(titleLength == 0){
			$("#err").html("<div id='errContent'>할일을 적어주세요</div>")
		}else if(nameLength ==0){
			$("#err").html("<div id='errContent'>누가 할일인지 적어주세요</div>")			
		}else{
			document.querySelector("form").submit();
		}
	}
</script>
</head>
<body>
 <div id='wrap'>
 
 	<form action="/update" method="POST">
 	<div><h1>할일 등록</h1></div>
 	<div> 어떤일인가요?</div>
 	<div><input type="text" placeholder= "${title}" name="title" maxlength="24"/></div>
 	<div> 누가 할일인가요?</div>
 	<div><input type="text" placeholder="${names}" name="names"/></div>
 	<div> 우선순위를 선택하세요</div>
 	<div><label><input type="radio" name="seqs"  value="1" checked> 1순위 </label>
 		 <label><input type="radio" name="seqs"  value="2"> 2순위 </label>
 		 <label><input type="radio" name="seqs"  value="3"> 3순위 </label></div>
 	<div> 
 	 
	<div id="err"></div> 	  
 	 <button id="back"> <a href="/"> < 이전</a></button>
 	  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 
	
 	 <input type="button" class="rightButton" value="제출" onclick="submitCheck()">
 	 <button type ="button" class="rightButton" onclick="redirect()">내용 지우기</button>
 	 </form>
 	 
 	</div>	 
 	
 
 
 </div>
</body>
</html>