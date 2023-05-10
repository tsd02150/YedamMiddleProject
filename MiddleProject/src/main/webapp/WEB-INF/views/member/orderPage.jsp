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

</style>
<table class="mycontainer">
<tr>
<td>
<form action="orderPage.do" method="get">
<table class="table">
	<c:set var = "totalPrice" value = "0"/>
	<c:forEach var="order" items="${list}">
		<tr>
			<td><input type="checkbox" name="check" value="${order.orderNo}" checked></td>
			<td><!-- <a href="getNotice.do?page=${pageInfo.pageNum }&nNo=${notice.noticeNo}">--><a>품번 : ${order.productNo}</a></td>
			<td>제품명 : ${order.productName}</td>
			<td><img width="70px" src="images/${order.boardThumbnail}"></td>
			<td>가격 : ${order.price}</td>
			<td>주문 수량 : ${order.orderCount}</td>
			<td><button id="delbtn" type="button" name="orderNo" onClick="location.href='deleteOrder.do?orderNo=${order.orderNo }'">삭제</button>
		</tr>
			<c:set var = "totalPrice" value="${totalPrice + (order.price * order.orderCount)}"/>
	</c:forEach>
	<tr>
		<td>
			총 가격 : <c:out value="${totalPrice}" />
		</td>
	</tr>
	<tr>
	<td colspan="2" align="right">
		<button type="submit">주문</button>
	</tr>
</table>
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

<script>

</script>


