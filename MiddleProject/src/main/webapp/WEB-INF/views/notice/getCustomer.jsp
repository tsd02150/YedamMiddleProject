<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>


<p align="center">고객센터 문의하신 내용입니다.</p>
<form action="modifyCustomer.do" method="post">
	<table class="table">
		<tr>
			<th>글번호</th>
			<td>${vo.noticeNo}</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${vo.name }</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
					value="${vo.noticeDate }" /></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input value="${vo.noticeTitle }" readonly></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea type="text" cols="50" rows="5" readonly> ${vo.noticeContent } </textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">수정</button>
				<button>취소</button>
			</td>
		</tr>
	</table>
</form>
