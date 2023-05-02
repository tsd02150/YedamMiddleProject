<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Center Page</title>
</head>
<body>

<form action="customerCenter.do" method="get">
	<table border="1">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
		<tr>
			<td>${notice.noticeNo }</td>
			<td>${notice.noticeTitle }</td>
			<td>${notice.noticeContent }</td>
			<td>${notice.noticeDate }</td>
		</tr>

	</table>
</form>



</body>
</html>