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
			<ul class="custom-navbar-nav navbar-nav ms-auto mb-2 mb-md-0">
				<li class="nav-item active"><a class="nav-link" href="main.do">Home</a>
				</li>
				<li><a class="nav-link" href="shop.html">sign in</a></li>
				<li><a class="nav-link" href="about.html">sign up</a></li>
				<li><a class="nav-link" href="customerCenter.do">Customer Center</a></li>
			</ul>
		</div>
	</div>

</nav>
