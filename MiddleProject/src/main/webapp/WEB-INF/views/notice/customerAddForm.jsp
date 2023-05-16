<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
#container {
	width: 800px;
	margin: 0 auto;
}

</style>

<div id="container">
<h3>고객센터 문의하기</h3>

<form action="customerAdd.do" method="post"
	enctype="multipart/form-data">
	<table class="table">
		<tr>
			<th>작성자</th>
			<td id="id">${id }</td>
		</tr>
		<tr>
			<th>제목</th>
			<td><input name="title" type="text" size="50"
				placeholder="제목을 입력하세요" required></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea name="content" cols="80" rows="5"
					placeholder="문의 내용을 입력하세요" required></textarea></td>
		</tr>
		<tr>
			<th>첨부파일</th>
			<td><input name="attach" type="file"></td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td><input name="noticePw" type="password" required></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">등록</button>
				<button type="button" onclick="location.href='customerCenter.do'">취소</button>
			</td>
		</tr>

	</table>

</form>
</div>