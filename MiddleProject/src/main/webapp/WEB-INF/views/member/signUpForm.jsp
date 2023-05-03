<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="signUp.do" method="post">
		<table class="table">
			<tr>
				<th>id</th>
				<td><input type="text" id="id" name="id" placeholder="4~15자리의 영문과 숫자로 입력" required></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pass" name="pass" placeholder="8자리 이상" required></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="passCheck" name="passCheck" required></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" id="name" name="name" required></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><input type="text" id="email" name="email" required></td>
			</tr>
			<tr>
				<th>주소</th>
				<td><input type="text" id="addr" name="addr" required></td>
			</tr>
			<tr>
				<th>전화번호</th>
				<td><input type="text" id="phone" name="phone" required></td>
			</tr>
			<tr>
				<th>주민등록번호</th>
				<td><input type="password" id="rrn1" name="rrn1" required></td>
				<td><input type="password" id="rrn2" name="rrn2" required></td>
			</tr>
			<input type="text" id="grade" name="grade" value=${grade } style="display: none;">
			<tr>
				<td><button type="reset">취소</button></td>
				<td><button type="submit">다음 or 완료</button></td>
			</tr>
		</table>
	</form>
</body>

<script>
console.log('${grade}');
	let pass = document.querySelector('#pass');
	let passCheck = document.querySelector('#passCheck');
	document.querySelector('#id').addEventListener('change',function(){
		if(this.value.length<4||this.value.length>15){
			alert("4자리 이상 15자리 이하로 입력해주세요.");
			this.select();
		}
	});
	pass.addEventListener('change',function(){
		if(pass.value.length<8){
		    alert("8자리 이상으로 입력해주세요.");
		    pass.value="";
		    pass.focus();
		  }
	});
	passCheck.addEventListener('change',function(){
		if(pass.value != passCheck.value){
			alert("비밀번호가 일치하지 않습니다.");
			passCheck.value="";
			passCheck.focus();
		}
	});
</script>
</html>