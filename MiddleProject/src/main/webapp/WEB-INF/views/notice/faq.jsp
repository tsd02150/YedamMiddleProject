<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 반복문태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
article {
	margin: 0 auto;
	padding: 50px;
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
	background-color: #FF4466;
	color: white;
	border: 1px solid #FF4466;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>
<h3>자주묻는 질문</h3>
<c:set var="no" value="0"></c:set>

<table class="table">
	<tr>
		<th>번호</th>
		<th style="width:600px;">제목</th>
		<th>작성자</th>
		<th>작성날짜</th>
	</tr>
	<c:forEach var="notice" items="${faqList }">
		<tr class=item>
			<td><c:out value="${no=no+1}"></c:out></td>
			<td>${notice.noticeTitle }</td>
			<td>${notice.name }</td>
			<td><fmt:formatDate pattern="yyyy-MM-dd"
					value="${notice.noticeDate }" /></td>
		</tr>
		<tr style="display:none;"><td></td><td>${notice.noticeContent }</td><td></td><td></td></tr>
	</c:forEach>
</table>
<hr>
<div class="center">
	<div class="pagination">
		<c:if test="${pageInfo.prev}">
			<a href="faq.do?page=${pageInfo.startPage-1 }">Prev</a>
		</c:if>
		<c:forEach var="i" begin="${pageInfo.startPage }"
			end="${pageInfo.endPage }">
			<a href="faq.do?page=${i }" class=${i==pageInfo.pageNum?'active':'' } >${i }</a>
		</c:forEach>
		<c:if test="${pageInfo.next}">
			<a href="faq.do?page=${pageInfo.endPage+1 }">Next</a>
		</c:if>
	</div>
</div>

<script>
	let items = document.querySelectorAll('.item');
	items.forEach(function(item){
		item.addEventListener('click',function(){
			if(document.querySelector('.table').children[0].children[item.children[0].innerText * 2].style.display=="none"){
				document.querySelector('.table').children[0].children[item.children[0].innerText * 2].style.removeProperty( 'display' );
			}else{
				document.querySelector('.table').children[0].children[item.children[0].innerText * 2].style="display:none";
			}
		})
	});
</script>