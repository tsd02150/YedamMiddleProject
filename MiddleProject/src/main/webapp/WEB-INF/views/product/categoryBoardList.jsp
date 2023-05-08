<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
	width: 150px;
	height: 100%;
	background: #3b5d50;
	border-left: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
}

.sidebar-nav {
	top: 0;
	width: 150px;
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

<div style="display:block;">
<form action="categoryBoard.do" method="get">
<nav id="sidebar-wrapper" class="active" style="display:inline-block;">
	<ul id="ul" class="sidebar-nav">
	<c:forEach var="ctgList" items="${ctgList }">
		<li class="sidebar-nav-item"><a href="categoryBoard.do?page=${pageInfo.pageNum}&sno=${ctgList.subCategoryNo}">${ctgList.subCategoryName }</a></li>
	</c:forEach>
	</ul>
</nav>
</form>
<div class="untree_co-section product-section before-footer-section" style="width:1200px;display:inline-block">
	<div class="container">
		<div class="row">
<c:choose><c:when test="${id !=null }">
<div class="terms-conditions product-page">
	${id }
	${memberGrade }
	  <c:if test="${memberGrade == S }">
		 <p><a href="addProductForm.do">상품 등록 </a></p>
		 <p><a href="productList.do">상품 리스트 </a></p>
		 <p><a href="addBoardForm.do?cno=${companyNo}">판매 등록</a></p>
	 </c:if>
</div>
</c:when></c:choose>
  
<!-- Start Column 1 -->
<c:forEach var="board" items="${ctgrlist }">

	<div class="col-12 col-md-4 col-lg-3 mb-5">
		<a class="product-item" href="getBoard.do?page=${pageInfo.pageNum}&bno=${board.boardNo}"><img src="images/${board.boardThumbnail}"
				class="img-fluid product-thumbnail">
			<h3 class="product-title">${board.boardTitle}</h3> <strong class="product-price">
				<fmt:formatNumber value="${board.price}" pattern="#,###" /></strong>
			<span class="icon-cross"> <img src="images/cross.svg" class="img-fluid">
			</span>
		</a>
	</div>
</c:forEach>
<!-- End Column 1 -->

		</div>
	</div>
</div>
</div>


<script>
</script>