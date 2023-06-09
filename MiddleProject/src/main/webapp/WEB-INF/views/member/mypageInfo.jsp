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
	position: absolute;
    top: 90px;
    left: 0;
    height: 100%;
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

.myform {
	display:flex;
}
.myform button{
	margin-left: 110px;
    margin-top: 15px;
	border-radius: 17px;
	border-color:lightgray;
}
.myform table{
	width:300px !important;
}
.mycontainer{
    margin-top: 120px;
    margin-bottom: 100px;
    margin-left: auto;
    margin-right: auto;
}
.mycontainer tr {
}
.mycontainer td {

}
#tilesTable{
	
}



</style>
<table class="mycontainer">
<tr>
<td>
<c:choose>
<c:when test="${grade=='s'}">
<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
		<li class="sidebar-nav-item"><a href="sales.do">판매 내역<br>(매출현황)</a></li>
		<li class="sidebar-nav-item"><a href="prodNowList.do">상품현황</a></li>
		<li class="sidebar-nav-item"><a href="orderProdList.do">주문현황</a></li>
		<li class="sidebar-nav-item"><a href="orderDeliList.do">배송현황</a></li>
		<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>

	</ul>
</nav>
</c:when>
<c:otherwise>
<nav id="sidebar-wrapper" class="active">
	<ul class="sidebar-nav">
		<li class="sidebar-nav-item"><a href="myPage.do">기본 정보</a></li>
		<li class="sidebar-nav-item"><a href="myCart.do">장바구니</a></li>
		<li class="sidebar-nav-item"><a href="orderDetail.do">주문현황</a></li>
		<li class="sidebar-nav-item"><a href="wishList.do">관심상품</a></li>
		<li class="sidebar-nav-item"><a href="myQnaList.do">문의내역</a></li>
	</ul>
</nav>
</c:otherwise>
</c:choose>
</td>
<td>
<c:choose>
<c:when test="${grade=='c' }">
<form action="modifyMember.do" method="get" class="myform">

	<table class="table" >
		<tr>
			<th>이름</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>●●●●●●●●</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${memberInfo.phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${memberInfo.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${memberInfo.adress}</td>
		</tr>
		<!-- <tr>
			<th>쿠폰</th>
			<td>1개</td>
		</tr> -->
		<tr>
			<td colspan="2" align="center">
				<button type="submit">수정</button>
		</tr>
	</table>
</form>
</c:when>
<c:when test="${grade=='s' }">
<form action="modifyMember.do" method="get" class="myform">

	<table class="table">
		<tr>
			<th>이름</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th>아이디</th>
			<td>${id }</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>●●●●●●●●</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${memberInfo.phone }</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>${memberInfo.email }</td>
		</tr>
		<tr>
			<th>주소</th>
			<td>${memberInfo.adress}</td>
		</tr>
		<!-- <tr>
			<th>dsdads쿠폰</th>
			<td>1개</td>
		</tr> -->
	
	</table>
	<table class="table">
		<tr>
			<th>사업장 이름</th>
			<td>${companyInfo.companyName }</td>
		</tr>
		<tr>
			<th>사업주</th>
			<td>${name }</td>
		</tr>
		<tr>
			<th>사업자 번호</th>
			<td>${companyInfo.crn }</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>${companyInfo.companyPhone }</td>
		</tr>
		
		<tr>
			<th>사업장 주소</th>
			<td>${companyInfo.companyAddr}</td>
		</tr>
		<tr><td>
		<button type="submit">수정</button>
		
		</td></tr>
	</table>
</form>
</c:when>
</c:choose>
</td>
</tr>
</table>


