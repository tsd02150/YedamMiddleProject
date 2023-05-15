<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<style>
@import
url("https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700,300italic,400italic,700italic")
body {
width:100%
height:100%

}

body {
display:flex !important;
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
table{
    display: inline-table;
}
.mycontainer{
	width:100%;
	
}
.table2{
	    position: relative;
    width: 80%;
    display: inline-table;
    margin-left: 220px;
    margin-top: 20px;
    text-align: center;
}
.table2 tr td{
	padding:10px;
}
#delbtn {
	    border-radius: 13px;
	    border-color:lightgray;
}
.table2 tr{
	border-bottom : 1px solid lightgray;
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
<table class="table2">
	<c:set var = "totalPrice" value = "0"/>
	<c:forEach var="productNow" items="${productNowInfo}">
		<tr class="table">
			<td><c:out value="${no=no+1 }"></c:out></td>
			<td>상품 번호 : ${productNow.productNo}</td>
			<td>제품명 : ${productNow.productName}</td>
			<td>남은 수량 : ${productNow.productCount}</td>
			<td>메인 카테고리 : ${productNow.mainCategoryName}</td>
			<td>서브 카테고리 : ${productNow.subCategoryName}</td>
			<td><button id="delbtn" type="button" name="pno"
			onclick="delConfirm(${productNow.productNo})">삭제</button>
		</tr>
	</c:forEach>
</table>
</td>
</tr>
</table>

<script>
	
 	function delConfirm(a){
 		if (confirm("삭제된 물품은 다시 등록 하셔야 합니다 \n삭제하시겠습니까?")) {
 			if (confirm("정말 삭제하시겠습니까?")) {
 	 			alert("삭제 되었습니다.");
 	 			return (location.href='deleteNowProduct.do?pno='+a);
 	        } else {
 	        	alert("취소 되었습니다.");
 	 		}
        } else {
        	alert("취소 되었습니다.");
 		}
 	}
	
	
</script>


