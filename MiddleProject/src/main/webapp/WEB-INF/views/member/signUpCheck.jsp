<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.check{
		width: 400px;
		height: 600px;
		background-color: white;
		border:1px solid black;
		display: inline-block;
	}
</style>
</head>
<body>
<div>
	<div id="customer" class="check">
		일반회원
	</div>
	<div id="seller" class="check">
		업체회원
	</div>
</div>
</body>
<script>
	document.querySelectorAll('.check').forEach(function(member){
		member.addEventListener('click',function(){
			if(member.getAttribute('id')=='customer'){
				location.href='signUp.do?grade=c';
				return;		
			}
			if(member.getAttribute('id')=='seller'){
				location.href='signUp.do?grade=r';
				return;		
			}	
		
		});
		
	});
</script>


</html>
