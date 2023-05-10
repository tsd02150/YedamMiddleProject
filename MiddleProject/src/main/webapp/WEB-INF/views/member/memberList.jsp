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


	<nav id="sidebar-wrapper" class="active">
		<ul class="sidebar-nav">
			<li class="sidebar-nav-item"><a href="adminMember.do">회원관리</a></li>
			<li class="sidebar-nav-item"><a href="adminCompany.do">업체관리</a></li>
			<li class="sidebar-nav-item"><a href="newCompany.do">신규업체</a></li>
			<li class="sidebar-nav-item"><a href="#">매출관리</a></li>
		</ul>
	</nav>
<br>
<br>

<h3>회원관리</h3>

<table class="table">
	<tr>
		<th>NO</th>
		<th>이름</th>
		<th>성별</th>
		<th>아이디</th>
		<th>이메일</th>
		<th>전화번호</th>
		<th>비고</th>
		
	</tr>
	<c:set var="no" value="0"></c:set>
	<c:forEach var="mem" items="${list }">
		<tr>
			<td><c:out value="${no=no+1}"></c:out></td>
			<td>${mem.name}</td>
			<td>${mem.gender}</td>
			<td>${mem.id}</td>
			<td>${mem.email}</td>
			<td>${mem.phone}</td>
			<td></td>
		</tr>
	</c:forEach>

</table>