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
<form action="orderPage.do" method="post">
<table class="table" >
	<c:set var = "totalPrice" value = "0"/>
	<c:forEach var="order" items="${list}"> <!-- 체크된거만 받아오게  -->
		<tr>
			<td><input type="checkbox" name="check" value="${order.orderNo}" checked></td>
			<td><img width="70px" src="images/${order.boardThumbnail}"></td>
			<td><a>상품번호 : ${order.productNo}</a></td>
			<td>제품명 : ${order.productName}</td>
			<td>판매자 : ${order.price}</td>
			<td>주문 수량 : ${order.orderCount}</td>
			<td>배송비 : ${order.price}</td>
			<td>총 가격 : ${order.price}</td>
		</tr>
			<c:set var = "totalPrice" value="${totalPrice + (order.price * order.orderCount)}"/>
	</c:forEach>
	
	
	
	<table class="table" align="center">
		<tr>
			<th>이름</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${memberInfo.phone }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="adress" value="${memberInfo.adress }"></td>
		</tr>
		<tr>
			<th>쿠폰</th>
		</tr>
	</table>
	
	
	
	
	
	
	
	
	
	
		<tr>
			<td>
				총 가격 : <c:out value="${totalPrice}" />
			</td>
		</tr>
	<tr>
	<td colspan="2" align="right">
		<button type="submit">결제하기</button>
	</tr>
</table>
</form>
</td>
</tr>
</table>







<script>

</script>


