<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<head>
<meta charset="UTF-8">
<style>
.kind-of-selector a{
	text-decoration: none;
	padding: 20px;
	font-size: large;
	margin-bottom: 10px;
}
</style>
</head>
<body>
	<table class="nav-price">
		<tr>
			<td>
				<div class="search-by-price" style="width: 150px;">
					<p>가격 검색</p>
					<input class="min-price" type="number" defaultValue="10000"
						placeholder="10,000원" style="width: 100px;"> ~ <input
						class="max-price" defaultValue="999999999"
						placeholder="999,999,999원" style="width: 100px;">
					<button type="submit" class="search-price-btn"
						onclick="searchPrice()">제출</button>
				</div>
			</td>
		</tr>
	</table>
	<table>
		<!-- Start Column 1 -->
		<div class="kind-of-selector">
			<a href="highPriceList.do">높은가격순</a> <a href="lowPriceList.do">낮은가격순</a>
			<a href="topCountList.do">매출순</a>
		</div>
		<div class="untree_co-section product-section before-footer-section"
			style="width: 1200px; display: inline-block">
			<div class="container" style="max-width:1140px">
				<div class="row">
				<h1>특가 핫딜!</h1>
					<c:forEach var="board" items="${boardList}" begin="0" end="7" step="1">
						<div class="col-12 col-md-4 col-lg-3 mb-5">
							<a class="product-item"
								href="getBoard.do?page=${pageInfo.pageNum}&bno=${board.boardNo}">
								<img src="images/${board.boardThumbnail}"
								class="img-fluid product-thumbnail">
								<p class="sub-name" style="text-align: left;">${board.subCategoryName}</p>
								<h3 class="product-title">${board.boardTitle}</h3> <strong
								class="product-price"> <fmt:formatNumber
										value="${board.price}" pattern="#,###" />
							</strong> <span class="icon-cross"> <img src="images/cross.svg"
									class="img-fluid">
							</span>
							</a>
						</div>
					</c:forEach>
					
				</div>
			</div>
		</div>
	</table>
</body>
<script>
	function searchPrice() {
			var minPrice = document.querySelector('.min-price').value;
			var maxPrice = document.querySelector('.max-price').value;
			window.location.href = 'searchPrice.do?minPrice=' + minPrice + '&maxPrice=' + maxPrice+'page='+'${pageInfo.pageNum}';
		}
</script>
