<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<h3>공지사항 조회</h3>

<table class="table">

	<tr style="display: none">
		<th>글번호</th>
		<td id="no">${vo.noticeNo}</td>
	</tr>
	<tr>
		<th>제목</th>
		<td><input name="title" value="${vo.noticeTitle }" readonly
			style="display: none">${vo.noticeTitle }</td>
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
		<td><textarea name="content" type="text" cols="50" rows="5"
				readonly> ${vo.noticeContent } </textarea></td>
	</tr>
	<tr>
		<td colspan="2" align="center"><button type="button"
				onclick="location.href='noti.do'">목록으로</button></td>
	</tr>
</table>