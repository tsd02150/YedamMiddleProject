<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	height: 600px;
	top: 50%;
	margin: 100px auto;
	border: solid 1px gray;
	padding: 30px;
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
	width: 300px; height : 60px;
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
		<form action="signUp.do" method="post">
			<h3>회원가입</h3>
			<table class="table">
				<tr>
					<th>id</th>
					<td colspan="2"><input type="text" id="id" name="id"
						placeholder="4~15자리의 영문과 숫자로 입력" required></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td colspan="2"><input type="password" id="pass" name="pass"
						placeholder="8자리 이상" required></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td colspan="2"><input type="password" id="passCheck"
						name="passCheck" required></td>
				</tr>
				<tr>
					<th>이름</th>
					<td colspan="2"><input type="text" id="name" name="name"
						required></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td colspan="2"><input type="text" id="email" name="email"
						required></td>
				</tr>
				<tr>
					<th>주소</th>
					<td colspan="2"><input type="text" id="addr" name="addr"
						required></td>
				</tr>
				<tr>
					<th>전화번호</th>
					<td colspan="2"><input type="text" id="phone" name="phone"
						required></td>
				</tr>
				<tr>
					<th>주민등록번호</th>
					<td><input type="password" id="rrn1" name="rrn1" required></td>
					<td><input type="password" id="rrn2" name="rrn2" required></td>
				</tr>
				<input type="text" id="grade" name="grade" value=${grade } style="display: none;">
			</table>
			<button type="reset">취소</button>
			<c:choose>
				<c:when test="${grade=='c'}">
					<button type="submit">완료</button>
				</c:when>
				<c:otherwise>
					<button type="submit">다음</button>
				</c:otherwise>
			</c:choose>
		</form>
	</div>
</body>

<script>
	let pass = document.querySelector('#pass');
	let passCheck = document.querySelector('#passCheck');
	document.querySelector('#id').addEventListener('change', function() {
		if (this.value.length<4||this.value.length>15) {
			alert("4자리 이상 15자리 이하로 입력해주세요.");
			this.select();
		}
	});
	pass.addEventListener('change', function() {
		if (pass.value.length < 8) {
			alert("8자리 이상으로 입력해주세요.");
			pass.value = "";
			pass.focus();
		}
	});
	passCheck.addEventListener('change', function() {
		if (pass.value != passCheck.value) {
			alert("비밀번호가 일치하지 않습니다.");
			passCheck.value = "";
			passCheck.focus();
		}
	});
</script>
</html>