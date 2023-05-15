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

article {
   caption-side: bottom;
   border-collapse: collapse;
   position: revert;
   padding-left: 250px;
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

.kind-of-selector a{
	text-decoration: none;
	padding: 20px;
	font-size: large;
	margin-bottom: 10px;
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
<div style="display: block;">
	<nav id="sidebar-wrapper" class="active" style="display: inline-block;">
		<ul id="ul" class="sidebar-nav">
			<c:forEach var="ctgList" items="${ctgList }">
				<li class="sidebar-nav-item"><a
					href="categoryBoard.do?page=1&sno=${ctgList.subCategoryNo}">${ctgList.subCategoryName }</a></li>
			</c:forEach>
		</ul>
	</nav>
	<br><br><br>
	
	<div class="untree_co-section product-section before-footer-section"
		style="width: 1200px; display: inline-block">
		<div class="container">
			<div class="row">
				<c:choose>
					<c:when test="${id !=null }">
						<div class="terms-conditions product-page">
							${id } ${grade }
							<c:if test="${grade=='s'}">
								<p>
									<a href="addProductForm.do">상품 등록 </a>
								</p>
								<p>
									<a href="productList.do">상품 리스트 </a>
								</p>
								<p>
									<a href="addBoardForm.do?cno=${companyNo}">판매 등록</a>
								</p>
							</c:if>
						</div>
					</c:when>
				</c:choose>
	<table class="nav-price"><tr><td>
		<div class="search-by-price" style="width: 150px;">
			<p>가격 검색</p>
			<input class="min-price" type="number" value="10000" placeholder="10,000원" style="width: 100px;"> ~ 	
			<input class="max-price" value="999999999" placeholder="999,999,999원"  style="width: 100px;">
			<button type="submit" class="search-price-btn" onclick="searchPrice()"> 제출 </button>
		</div>
	</td></tr></table>
			<table>
				<!-- Start Column 1 -->
				<div class="kind-of-selector">
					<a href="highPriceList.do">높은가격순</a>
					<a href="lowPriceList.do">낮은가격순</a>
					<a href="topCountList.do">매출순</a>
				</div>
				<c:forEach var="board" items="${boardList }">
					<div class="col-12 col-md-4 col-lg-3 mb-5">
						<a class="product-item"
							href="getBoard.do?page=${pageInfo.pageNum}&bno=${board.boardNo}"><img
							src="images/${board.boardThumbnail}"
							class="img-fluid product-thumbnail">
							<h3 class="product-title">${board.boardTitle}</h3> 
							<strong	class="product-price"> <fmt:formatNumber
									value="${board.price}" pattern="#,###" /></strong> <span
							class="icon-cross"> <img src="images/cross.svg"
								class="img-fluid">
						</span> </a>
					</div>
				</c:forEach>
			</table>
				<!-- End Column 1 -->

			</div>
			<div class="center">
			<div class="pagination">
				<c:if test="${pageInfo.prev}">
					<a href="boardList.do?page=${pageInfo.startPage-1 }">Prev</a>
				</c:if>
				<c:forEach var="i" begin="${pageInfo.startPage }"
					end="${pageInfo.endPage }">
					<a href="boardList.do?page=${i }"
						class=${i==pageInfo.pageNum?'active':'' }>${i }</a>
				</c:forEach>
				<c:if test="${pageInfo.next}">
					<a href="boardList.do?page=${pageInfo.endPage+1 }">Next</a>
				</c:if>
			</div>
		</div>
		</div>
	</div>
	
</div>
</article>

<script>
	function searchPrice() {
			var minPrice = document.querySelector('.min-price').value;
			var maxPrice = document.querySelector('.max-price').value;
			window.location.href = 'searchPrice.do?minPrice=' + minPrice + '&maxPrice=' + maxPrice+'&page='+'${pageInfo.pageNum}';
		}
</script>