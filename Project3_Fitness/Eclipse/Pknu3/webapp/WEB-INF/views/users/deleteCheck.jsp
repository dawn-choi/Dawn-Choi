<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script>

/* 퀵메뉴 창닫기 기능 */ 

function winClose()

 {
	location.href = "/deleteMember?mid=${login.mid}"
	alert('회원탈퇴 되었습니다');
	opener.location.href = "javascript:deleteOver();";
    window.open('','_self').close();     
}

</script>
</head>
<table style="margin-left: auto; margin-right: auto; text-align:center">
<tr>
<td>
정말 
</td>
<td>
삭제하시겠습니까?
</td>
</tr>
<tr>
<td colspan=2>
<button onclick='winClose();' >확인</button>
</td>
</tr>
</table>
</body>
</html>