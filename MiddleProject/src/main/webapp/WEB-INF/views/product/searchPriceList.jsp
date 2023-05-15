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
article {
	caption-side: bottom;
	border-collapse: collapse;
	position: revert;
	padding-left: 200px;
	padding-right: 50px;
	padding-top: 10px;
	width: 100%;
	display: inline-block;
	margin: 0 auto;
}

#sidebar-wrapper {
	position: absolute;
	top: 90px;
	left: 0;
	height: 97%;
	width: 200px;
	background: #3b5d50;
	border-left: 1px solid rgba(255, 255, 255, 0.1);
	text-align: center;
}

.sidebar-nav {
	top: 0;
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

.kind-of-selector a {
	text-decoration: none;
	padding: 20px;
	font-size: large;
	font-weight: bold;
	margin-bottom: 10px;
	margin-top: 20px;
}

.center {
	text-align: center;
	font-weight: bold;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 12px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #3b5d50;
	color: white;
	border: 1px solid #3b5d50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<article>
<div style="display:block; ">
<form action="categoryBoard.do" method="get" style="width: 150px;">
<nav id="sidebar-wrapper" class="active" style="display:inline-block;">
	<ul id="ul" class="sidebar-nav">
	<c:forEach var="ctgList" items="${ctgList }">
		<li class="sidebar-nav-item"><a href="categoryBoard.do?page=${pageInfo.pageNum}&sno=${ctgList.subCategoryNo}">${ctgList.subCategoryName }</a></li>
	</c:forEach>
	</ul>
</nav>
</form>
</div>

<c:choose>
<c:when test="${id !=null }">
	<div class="terms-conditions product-page">
		<c:if test="${grade=='s'}">
		<ul style="padding-left: 50px; padding-top: 50px; list-style:none">
		<li><h3 style="font-weight:bold">가격 검색 조건 > <span id="min-price"></span>원 ~ <span id="max-price"></span>원</h3></li>
		<li><p style="display:none;">page: <span id="page"></span></p></li>
			</ul>
		</c:if>
		</div>
	</c:when>
</c:choose>
<div class="untree_co-section product-section before-footer-section" style="width:1200px;display:inline-block">
	<div class="container">
		<div class="row">
  
<!-- Start Column 1 -->
<table>
<c:forEach var="board" items="${searchPriceList }">

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
</table>
<!-- End Column 1 -->
<div class="center">
	<div class="pagination">
	  <c:if test="${pageInfo.prev}">
	    <a href="searchPrice.do?minPrice=${param.minPrice}&amp;maxPrice=${param.maxPrice}&amp;page=${pageInfo.startPage-1}">Prev</a>
	  </c:if>
	  <c:forEach var="i" begin="${pageInfo.startPage}" end="${pageInfo.endPage}">
	    <a href="searchPrice.do?minPrice=${param.minPrice}&amp;maxPrice=${param.maxPrice}&amp;page=${i}"
	      class="${i==pageInfo.pageNum?'active':'' }">${i}</a>
	  </c:forEach>
	  <c:if test="${pageInfo.next}">
	    <a href="searchPrice.do?minPrice=${param.minPrice}&amp;maxPrice=${param.maxPrice}&amp;page=${pageInfo.endPage+1}">Next</a>
	  </c:if>
	</div>
</div>

		</div>
	</div>
</div>
</article>
<hr>
<hr>
<script>
console.log('${minPirce}');
console.log('${maxPirce}');
function numberWithCommas(number) {
    return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

function searchParams() {
    let params = new URLSearchParams(window.location.search);
    let minPrice = params.get('minPrice');
    let maxPrice = params.get('maxPrice');
    let page = params.get('page');
    let minPriceElem = document.getElementById('min-price');
    let maxPriceElem = document.getElementById('max-price');
    let pageElem = document.getElementById('page');
    if (minPrice) {
        minPriceElem.textContent = numberWithCommas(minPrice);
    }
    if (maxPrice) {
        maxPriceElem.textContent = numberWithCommas(maxPrice);
    }
    if (page) {
        pageElem.textContent = page;
    }
}

window.onload = function() {
    searchParams();
};

</script>