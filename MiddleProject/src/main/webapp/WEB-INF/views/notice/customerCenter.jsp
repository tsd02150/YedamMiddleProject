<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 반복문태그 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
.all {
	margin: 0 auto;
	padding: 50px;
}

/* 팝업창 */
.modal {
	display: none;
	position: fixed;
	z-index: 1;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.4);
}

.modal-content {
	background-color: #fefefe;
	margin: auto;
	padding: 20px;
	border: 1px solid #888;
	width: 80%;
	max-width: 600px;
}

.close {
	color: #aaaaaa;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}


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
		<li class="sidebar-nav-item"><a href="customerCenter.do">고객센터</a></li>
		<li class="sidebar-nav-item"><a href="noti.do">공지사항</a></li>
		<li class="sidebar-nav-item"><a href="#">자주하는 질문</a></li>
	</ul>
</nav>

<br>
<br>
<h3>고객센터</h3>

<c:set var="no" value="0"></c:set>
<form id="all" action="getCustomer.do" method="post">
	<table class="table">
		<c:choose>
			<c:when test="${id!=null && !id.equals('admin') }">
				<tr>
					<td colspan="4" align="right">
						<button type="button" onclick="location.href='customerAddForm.do'">문의하기</button>
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
				<!-- 팝업창 -->
				<div id="modal" class="modal" style="display: none">
					<div class="modal-content">
						<span class="close">&times;</span>
						<p>비밀번호를 입력하세요.</p>
						<input type="password" name="pass">
						<button type="submit">확인</button>
					</div>
				</div>
				<td><a id="viewContent" href="getCustomer.do?no=${notice.noticeNo}">${notice.noticeTitle }</a></td>
				<td>${notice.name }</td>
				<td><fmt:formatDate pattern="yyyy-MM-dd"
						value="${notice.noticeDate }" /></td>
			</tr>
		</c:forEach>
	</table>
</form>
<!-- 
<script>
	const modal = document.getElementById("modal");
	const open = document.getElementById("viewContent");
	const closeBtn = document.getElementsByClassName("close")[0];

	open.addEventListener('click',function(){
		modal.style.display = "block"; /*팝업 보이기 */
	});

	closeBtn.onclick = function() {
		modal.style.display = "none"; // x클릭시-모달 팝업 숨기기
	}

	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none"; //팝업 숨기기
		}
	}
	
</script> -->
