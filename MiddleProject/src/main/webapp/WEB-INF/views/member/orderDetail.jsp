<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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
	padding-top: 20px;
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

.table-orderDetail {
    --bs-table-bg: transparent;
    --bs-table-accent-bg: transparent;
    --bs-table-striped-color: #212529;
    --bs-table-striped-bg: rgba(0, 0, 0, 0.05);
    --bs-table-active-color: #212529;
    --bs-table-active-bg: rgba(0, 0, 0, 0.1);
    --bs-table-hover-color: #212529;
    --bs-table-hover-bg: rgba(0, 0, 0, 0.075);
    width: 100%;
    margin-bottom: 1rem;
    color: #212529;
    vertical-align: top;
    /* border-color: #dee2e6; */
}
.table-orderDetail td{
	border-spacing: 0px;
	border-style: none;
	padding: 0px;
	padding-bottom: 20px;
}

</style>

<c:choose>
	<c:when test="${grade=='s'}">
		<nav id="sidebar-wrapper" class="active">
			<ul class="sidebar-nav">
				<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
				<li class="sidebar-nav-item"><a href="sales.do">판매 내역<br>(매출현황)</a></li>
				<li class="sidebar-nav-item"><a href="prodNowList.do">상품현황</a></li>
				<li class="sidebar-nav-item"><a href="orderProdList.do">주문현황</a></li>
				<li class="sidebar-nav-item"><a href="orderDeliList.do">배송현황</a></li>
				<li class="sidebar-nav-item"><a href="#">문의내역</a></li>
			</ul>
		</nav>
	</c:when>
	<c:otherwise>
		<nav id="sidebar-wrapper" class="active">
			<ul class="sidebar-nav">
				<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
				<li class="sidebar-nav-item"><a href="orderList.do">장바구니</a></li>
				<li class="sidebar-nav-item"><a href="orderDetail.do">주문현황</a></li>
				<li class="sidebar-nav-item"><a href="wishList.do">관심상품</a></li>
				<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
			</ul>
		</nav>
	</c:otherwise>
</c:choose>

<article>
<table class="table-orderDetail">
	<c:set var = "totalPrice" value = "0"/>
	<c:forEach var="delivery" items="${list}">
		<c:if test ="${delivery.deliveryState == 'r' || delivery.deliveryState == 'd' || delivery.deliveryState == 's'}">
		<tr>
			<td><c:out value="${no=no+1 }"></c:out></td>
			<td><!-- <a href="getNotice.do?page=${pageInfo.pageNum }&nNo=${notice.noticeNo}">--><a>품번 : ${delivery.productNo}</a></td>
			<td><img width="70px" src="images/${delivery.boardThumbnail}"></td>
			<td>제품명 : ${delivery.productName}</td>
			<td>주문 수량 : ${delivery.orderCount}</td>
			<td>주문 날짜 : <fmt:formatDate value="${delivery.orderDate}" pattern="yyyy-MM-dd"/></td>
			<td>배송상태 : <c:choose>
				<c:when test ="${delivery.deliveryState == 'r'}">
					상품 준비중
				</c:when>
				<c:when test ="${delivery.deliveryState == 'd'}">
					배송중
				</c:when>
				<c:when test ="${delivery.deliveryState == 's'}">
					배송완료 
				</c:when>
				<c:otherwise>
					test
				</c:otherwise>
			</c:choose>
			</td>
		</tr>
		</c:if>
			<c:set var = "totalPrice" value="${totalPrice + (delivery.price * delivery.orderCount)}"/>
	</c:forEach>
</table>
</article>

<script>

</script>


