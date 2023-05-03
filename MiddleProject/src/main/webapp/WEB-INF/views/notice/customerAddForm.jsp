<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<p>고객센터 문의하기</p>

<form action="customerAdd.do" method="post">
	<table class="table">
		<tr>
			<th>제목</th>
			<td><input type="text" size="50" placeholder="제목을 입력하세요"></td>
		</tr>
		<tr>
			<th>내용</th>
			<td><textarea cols="80" rows="5" placeholder="문의 내용을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="submit">등록</button>
				<button type="reset">취소</button>
			</td>
		</tr>
	</table>

</form>
