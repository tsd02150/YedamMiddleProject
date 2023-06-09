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
	height: 97%;
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

* {
	margin: 0;
	padding: 0;
}

a {
	text-decoration: none;
}

.wrap {
	padding: 10px;
}

.btn_open {
	font-weight: bold;
	margin: 10px;
	padding: 4px 6px;
	background: #fff;
	color: #000;
}

.pop_wrap {
	position: fixed;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background: rgba(0, 0, 0, .5);
	font-size: 0;
	text-align: center;
}

.pop_wrap:after {
	display: inline-block;
	height: 100%;
	vertical-align: middle;
	content: '';
}

.pop_wrap .pop_inner {
	display: inline-block;
	padding: 30px 30px;
	background: #fff;
	width: 300px;
	height: 150px;
	vertical-align: middle;
	font-size: 15px;
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
	background-color: #3b5d50;
	color: white;
	border: 1px solid #3b5d50;
}

.pagination a:hover:not(.active) {
	background-color: #ddd;
}
</style>


<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="adminMember.do">회원관리</a></li>
		<li class="sidebar-nav-item"><a href="adminCompany.do">업체관리</a></li>
		<li class="sidebar-nav-item"><a href="newCompany.do">신규업체</a></li>
	</ul>
</nav>

<article>
	<br>
	<h3>회원관리</h3>
	<br>
	<form action="adminDelMember.do" method="get">
		<table class="table">
			<tr>
				<th>NO</th>
				<th>분류</th>
				<th>이름</th>
				<th>성별</th>
				<th>아이디</th>
				<th>이메일</th>
				<th>전화번호</th>
				<th>삭제</th>

			</tr>
			<c:set var="no" value="0"></c:set>
			<c:forEach var="mem" items="${list }" varStatus="m">
				<tr>
					<td><c:out value="${no=no+1}"></c:out></td>
					<c:choose>
						<c:when test="${mem.grade.equals('c') }">
							<td>구매회원</td>
						</c:when>
						<c:otherwise>
							<td>판매회원</td>
						</c:otherwise>
					</c:choose>
					<td>${mem.name}</td>
					<c:choose>
						<c:when test="${mem.gender.equals('m') }">
							<td>남</td>
						</c:when>
						<c:otherwise>
							<td>여</td>
						</c:otherwise>
					</c:choose>
					<td>${mem.id}</td>
					<td>${mem.email}</td>
					<td>${mem.phone}</td>
					<td><a href="#pop_info_${m.count }" class="btn_open">회원삭제</a></td>
					<!-- 팝업1 -->
					<div id="pop_info_${m.count }" class="pop_wrap"
						style="display: none;">
						<div class="pop_inner">
							<p class="dsc">회원을 삭제하시겠습니까?</p>
							<button type="button"
								onclick="location.href='adminDelMember.do?memNo=${mem.memberNo}'">삭제</button>
							<button type="button" class="btn_close">취소</button>
						</div>
					</div>
					<!-- 팝업1 -->
				</tr>
			</c:forEach>
		</table>
	</form>
	<hr>
	<div class="center">
		<div class="pagination">
			<c:if test="${pageInfo.prev}">
				<a href="adminMember.do?page=${pageInfo.startPage-1 }">Prev</a>
			</c:if>
			<c:forEach var="i" begin="${pageInfo.startPage }"
				end="${pageInfo.endPage }">
				<a href="adminMember.do?page=${i }"
					class=${i==pageInfo.pageNum?'active':'' }>${i }</a>
			</c:forEach>
			<c:if test="${pageInfo.next}">

				<a href="adminMember.do?page=${pageInfo.endPage+1 }">Next</a>
			</c:if>
		</div>
	</div>
</article>

<script>
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;

	// 팝업 열기
	for (var i = 0; i < target.length; i++) {
		target[i].addEventListener('click', function() {
			targetID = this.getAttribute('href');
			document.querySelector(targetID).style.display = 'block';
			console.log(document.querySelector(targetID));
		});
	}

	// 팝업 닫기
	for (var j = 0; j < target.length; j++) {
		btnPopClose[j].addEventListener('click', function() {
			this.parentNode.parentNode.style.display = 'none';
		});
	}
</script>
