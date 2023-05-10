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


*{margin:0; padding:0;}
a{text-decoration:none;}
.wrap{padding:10px;}

.btn_open{font-weight:bold; margin:10px; padding:4px 6px; background:#000; color:#fff;}
.pop_wrap{position:fixed; top:0; left:0; right:0; bottom:0; background:rgba(0,0,0,.5); font-size:0; text-align:center;}
.pop_wrap:after{display:inline-block; height:100%; vertical-align:middle; content:'';}
.pop_wrap .pop_inner{display:inline-block; padding:30px 30px; background:#fff; width:300px; height:150px; vertical-align:middle; font-size:15px;}

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

<h3>신규 업체</h3>

<form action="confirm.do" method="get">
	<table class="table">
		<tr>
			<th>NO</th>
			<th>업체명</th>
			<th>사업자번호</th>
			<th>사업주</th>
			<th>전화번호</th>
			<th>주소</th>
			<th>업체등록</th>
		</tr>
		<c:set var="no" value="0"></c:set>
		<c:forEach var="com" items="${list }">
			<tr>
				<td><c:out value="${no=no+1}"></c:out></td>
				<td>${com.companyName}</td>
				<td>${com.crn}</td>
				<td>${com.name}</td>
				<td>${com.companyPhone}</td>
				<td>${com.companyAddr}</td>
				<td><a href="#pop_info_1" class="btn_open">업체 등록하기</a>
				</td>

				<!-- 팝업1 -->
				<div id="pop_info_1" class="pop_wrap" style="display: none;">
					<div class="pop_inner">
						<p class="dsc">등록하시겠습니까?</p>
						<button type="button"
							onclick="location.href='confirm.do?comNo=${com.companyNo}'">확인</button>
						<button type="button" class="btn_close">취소</button>
					</div>
				</div>
				<!-- 팝업1 -->
			</tr>
		</c:forEach>

	</table>
</form>

<script>
	var target = document.querySelectorAll('.btn_open');
	var btnPopClose = document.querySelectorAll('.pop_wrap .btn_close');
	var targetID;

	// 팝업 열기
	for (var i = 0; i < target.length; i++) {
		target[i].addEventListener('click', function() {
			targetID = this.getAttribute('href');
			document.querySelector(targetID).style.display = 'block';
		});
	}

	// 팝업 닫기
	for (var j = 0; j < target.length; j++) {
		btnPopClose[j].addEventListener('click', function() {
			this.parentNode.parentNode.style.display = 'none';
		});
	}
</script>