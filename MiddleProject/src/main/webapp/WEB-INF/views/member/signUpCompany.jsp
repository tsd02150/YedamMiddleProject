<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signUpCompany.do" method="post">
		<table class="table">
			<tr>
				<th>업체이름</th>
				<td><input type="text" id="comName" name="comName" required></td>
			</tr>
			<tr>
				<th>업체주소</th>
				<td><input type="text" id="comAddr" name="comAddr" required></td>
			</tr>
			<tr>
				<th>업체 전화번호</th>
				<td><input type="text" id="comPhone" name="comPhone" required></td>
			</tr>
			<tr>
				<th>사업자번호</th>
				<td><input type="text" id="crn" name="crn" required></td>
			</tr>

			<input type="text" id="id" name="id" style="display: none;" value=${id } >
			<tr>
				<td><button type="reset">취소</button></td>
				<td><button type="submit">완료</button></td>
			</tr>
		</table>
	</form>
</body>
</html>