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
</style>
<div class="mycontainer">

<!--<c:if>-->
<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
		<li class="sidebar-nav-item"><a href="order.do">장바구니</a></li>
		<li class="sidebar-nav-item"><a href="#about">주문현황</a></li>
		<li class="sidebar-nav-item"><a href="#services">배송현황</a></li>
		<li class="sidebar-nav-item"><a href="#portfolio">관심상품</a></li>
		<li class="sidebar-nav-item"><a href="CSList.do">문의내역</a></li>
	</ul>
</nav>
<!--</c:if> -->
	<table class="table">
	<thead>
		<tr>
			<th>문의번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>답변상황</th>
		</tr>
	</thead>
	<c:forEach var="qna" items="${list}">
		<tr>
			<td><a href="getqna.do?page=${pageInfo.pageNum }&nNo=${qna.qnaNo}">${qna.qnaNo}</a></td>
			<td>${qna.qnaTitle}</td>
			<td>${qna.qnaWriter}</td>
			<td>${qna.qnaDate}</td>
		</tr>
	</c:forEach>
</table>
</div>

