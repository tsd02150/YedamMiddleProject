<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav
	class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark"
	arial-label="Furni navigation bar">

	<div class="container" style="margin-left:1px; margin-right:0;">
		<a class="navbar-brand" href="main.do"><img src="images/houseIcon.png" width=40px height=40px>내일의 집<span>.</span></a>
		<c:choose>
		<c:when test="${id!=null }">
		<p style="color:white;">[${name }]님 환영합니다.</p>
		</c:when>
		</c:choose>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsFurni" aria-controls="navbarsFurni"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsFurni">
			<ul id="menu" class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
				<li class="nav-item"><a class="nav-link" href="main.do">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="boardList.do">Shop</a></li>
				<c:choose>
					<c:when test="${id == null }">
						<li class="nav-item"><a class="nav-link" href="signIn.do">Sign in</a></li>
						<li class="nav-item"><a class="nav-link" href="signUpCheck.do">Sign up</a></li>
					</c:when>
					<c:when test="${id == 'admin' }">
						<li class="nav-item"><a class="nav-link" href="signOut.do">Sign out</a></li>
						<li class="nav-item"><a class="nav-link" href="adminMember.do">Manager</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="signOut.do">Sign out</a></li>
						<li class="nav-item"><a class="nav-link" href="myPage.do">MyPage</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="customerCenter.do" data-noti="noti.do" data-faq="faq.do">Customer Center</a></li>
			</ul>
		</div>
	</div>

</nav>

<script>
	document.querySelectorAll(".nav-link").forEach(function(a){
		let url = location.href;
		if(url==a.href){			
			a.parentElement.classList.add('active');
		}
		if(a.dataset.noti==url.substring(url.lastIndexOf("/")+1)||a.dataset.faq==url.substring(url.lastIndexOf("/")+1)){
				a.parentElement.classList.add('active');
		}
		if(a.innerText=="Home"&&url.substring(url.lastIndexOf("/"))=="/" ){
			a.parentElement.classList.add('active');
		}

	});
</script>
