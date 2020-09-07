<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
<style>
table.type11 {
    border-collapse: separate;
    border-spacing: 1px;
    text-align: center;
    line-height: 1.5;
    margin: 20px 10px;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
table.type11 th {
    width: 200px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #07D88E ;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
table.type11 td {
    width: 200px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

table.type22 th {
    width: 1000px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #07D88E ;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
table.type22 td {
    width: 1000px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

</style>
<script>
 function deleteCheck(){
		window.open('deleteCheck','회원탈퇴','width=400, height=300, margin-left: auto; margin-right: auto')
		   
 }

 function deleteOver(){
	 opener.parent.location.reload();
	  window.open('','_self').close();  
	 
 }

</script>

</head>
<body>
<table class="type11">
    <thead>
    <tr>
        <th scope="cols">이름</th>
        <th scope="cols">이메일</th>
        <th scope="cols">생일</th>
        <th scope="cols">성별</th>
        <th scope="cols">전화번호</th>
    </tr>
    </thead>
    <tbody>
		 <tr>
		<td>${info.mname}</th>
		<td>${info.memail}</th>
		<td>${info.mbirth}</th>
		<td>${info.mgender}</th>
		<td>${info.mtel}</th>
		</tr>
		
    </tbody>
</table>
<table class="type22">    
     <thead >
    <tr style="width:300px;">
        <th scope="cols">주소</th>
    </tr>
    </thead>
    <tbody>
		 <tr >
		<td>${info.maddr}</th>
		</tr>
    </tbody>
</table>
<table class="type11" style="margin-left: auto; margin-right: auto;">
    <thead>
		 <tr>
		<td><input type="button" value ="회원 탈퇴" onclick="deleteCheck()"></th>
		
		</tr>
		
    </tbody>
</table>



</body>
</html>