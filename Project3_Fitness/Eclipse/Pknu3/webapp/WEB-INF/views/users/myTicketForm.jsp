<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용권 조회</title>
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
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #07D88E ;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
    font-family: 'Russo One', 'Do Hyeon', sans-serif;
}

</style>
</head>
<body>
<table class="type11">
    <thead>
    <tr>
        <th scope="cols">상품권명</th>
        <th scope="cols">만료일</th>
        <th scope="cols">상품 횟수/개월수</th>
        <th scope="cols">사용 횟수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach var="ticket" items="${ticket}" >
		<c:if test="${ticket.mid != null}">
		 <tr>
		<td>${ticket.pname}</th>
		<td>${ticket.oexp}</th>
		<td>${ticket.cname}</th>
		<td>${ticket.lcount}</th>
		</tr>
		</c:if>
		
		</c:forEach>
    </tbody>
</table>

</body>
</html>