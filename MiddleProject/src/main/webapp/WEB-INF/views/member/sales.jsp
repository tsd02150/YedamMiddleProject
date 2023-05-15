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
.center {
	text-align: center;
}

.pagination {
	display: inline-block;
}

.pagination a {
	color: black;
	float: left;
	padding: 8px 16px;
	text-decoration: none;
	transition: background-color .3s;
	border: 1px solid #ddd;
	margin: 0 4px;
}

.pagination a.active {
	background-color: #4CAF50;
	color: white;
	border: 1px solid #4CAF50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}





</style>
<table class="mycontainer">
<tr>
<td>
<c:choose>
<c:when test="${grade=='s'}">
<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
		<li class="sidebar-nav-item"><a href="sales.do">판매 내역<br>(매출현황)</a></li>
		<li class="sidebar-nav-item"><a href="prodNowList.do">상품현황</a></li>
		<li class="sidebar-nav-item"><a href="orderProdList.do">주문현황</a></li>
		<li class="sidebar-nav-item"><a href="orderDeliList.do">배송현황</a></li>
		<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
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
</td>
<td>
<table class="table">
	<thead>
		<tr>
			<th>No</th>
			<th>주문번호</th>
			<th>주문날짜</th>
			<th></th>
			<th>제품명</th>
			<th>단가</th>
			<th>주문량</th>
			<th>주문금액</th>
		</tr>
		
	</thead>
	<c:set var = "totalPrice" value = "0"/>
	<c:forEach var="sales" items="${sales}">
	<c:if test="${sales.deliveryState =='s'}">
		<tr class="table">
			<td><c:out value="${no=no+1 }"></c:out></td>
			<td>${sales.orderNo}</td>
			<td><fmt:formatDate value="${sales.orderDate}" pattern="yyyy-MM-dd"/></td>
			<td><img width="70px" src="images/${sales.boardThumbnail}"></td>
			<td>${sales.productName}</td>
			<td>${sales.price}</td>
			<td>${sales.orderCount}</td>
			<td>${sales.orderCount * sales.price}</td>
			<c:set var="totalPrice"
						value="${totalPrice + (sales.price * sales.orderCount)}" />
			
			<!--  <td><button id="delbtn" type="button" name="pno"
			onClick="location.href='deleteNowProduct.do?pno=${productNow.productNo }'">삭제</button>
			-->
		</tr>
	</c:if>
	</c:forEach>
	<tr><td>월 매출 : ${totalPrice}</td></tr>
	
	
</table>
</td>
</tr>
</table>

<script>

</script>


