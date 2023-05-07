<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<p>수정페이지</p>

<form action="modifyBoard.do" method="post">
<table class="table">
		<tr>
			<th>게시글 번호</th>
			<td><input type="text" name="bno" value="${boardInfo.boardNo }" readonly></td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input type="text" name="title" value="${boardInfo.boardTitle}"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea rows="3" cols="20" name="content">${boardInfo.boardContent }</textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">저장(수정)</button>
				<button type="button" onclick="deleteBoard()">삭제</button>
			</td>
		</tr>
	</table>


</form>
<script>
function deleteBoard() {
	let frm = document.querySelector('form');
	frm.action = "deleteBoard.do";
	frm.submit(); //form 태그 안에 있는 submit 실행됨
}
</script>