<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<p>�ʿ� ����</p>
	<form action="otherLoginInfo.do" method="post">
		<table class="table">
			<tr>
				<th>�ּ�</th>
				<td><input type="text" id="addr" name="addr" required></td>
			</tr>
			<tr>
				<th>��ȭ��ȣ</th>
				<td><input type="text" id="phone" name="phone" required></td>
			</tr>
			<tr>
				<th>�ֹε�Ϲ�ȣ</th>
				<td><input type="password" id="rrn1" name="rrn1" required></td>
				<td><input type="password" id="rrn2" name="rrn2" required></td>
			</tr>
			<input type="text" id="grade" name="grade" value=${grade } style="display: none;">
			<tr>
				<td><button type="reset">���</button></td>
				<td><button type="submit" id="btn">���� or �Ϸ�</button></td>
			</tr>
		</table>
</form>
</body>
</html>