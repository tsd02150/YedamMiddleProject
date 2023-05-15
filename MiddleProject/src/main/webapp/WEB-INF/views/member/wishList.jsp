<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
    height: 100%;
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

.wish-td{
	padding-left: 235px;
	width: 1000px;
	text-align: center;
}

.wish-form{
	padding-top: 20px;
	border-bottom: black solid 2px;
	margin-bottom: 20px;
}
.wish-title-tr{
	border-bottom: black solid 2px;
	font-size: large;
	font-weight: bold;
}
.wish-title-tr td{
	padding-bottom: 20px;
}

.wish-content-tr td{
	padding-top: 10px;
}

.table-wishList{
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
    vertical-align: baseline;
    border-color: #dee2e6;
		text-align: center;
		font-size: large;
}
.quick-menu {
    position: fixed;
    top: 35%;
    right: 0;
    z-index: 101;
    box-sizing: border-box;
    width: 140px;
    padding: 34px 19px 29px;
    border: 1px solid #e2e2e2;
    border-radius: 10px 0 0 10px;
    background: #fff;
    transform: translateY(-50%);
		color: black;
}
.quick-menu li{
	color: black;
}
.sidebar-nav-top{
	padding-top: 40px;
}

.right-sidebar{
	color: black;
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

.sidebar-right-nav {
   top: 0;
   margin: 0;
   padding: 0;
   list-style: none;
}

.sidebar-right-nav li.sidebar-right-item a {
   display: block;
   text-decoration: none;
   padding: 15px;
}

.sidebar-right-nav li a:hover {
   text-decoration: none;
   background: rgba(255, 255, 255, 0.2);
}

.sidebar-right-nav li a:active, .sidebar-right-nav li a:focus {
   text-decoration: none;
}

.sidebar-right-nav>.sidebar-brand {
   font-size: 1.2rem;
   background: rgba(52, 58, 64, 0.1);
   height: 80px;
   line-height: 50px;
   padding-top: 15px;
   padding-bottom: 15px;
   padding-left: 15px;
}

.sidebar-nav>.sidebar-brand a {
   text-decoration: none;
}

.sidebar-nav>.sidebar-brand a:hover {
   background: none;
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
<td class="wish-td">
	<form action="#" method="get" class="wish-form">
		<table class="table-wishList">
				<tr class="wish-title-tr">
					<td>NO</td>
					<td></td>
					<td>Name</td>
					<td></td>
					<td>가격</td>
					<td>수량</td>
					<td>분류</td>
					<td></td>
			<c:forEach var="wish" items="${list}">
				<tr class="wish-content-tr">
					<td><c:out value="${no=no+1 }"></c:out></td>
					<td><a href="getBoard.do?bno=${wish.boardNo}"><img width="70px"  src="images/${wish.boardThumbnail}"></a></td>
					<td>${wish.productName}</td>
					<td><img style="width:70px;" src="images/${wish.boardThumbnail}"></td>
					<td>${wish.price}</td>
					<td>${wish.productCount}</td>
					<td>${wish.subCategoryName}</td>
					<td colspan="2" align="center"><button type="submit">문의하기</button></td>
				</tr>
			</c:forEach>
		</table>
		<div class="right-sidebar">
			<c:choose>
				<c:when test="${grade=='c'}">
				<nav class="quick-menu" class="active">
					<ul class="sidebar-right-nav">
						<li class="sidebar-right-item"><a href="#">장바구니</a></li>
						<li class="sidebar-right-item"><a href="#">관심상품</a></li>
						<li class="sidebar-right-item"><a href="#">주문/배송</a></li>
						<li class="sidebar-right-item"><a href="#">문의내역</a></li>
						<li class="sidebar-nav-top"><a href="#">TOP</a></li>
					</ul>
				</nav>
				</c:when>
				<c:when test="${grade=='s'}">
				<nav class="quick-menu" class="active">
					<ul class="sidebar-right-nav">
						<li class="sidebar-right-item"><a href="#">판매등록</a></li>
						<li class="sidebar-right-item"><a href="#">목록/관리</a></li>
						<li class="sidebar-right-item"><a href="#">주문/배송</a></li>
						<li class="sidebar-right-item"><a href="#">문의내역</a></li>
						<li class="sidebar-right-top"><a href="#">TOP</a></li>
					</ul>
				</nav>
			</c:when>
			</c:choose>
		</div>
	</form>
	<div class="center">
		<div class="pagination">
			<c:if test="${pageInfo.prev }">
				<a href="wishList.do?page=${pageInfo.startPage-1 }">Previous</a>
			</c:if>
			<c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
				<a class="${i == pageInfo.pageNum ? 'active' : '' }" href="wishList.do?page=${i}">${i } </a>
			</c:forEach>
			<c:if test="${pageInfo.next }">
				<a href="wishList.do?page=${pageInfo.endPage+1 }">Next</a>
			</c:if>
		</div>
	</div>
</td>
</tr>
</table>

