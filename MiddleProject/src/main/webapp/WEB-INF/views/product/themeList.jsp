<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="author" content="Untree.co">
<link rel="shortcut icon" href="favicon.png">

<meta name="description" content="" />
<meta name="keywords" content="bootstrap, bootstrap4" />

<!-- Bootstrap CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<link href="css/tiny-slider.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
</head>

<style>
@import
url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic")
body
{
width
:
100%
height:
100%
}
#sidebar-wrapper {
	position: relative;
	z-index: 2;
	top: 20px;
	right: 0;
	width: 200px;
	height: 100%;
	background: #3b5d50;
	border-left: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
}

.sidebar-nav {
	top: 0;
	width: 200px;
	margin: 0;
	padding: 0;
	list-style: none;
}

.sidebar-nav li.sidebar-nav-item a {
	display: block;
	text-decoration: none;
	color: #fff;
	padding: 15px;
}

.sidebar-nav li a:hover {
	text-decoration: none;
	color: #fff;
	background: rgba(255, 255, 255, 0.2);
}

.sidebar-nav li a:active, .sidebar-nav li a:focus {
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand {
	font-size: 1.2rem;
	background: rgba(52, 58, 64, 0.1);
	height: 80px;
	line-height: 50px;
	padding-top: 15px;
	padding-bottom: 15px;
	padding-left: 15px;
}

.sidebar-nav>.sidebar-brand a {
	color: #fff;
	text-decoration: none;
}

.sidebar-nav>.sidebar-brand a:hover {
	color: #fff;
	background: none;
}
</style>

<div style="display: block;">
	<nav id="sidebar-wrapper" class="active" style="display: inline-block;">
		<ul class="sidebar-nav">
			<li class="sidebar-nav-item"><a href="theme.do">테마 기획전</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=1&page=${pageInfo.pageNum}">MODERN
					STYLE</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=2&page=${pageInfo.pageNum}">NATURAL
					STYLE</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=3&page=${pageInfo.pageNum}">NORTH
					EUROPE STYLE</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=4&page=${pageInfo.pageNum}">CLASSIC
					STYLE</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=5&page=${pageInfo.pageNum}">ROMANTIC
					STYLE</a></li>
			<li class="sidebar-nav-item"><a
				href="themeList.do?themeNo=6&page=${pageInfo.pageNum}">VINTAGE
					STYLE</a></li>
		</ul>
	</nav>

	<div class="untree_co-section product-section before-footer-section"
		style="width: 1200px; display: inline-block">
		<div class="container">
			<div class="row">

<h3>${themeList[0].themeName }</h3>

				<!-- Start Column 1 -->
				<c:forEach var="theme" items="${themeList }">
					<div class="col-12 col-md-4 col-lg-3 mb-5">
						<a class="product-item"
							href="getBoard.do?page=${pageInfo.pageNum}&bno=${theme.boardNo}"><img
							src="images/${theme.boardThumbnail}"
							class="img-fluid product-thumbnail">
							<h3 class="product-title">${theme.boardTitle}</h3> <strong
							class="product-price"> <fmt:formatNumber
									value="${theme.price}" pattern="#,###" /></strong> <span
							class="icon-cross"> <img src="images/cross.svg"
								class="img-fluid">
						</span> </a>
					</div>
				</c:forEach>
				<!-- End Column 1 -->

			</div>
		</div>
	</div>
</div>

<script>
	
</script>