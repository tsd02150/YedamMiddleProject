<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="signIn.do" method="post">
		<table class="table">
			<tr>
				<th>id</th>
				<td><input type="text" name="id" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="pass" required></td>
			</tr>
			<tr>
			<td><button type="submit">로그인</button></td>
			</tr>
		</table>
	</form>
	<p>회원가입</p><p>ID/PW 찾기</p>
</body>
</html>