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
</style>

<!-- 	<aside>
		<nav id="sidebar-wrapper" class="active">
			<ul class="sidebar-nav">
				<li class="sidebar-nav-item"><a href="memberInfo.do">기본 정보</a></li>
				<li class="sidebar-nav-item"><a href="#page-top">장바구니</a></li>
				<li class="sidebar-nav-item"><a href="#about">주문현황</a></li>
				<li class="sidebar-nav-item"><a href="#services">배송현황</a></li>
				<li class="sidebar-nav-item"><a href="#portfolio">관심상품</a></li>
				<li class="sidebar-nav-item"><a href="CSList.do">문의내역</a></li>
			</ul>
		</nav>

	</aside> -->
	

		<h3>자주묻는 질문</h3>
		<c:set var="no" value="0"></c:set>

			<table class="table">
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성날짜</th>
				</tr>
				<c:forEach var="notice" items="${faqList }">
					<tr>
						<td><c:out value="${no=no+1}"></c:out></td>
						<td>${notice.noticeTitle }</td>
						<td>${notice.name }</td>
						<td><fmt:formatDate pattern="yyyy-MM-dd"
								value="${notice.noticeDate }" /></td>
					</tr>
				</c:forEach>
			</table>
