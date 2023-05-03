<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 반복문태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#all {
width: 1200px;
margin: 0 auto;
text-align: center;
}

</style>


<div id="all">
	<h3>고객센터</h3>
	<c:set var="no" value="0"></c:set>
	<form action="customerAddForm.do" method="get">
		<table class="table">
			<tr>
				<td colspan="4" align="right">
					<button type="submit">문의하기</button>
				</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성날짜</th>
			</tr>
			<c:forEach var="notice" items="${list }">
				<tr>
					<td><c:out value="${no=no+1}"></c:out></td>
					<td><a href="getCustomer.do?no=${notice.noticeNo}">${notice.noticeTitle }</a></td>
					<td>${notice.name }</td>
					<td><fmt:formatDate pattern="yyyy-MM-dd"
							value="${notice.noticeDate }" /></td>
				</tr>
			</c:forEach>
		</table>
	</form>


</div>