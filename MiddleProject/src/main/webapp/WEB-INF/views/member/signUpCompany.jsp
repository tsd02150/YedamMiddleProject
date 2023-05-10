<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
#signUpForm {
	text-align: center;
	margin: 100px auto;
	position: relative;
}

#signUpForm form {
	width: 800px;
	height: 500px;
	top: 50%;
	margin: 100px auto;
	border: solid 1px gray;
	padding: 30px;
	padding-top : 100px;
	border-radius: 10px;
	box-shadow: 0 0 5px #000;
}

#signUpForm table {
	top: 200px;
	border-color: #eff2f1;
	width: 600px;
	table-layout: fixed;
	margin: 0 auto;
}

#signUpForm button {
	width: 300px;
	height: 60px;
	background-color: #3b5d50;
	color: white;
	border: none;
	font-size: large;
	font-weight: bold;
	height: 60px;
	margin:20px;
}

#signUpForm input {
	width: 100%;
}
</style>
</head>
<body>
	<div id="signUpForm">
		<form action="signUpCompany.do" method="post">
			<h3>업체 정보 기입</h3>
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

				<input type="text" id="id" name="id" style="display: none;"
					value=${id }>

			</table>
			<button type="reset">취소</button>
			<button type="submit">완료</button>
		</form>
	</div>
</body>
</html>