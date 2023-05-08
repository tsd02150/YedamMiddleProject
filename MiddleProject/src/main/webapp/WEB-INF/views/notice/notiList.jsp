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
</style>


<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="customerCenter.do">고객센터
				문의</a></li>
		<li class="sidebar-nav-item"><a href="noti.do">공지사항</a></li>
		<li class="sidebar-nav-item"><a href="#">자주하는 질문</a></li>
	</ul>
</nav>

<br>
<br>

<h3>공지사항</h3>
<c:set var="no" value="0"></c:set>
<form action="getNoti.do" method="post">
	<table class="table">
		<c:choose>
			<c:when test="${id.equals('admin')}">
				<tr>
					<td colspan="4" align="right">
						<button type="button" onclick="location.href='addNotiForm.do'">공지등록</button>
					</td>
				</tr>
			</c:when>
		</c:choose>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성날짜</th>
		</tr>
		<c:forEach var="notice" items="${list }">
			<tr>
				<td><c:out value="${no=no+1}"></c:out></td>
				<td><a id="view" href="getNoti.do?no=${notice.noticeNo}">${notice.noticeTitle }</a></td>
				<td>관리자</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${notice.noticeDate }" /></td>
			</tr>
		</c:forEach>


	</table>
</form>