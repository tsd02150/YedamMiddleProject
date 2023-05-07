<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<p>productList</p>
<table>
<c:forEach var="productList" items="${productList}">
<tr>
<c:choose><c:when test="${companyNo == productList.companyNo }">
	<td>${productList.companyNo }</td>
	<td>productNo : </td>
	<td>${productList.productNo }</td>
	<td>productName : </td>
	<td>${productList.productName }</td>
	<td>Price : </td>
	<td>${productList.price }</td>
	<td>수량 : </td>
	<td>${productList.productCount }</td>
	<td>
		<button type="submit" class="button button1">수정</button>
		<button type="reset" class="button button2">삭제</button>
	</td>
	</c:when></c:choose>
</tr>


</c:forEach>
</table>
<div class="center">
  <div class="pagination">
    <c:if test="${pageInfo.prev}">
      <a href="productList.do?page=${pageInfo.startPage-1}">Previous</a>
    </c:if>
    <c:forEach var="i" begin="${pageInfo.startPage }" end="${pageInfo.endPage }">
      <a class="${i == pageInfo.pageNum ? 'active' : '' }" href="productList.do?page=${i}">${i}</a>
    </c:forEach>
    <c:if test="${pageInfo.next }">
      <a href="productList.do?page=${pageInfo.endPage+1 }">Next</a>
    </c:if>
  </div>
</div>
<script>
</script>