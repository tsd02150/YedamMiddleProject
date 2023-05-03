<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<table class="table">
		<tr>
			<th>�̸�</th>
			<td><input type="text" id="name" name="name" required></td>
		</tr>
		<tr>
			<th>�ֹε�Ϲ�ȣ</th>
			<td><input type="password" id="rrn1" name="rrn1" required></td>
			<td><input type="password" id="rrn2" name="rrn2" required></td>
		</tr>
		<tr>
			<td><button id="searchBtn" type="button">ã��</button></td>
		</tr>
		<tr id="tlist">
			<td><p></p></td>
		</tr>
	</table>
</body>
<script>
	document.getElementById("searchBtn").addEventListener('click',function(){
		let name = document.querySelector("#name").value;
		let rrn = document.querySelector("#rrn1").value +"-"+document.querySelector("#rrn2").value;
		fetch('searchId.do',{
			method:'POST',
			headers:{
				'Content-Type':'application/x-www-form-urlencoded'
			},
			body:'name='+name+'&rrn='+rrn
		})
		.then(resolve=>resolve.json())
		.then(result=>{
			let tlist = document.querySelector('#tlist');
			if(result.retCode=='Success'){
				tlist.children[0].children[0].innerText="������ id�� [ "+result.id+" ]�Դϴ�.";
				let tr = document.createElement('tr');
				let td = document.createElement('td');
				let a = document.createElement('a');
 				a.innerText="�α���";
 				a.href="signIn.do";
 				td.append(a);
 				tr.append(td);
 				tlist.parentElement.append(tr);
			}else if(result.retCode=='Fail'){
				alert('Ʋ�� ���������Դϴ�.');
			}
		})
		.catch(err=>console.log(err));
	});
</script>
</html>