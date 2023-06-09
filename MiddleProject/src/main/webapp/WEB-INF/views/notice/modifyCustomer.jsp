<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
#container {
	width: 800px;
	margin: 0 auto;
}
</style>

<div id="container">
<br>
	<h3>고객센터 문의글-수정페이지</h3>
<br>
	<form action="modifyCustomer.do" method="post">
		<table class="table">
			<tr style="display: none">
				<th>글번호</th>
				<td><input name="no" value="${vo.noticeNo }" readonly></td>
			</tr>
			<tr>
				<th>제목</th>
				<td><input name="title" value="${vo.noticeTitle }"></td>
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
				<th>내용</th>
				<td><textarea name="content" cols="50" rows="5"> ${vo.noticeContent } </textarea></td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td><input name="attach" value="${vo.noticeAttach }"></td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<button type="submit">완료</button>
					<button type="button"
						onclick="location.href='getCustomer.do?no=${vo.noticeNo}'">취소</button>
				</td>
			</tr>
		</table>
	</form>

</div>