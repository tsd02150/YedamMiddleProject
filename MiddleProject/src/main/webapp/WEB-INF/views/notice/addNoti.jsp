<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<p>공지사항 등록페이지</p>

<form action="addNoti.do" method="post" enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th>작성자</th>
			<td id="id">${id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="title" type="text" size="50"
				placeholder="공지사항 제목 입력" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="80" rows="5"
					placeholder="공지사항 내용 입력" required></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input name="attach" type="file"></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</td>
		</tr>

	</table>

</form>