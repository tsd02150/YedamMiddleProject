<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script>

</script>

<h3>고객센터</h3>

<table class="table">
	<tr>
		<th>번호</th>
		<th>제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
	</tr>
	<c:forEach var="notice" items="${list }">
		<tr>
			<td>${notice.noticeNo }</td>
			<td>${notice.noticeTitle }</td>
			<td></td>
			<td>${notice.noticeDate }</td>
		</tr>
	</c:forEach>
</table>
<button>문의하기</button>


