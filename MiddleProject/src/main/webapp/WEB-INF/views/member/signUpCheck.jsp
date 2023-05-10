<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.check{
	top : 50%;
	padding: 30px;
	padding-top:170px;
	width: 400px;
	height: 400px;
	background-color: #eff2f1;
	margin:0 auto;
	display: inline-block;
	font-size : large;
	font-weight: bold;
	position: relative;
}
.check:hover{
	background-color: #3b5d50;
	color : white;
	border: solid 1px gray;
	border-radius: 10px;
	box-shadow: 0 0 5px #000;
}
#signUpCheckForm{
	text-align: center;
	margin: 100px auto;
	position: relative;
}
#signUpCheckForm h3{
	top : 50%;
}

</style>
</head>
<body>
<div id=signUpCheckForm>
	<div id="customer" class="check">
		<h3>일반회원</h3>
	</div>
	<div id="seller" class="check">
		<h3>업체회원</h3>
	</div>
</div>
</body>
<script>
	document.querySelectorAll('.check').forEach(function(member){
		member.addEventListener('click',function(){
			if(member.getAttribute('id')=='customer'){
				if('${memberInfo.id}'!=""){
					location.href='otherLoginInfo.do?grade=c';
					return;
				}
				location.href='signUp.do?grade=c';
				return;		
			}
			if(member.getAttribute('id')=='seller'){
				if('${memberInfo.id}'!=""){
					console.log('${memberInfo.id}');
					alert('${memberInfo.id}');
					location.href='otherLoginInfo.do?grade=r';
					return;
				}
				location.href='signUp.do?grade=r';
				return;		
			}	
		
		});
		
	});
</script>


</html>
