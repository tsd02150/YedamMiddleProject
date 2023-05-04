<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<nav
	class="custom-navbar navbar navbar navbar-expand-md navbar-dark bg-dark"
	arial-label="Furni navigation bar">

	<div class="container">
		<a class="navbar-brand" href="main.do">내일의 집<span>.</span></a>

		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarsFurni" aria-controls="navbarsFurni"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarsFurni">
			<ul id="menu" class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
				<li class="nav-item"><a class="nav-link" href="main.do">Home</a>
				</li>
				<c:choose>
					<c:when test="${id == null }">
						<li class="nav-item"><a class="nav-link" href="signIn.do">sign in</a></li>
						<li class="nav-item"><a class="nav-link" href="signUpCheck.do">sign up</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList.do">shop</a></li>
					</c:when>
					<c:otherwise>
						<li class="nav-item"><a class="nav-link" href="signOut.do">sign out</a></li>
						<li class="nav-item"><a class="nav-link" href="myPage.do">MyPage</a></li>
						<li class="nav-item"><a class="nav-link" href="boardList.do">shop</a></li>
					</c:otherwise>
				</c:choose>
				<li class="nav-item"><a class="nav-link" href="customerCenter.do">Customer Center</a></li>
			</ul>
		</div>
	</div>

</nav>

<script>
	document.querySelectorAll(".nav-link").forEach(function(a){
		let url = location.href;
		console.log(location.href);
		console.log(a.href);
		if(url==a.href){			
			a.parentElement.classList.add('active');
		}
		if(a.innerText=="Home"&&url.substring(url.lastIndexOf("/"))=="/" ){
			a.parentElement.classList.add('active');
		}

	});
</script>
