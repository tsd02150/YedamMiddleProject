<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#container {
	margin-left: 50px;
	width: 800px;
}

</style>

<div id="container">
<br>
<h3>공지사항 수정페이지</h3>
<br>
<form action="modifyNoti.do" method="post">
	<table class="table">
		<tr style="display: none">
			<th>글번호</th>
			<td><input name="no" value="${vo.noticeNo}"></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="title" value="${vo.noticeTitle }"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>관리자</td>
		</tr>
		<tr>
			<th>작성날짜</th>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
					value="${vo.noticeDate }" /></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="50" rows="5"> ${vo.noticeContent } </textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">수정완료</button>
				<button type="button" onclick="location.href='getNoti.do?no=${vo.noticeNo}'">취소</button>
			</td>
		</tr>
	</table>
</form>
</div>
