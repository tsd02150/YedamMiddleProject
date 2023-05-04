<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>고객센터 문의하신 내용입니다.</h3>

<form method="get" name="form">
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
			<td><input name="title" value="${vo.noticeTitle }" readonly style=display:none>${vo.noticeTitle }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" type="text" cols="50" rows="5" readonly> ${vo.noticeContent } </textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input name="attach" value="${vo.noticeAttach }" readonly></td>
		</tr>

		<tr>
			<td colspan="2" align="center">
				<button type="button"
					onclick="location.href='modifyCustomer.do?no=${vo.noticeNo}'">수정</button>
				<input type="button"
					onclick="location.href='delCustomer.do?no=${vo.noticeNo}'" value="삭제">
				<button type="button" 
					onclick="location.href='customerCenter.do'">목록</button>
			</td>
		</tr>
	</table>
</form>



